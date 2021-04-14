package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.api.iamport.Cancle;
import com.artbeans.web.api.iamport.Iamport;
import com.artbeans.web.api.iamport.IamportResult;

@RestController
public class TestController {

	@Autowired
	private Iamport iamport;
	
	
	@GetMapping("/test/payment")
	public IamportResult<Cancle> getCancel(@RequestParam String impUid) {
		return iamport.canclePaymentByImpId(impUid);
	}
}
