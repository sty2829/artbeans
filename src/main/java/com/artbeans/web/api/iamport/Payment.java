package com.artbeans.web.api.iamport;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Payment {

	@JsonProperty("imp_uid")
	private String impUid;
	
	@JsonProperty("merchant_uid")
	private String merchantUid;
	
	@JsonProperty("pay_method")
	private String payMethod;
	
	private BigDecimal amount;
	
	@JsonProperty("cancel_amount")
	private BigDecimal cancelAmount;

	private String currency;
	
	@JsonProperty("buyer_name")
	private String buyerName;
	
	@JsonProperty("buyer_email")
	private String buyerEmail;
	
	@JsonProperty("buyer_tel")
	private String buyerTel;
}
