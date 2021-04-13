package com.artbeans.web.service;

import com.artbeans.web.entity.PaymentInfo;
import com.artbeans.web.vo.PaymentVO;

public interface PaymentService {

	PaymentInfo savePayment(PaymentInfo paymentInfo);
	
	int paymentVaild(PaymentVO paymentVO);
}
