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
		if(userSession != null && userSession.getUiNum() != null) {
			Optional<UserInfo> opUI = uiRepo.findById(userSession.getUiNum());
			if(!opUI.isEmpty() && ti != null) {
				ti.setUserInfo(opUI.get());
			}
			//전시회정보 조회
			Optional<ReservationInfo> opRI = riRepo.findById(riNum);
			
			if(!opRI.isEmpty() && ti.getUserInfo() != null) {
				ReservationInfo ri = opRI.get();
				Integer eiCharge = ri.getExhibitionInfo().getEiCharge();
				Integer rtiNumber = ti.getTiNumber();
				Integer piPrice = ti.getPaymentInfo().getPiPrice();
				
				//DB에 저장된 관람료와 예매수가 결제금액 일치하는지 확인
				if(piPrice != (eiCharge * rtiNumber)) {
					throw new RuntimeException("가격이 불일치 합니다.");
				}
				
				//merchantId 생성
				ti.getPaymentInfo().setPiMerchantId(CodeGenerator.getPaymentCode());
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
		//아임포트 impUid 로 서버조회
		IamportResult<Payment> iamportPayment = iamport.getPaymentByImpId(impId);
		
		//아임포트에 결제된 결제금액
		BigDecimal iamportAmount = iamportPayment.getResponse().getAmount();
		
		//merchantId 결제정보 조회
		PaymentInfo paymentInfo = piRepo.findByPiMerchantId(merchantId);
		
		//데이터베이스에 저장된 결제금액 
		Integer piPrice = paymentInfo.getPiPrice();
		
		if(!iamportAmount.equals(new BigDecimal(piPrice))) {
			//결제정보 불일치시  아임포트에 취소요청
			IamportResult<Cancel> cancle = iamport.canclePaymentByImpId(impId);
			if(!"cancelled".equals(cancle.getResponse().getStatus())){
				log.info("결제상태가 취소되지 않았습니다.");
			}
			throw new RuntimeException("결제정보가 일치하지 않습니다");
		}
		
		//결제상태 예약상태 컨펌으로 변경
		paymentInfo.setPiState("CONFIRM");
		paymentInfo.getTicketInfo().setTiState("CONFIRM");
		piRepo.save(paymentInfo);
		
		return 1;
	}
	
	@Override
	public int cancleReservation(Integer tiNum) {
		//예약티켓 pk로 결제 MerchantId 조회
		TicketInfo ti = tiRepo.findById(tiNum).get();
		//결제정보 MerchantId 로 캔슬요청
		IamportResult<Cancel> cancel = iamport.canclePaymentByMerchantId(ti.getPaymentInfo().getPiMerchantId());
		String cancleStatus = cancel.getResponse().getStatus();
		//iamport 응답 결제상태 비교
		if(!"cancelled".equals(cancleStatus)) {
			throw new RuntimeException("결제상태가 취소되지 않았습니다.");
		}
		//예매와 결제상태 캔슬로변경
		ti.setTiState("CANCEL");
		ti.getPaymentInfo().setPiState("CANCEL");
		
		tiRepo.save(ti);
		
		return 1;
		
	}

	@Override
	public List<UserTicketDTO> getProgressTicketList(Integer uiNum) {
		return tiRepo.findAllProgressUserTicket(uiNum);
	}


	@Override
	public Page<UserTicketDTO> getPastTicketList(Integer uiNum, Pageable pageable) {
		return tiRepo.findAllPastUserTicket(uiNum, pageable);
	}
	

	
}
