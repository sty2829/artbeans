package com.artbeans.web.service;

import com.artbeans.web.entity.PaymentInfo;

public interface PaymentService {

	PaymentInfo savePayment(PaymentInfo paymentInfo);
	
	int paymentVaild(String ImpUid, String merchantUid, Integer piNum);
}
