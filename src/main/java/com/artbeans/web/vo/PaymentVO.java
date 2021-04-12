package com.artbeans.web.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class PaymentVO {

	@JsonProperty("imp_uid")
	private String impUid;
	
	@JsonProperty("merchant_uid")
	private String merchantUid;
}
