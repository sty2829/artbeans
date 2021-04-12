package com.artbeans.web.api.iamport;

import lombok.Data;

@Data
public class IamportResult<T> {

	private int code;
	
	private String message;
	
	private T response;

}
