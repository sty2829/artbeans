package com.artbeans.web.dto;

import lombok.Data;

@Data
public class ResponseResult {

	private Boolean result; 
	
	private Integer count;
	
	private String msg;
}
