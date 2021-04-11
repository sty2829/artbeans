package com.artbeans.web.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.repository.PaymentInfoRepository;
import com.artbeans.web.service.PaymentService;
import com.artbeans.web.util.CodeGenerator;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentInfoRepository piRepo;
	
	@Override
	public int savePayment(PaymentInfo paymentInfo) {
		log.info("paymentInfo => {}", paymentInfo);
		paymentInfo.setPaymentCode(CodeGenerator.getPaymentCode());
		piRepo.save(paymentInfo);
		
		return paymentInfo.getPiNum();
	}
	

}
