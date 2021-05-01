package com.artbeans.web.service.Impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.api.iamport.Cancel;
import com.artbeans.web.api.iamport.Iamport;
import com.artbeans.web.api.iamport.IamportResult;
import com.artbeans.web.api.iamport.Payment;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.entity.TicketInfo;
import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.PaymentInfoRepository;
import com.artbeans.web.repository.ReservationInfoRepository;
import com.artbeans.web.repository.TicketInfoRepository;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.TicketService;
import com.artbeans.web.util.CodeGenerator;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TicketSeviceImpl implements TicketService {
	
	
	@Autowired
	private UserInfoRepository uiRepo;
	
	@Autowired
	private ReservationInfoRepository riRepo;
	
	@Autowired
	private TicketInfoRepository tiRepo;
	
	@Autowired
	private PaymentInfoRepository piRepo;
	
	@Autowired
	private Iamport iamport;
	
	@Override
	public TicketInfo saveTicket(UserSession userSession, TicketInfo ti, Integer riNum) {
		Optional<UserInfo> opUI = uiRepo.findById(userSession.getUiNum());
		if(!opUI.isEmpty() && ti != null) {
			ti.setUserInfo(opUI.get());
			
			Optional<ReservationInfo> opRI = riRepo.findById(riNum);
			if(!opRI.isEmpty()) {
				ReservationInfo ri = opRI.get();
				Integer eiCharge = ri.getExhibitionInfo().getEiCharge();
				Integer rtiNumber = ti.getTiNumber();
				Integer piPrice = ti.getPaymentInfo().getPiPrice();
				
				if(!piPrice.equals(eiCharge * rtiNumber)) {
					throw new RuntimeException("가격이 불일치 합니다.");
				}
				
				ti.getPaymentInfo().setPiMerchantId(CodeGenerator.getPaymentCode());
				
				if(piPrice == 0) {
					ti.setTiState("CONFIRM");
					ti.getPaymentInfo().setPiState("CONFIRM");
				}
				return tiRepo.save(ti);
			}
		}
		return null;		
	}


	@Override
	public List<TicketInfo> getReservations(TicketInfo ti) {
		return tiRepo.findAll();
	}


	
	@Override
	public int confirmReservation(String impId, String merchantId) {
		int count = 0;
		
		if(impId != null && merchantId != null) {
			IamportResult<Payment> iamportPayment = iamport.getPaymentByImpId(impId);
			
			BigDecimal iamportAmount = iamportPayment.getResponse().getAmount();
			
			PaymentInfo paymentInfo = piRepo.findByPiMerchantId(merchantId);
			
			Integer piPrice = paymentInfo.getPiPrice();
			
			if(!iamportAmount.equals(new BigDecimal(piPrice))) {
				IamportResult<Cancel> cancle = iamport.canclePaymentByImpId(impId);
				if(!"cancelled".equals(cancle.getResponse().getStatus())){
					log.info("결제상태가 취소되지 않았습니다.");
				}
				throw new RuntimeException("결제정보가 일치하지 않습니다");
			}
			
			paymentInfo.setPiState("CONFIRM");
			
			paymentInfo.getTicketInfo().setTiState("CONFIRM");
			
			count = piRepo.save(paymentInfo).getPiNum();
		
		}
		
		return count;
	}
	
	@Override
	public int cancleReservation(Integer tiNum) {
		int count = 0;
		
		Optional<TicketInfo> opTI = tiRepo.findById(tiNum);
		if(!opTI.isEmpty()) {
			TicketInfo ti = tiRepo.findById(tiNum).get();
			
			if(ti.getPaymentInfo().getPiPrice() != 0) {
				
				IamportResult<Cancel> cancel = iamport.canclePaymentByMerchantId(ti.getPaymentInfo().getPiMerchantId());
				String cancleStatus = cancel.getResponse().getStatus();
				if(!"cancelled".equals(cancleStatus)) {
					throw new RuntimeException("결제상태가 취소되지 않았습니다.");
				}
				ti.setTiState("CANCEL");
				ti.getPaymentInfo().setPiState("CANCEL");
				
				count = tiRepo.save(ti).getTiNum();
			}else {
				ti.setTiState("CANCEL");
				ti.getPaymentInfo().setPiState("CANCEL");
				count = tiRepo.save(ti).getTiNum();
			}
		}
		
		return count;
		
	}

	@Override
	public List<UserTicketDTO> getProgressTicketList(UserSession userSession) {
		return tiRepo.findAllProgressUserTicket(userSession.getUiNum());
	}


	@Override
	public Page<UserTicketDTO> getPastTicketList(UserSession userSession, Pageable pageable) {
		return tiRepo.findAllPastUserTicket(userSession.getUiNum(), pageable);
	}
	

	
}
