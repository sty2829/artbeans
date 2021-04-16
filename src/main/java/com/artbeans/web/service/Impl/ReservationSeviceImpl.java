package com.artbeans.web.service.Impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.api.iamport.Cancel;
import com.artbeans.web.api.iamport.Iamport;
import com.artbeans.web.api.iamport.IamportResult;
import com.artbeans.web.api.iamport.Payment;
import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.entity.TicketCancelInfo;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;
import com.artbeans.web.repository.PaymentInfoRepository;
import com.artbeans.web.repository.ReservationTicketRepository;
import com.artbeans.web.service.ReservationService;
import com.artbeans.web.util.CodeGenerator;
import com.artbeans.web.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationSeviceImpl implements ReservationService {
	
	@Autowired
	private ExhibitionReservationInfoRepository eriRepo;
	
	@Autowired
	private ReservationTicketRepository rtiRepo;
	
	@Autowired
	private PaymentInfoRepository piRepo;
	
	@Autowired
	private Iamport iamport;

	@Override
	public ReservationSchedule getReservationSchedule(Integer eiNum) {
		//전시회 PK로 전시회스케쥴 호출
		com.artbeans.web.dto.ReservationSchedule rs = eriRepo.getReservationSchedule(eiNum);
		log.info("rs => {}", rs);
		
		//mindate 계산후 반환
        return DateUtil.getMinDate(rs);
	}
	
	@Override
	public Map<String,Integer> getReservationTimeMap(Integer eriNum, String dateStr) {
		//스트링날짜 데이트로 변환
		Date date = DateUtil.StringToDate(dateStr);
		//해당 전시회 예약정보 호출
		ExhibitionReservationInfo eri = eriRepo.findById(eriNum).get();
		//해당 전시회 예약정보키 와 해당 날짜로 시간대별 티켓합 리스트 호출
		List<SumTicketTime> sttList = rtiRepo.sumTicketGroupByTime(eriNum, date);
		//전시회예약정보와 시간대별 티켓합산 리스트로 시간대별 리스트 구성
		return  DateUtil.getTimeList(eri, sttList);
	}
	
	@Override
	public ReservationTicketInfo saveReservation(ReservationTicketInfo rti, Integer eriNum) {
		//전시회정보 조회
		ExhibitionReservationInfo eri = eriRepo.findById(eriNum).get();
		Integer eiCharge = eri.getExhibitionInfo().getEiCharge();
		Integer rtiNumber = rti.getRtiNumber();
		Integer piPrice = rti.getPaymentInfo().getPiPrice();
		
		//DB에 저장된 관람료와 예매수가 결제금액 일치하는지 확인
		if(piPrice != (eiCharge * rtiNumber)) {
			throw new RuntimeException("가격이 불일치 합니다.");
		}
		//merchantId 생성
		rti.getPaymentInfo().setPiMerchantId(CodeGenerator.getPaymentCode());
		log.info("rti => {}", rti);
		return rtiRepo.save(rti);
	}


	@Override
	public List<ReservationTicketInfo> getReservations(ReservationTicketInfo rti) {
		return rtiRepo.findAll();
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
		paymentInfo.getReservationTicketInfo().setRtiState("CONFIRM");
		piRepo.save(paymentInfo);
		
		return 1;
	}
	
	@Override
	public int cancleReservation(Integer rtiNum) {
		//예약티켓 pk로 결제 MerchantId 조회
		ReservationTicketInfo rti = rtiRepo.findById(rtiNum).get();
		//결제정보 MerchantId 로 캔슬요청
		IamportResult<Cancel> cancel = iamport.canclePaymentByMerchantId(rti.getPaymentInfo().getPiMerchantId());
		String cancleStatus = cancel.getResponse().getStatus();
		//iamport 응답 결제상태 비교
		if(!"cancelled".equals(cancleStatus)) {
			throw new RuntimeException("결제상태가 취소되지 않았습니다.");
		}
		//예매와 결제상태 캔슬로변경
		rti.setRtiState("CANCEL");
		rti.getPaymentInfo().setPiState("CANCEL");
		
		rtiRepo.save(rti);
		
		return 1;
		
	}
	
}
