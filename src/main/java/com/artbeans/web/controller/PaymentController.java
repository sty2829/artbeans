package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.service.PaymentService;
import com.artbeans.web.vo.PaymentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/payment")
	public @ResponseBody PaymentInfo savePayment(@RequestBody PaymentInfo paymentInfo) {
		log.info("paymentVo => {}", paymentInfo);
		return paymentService.savePayment(paymentInfo);
	}
	
	 
	@PostMapping("/payment/complete")
	public @ResponseBody int complete(@RequestBody PaymentVO paymentVO) {
		log.info("paymentVO => {}", paymentVO);
		return paymentService.paymentConfirm(paymentVO);
		
	}
}
