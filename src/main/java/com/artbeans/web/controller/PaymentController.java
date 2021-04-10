package com.artbeans.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.artbeans.web.vo.PaymentVo;
import com.artbeans.web.vo.UserReservation;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaymentController {
	
	@GetMapping("/payment")
	public String goPayment(UserReservation userReservation, Model model) {
		log.info("userReservation => {}", userReservation);
		model.addAttribute("userReservation", userReservation);
		log.info("model => {}", model);
		return "views/payment/payment";
	}
	
	@PostMapping("/payment/complete")
	public String completePayment(@RequestBody PaymentVo paymentVo) {
		log.info("paymentVo => {}", paymentVo);
		return "views/index";
	}
	


}
