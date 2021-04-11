package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.api.imaport.Iamport;
import com.artbeans.web.api.imaport.IamportResult;
import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.service.PaymentService;
import com.artbeans.web.vo.UserReservation;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaymentController {
	
	@Autowired
	private Iamport iamport;
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/payment")
	public String goPayment(UserReservation userReservation, Model model) {
		log.info("userReservation => {}", userReservation);
		model.addAttribute("userReservation", userReservation);
		log.info("model => {}", model);
		return "views/payment/payment";
	}
	
	@PostMapping("/payment")
	public @ResponseBody int savePayment(@RequestBody PaymentInfo paymentInfo) {
		log.info("paymentVo => {}", paymentInfo);
		
		return paymentService.savePayment(paymentInfo);
	}
	
	@GetMapping("/auth")
	public @ResponseBody IamportResult getAuth(){
		return iamport.getResult();
	}
}
