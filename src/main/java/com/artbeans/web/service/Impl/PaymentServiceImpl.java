package com.artbeans.web.service.Impl;

import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.api.iamport.Iamport;
import com.artbeans.web.api.iamport.IamportResult;
import com.artbeans.web.api.iamport.Payment;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;
import com.artbeans.web.repository.PaymentInfoRepository;
import com.artbeans.web.service.PaymentService;
import com.artbeans.web.util.CodeGenerator;
import com.artbeans.web.vo.PaymentVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private Iamport iamport;
	
	@Autowired
	private PaymentInfoRepository piRepo;
	
	@Autowired
	private ExhibitionReservationInfoRepository eriRepo;
	
	@Override
	public PaymentInfo savePayment(PaymentInfo paymentInfo) {
		log.info("paymentInfo => {}", paymentInfo);
		//전시회예약정보 PK
		Integer eriNum = paymentInfo.getReservationTicketInfo().getExhibitionReservationInfo().getEriNum();
		//PK로 예약정보 가져옴
		ExhibitionReservationInfo eri = eriRepo.findById(eriNum).get();
		//관람료검색
		Integer eiCharge = eri.getExhibitionInfo().getEiCharge();
		Integer rtiNumber = paymentInfo.getReservationTicketInfo().getRtiNumber();
		Integer piPrice = paymentInfo.getPiPrice();
		log.info("eiCharge => {}", eiCharge);
		log.info("paymentInfo => {}", piPrice * rtiNumber);
		if(piPrice != (eiCharge * rtiNumber)) {
			throw new RuntimeException("가격이 불일치 합니다.");
		}
		paymentInfo.setPiCode(CodeGenerator.getPaymentCode());
		
		return piRepo.save(paymentInfo);
	}

	@Override
	public int paymentVaild(PaymentVO paymentVO) {
		//아임포트 impUid 로 서버조회
		IamportResult<Payment> paymentByImpUid = iamport.getPaymentById(paymentVO.getImpUid());
		
		//아임포트에 결제된 결제금액
		Integer iamportAmount = paymentByImpUid.getResponse().getAmount().intValue();
		log.info("importAmount => {}", iamportAmount);
		
		//뷰에서 생성된 코드로 예약결제 조회
		PaymentInfo paymentInfo = piRepo.findByPiCode(paymentVO.getMerchantUid());
		
		//데이터베이스에 저장된 결제금액 
		Integer piPrice = paymentInfo.getPiPrice();
		log.info("piPrice => {}", piPrice);
		
		if(iamportAmount != piPrice) {
			throw new RuntimeException("결제정보가 일치하지 않습니다");
		}
		
		return 0;
	}
	

}
