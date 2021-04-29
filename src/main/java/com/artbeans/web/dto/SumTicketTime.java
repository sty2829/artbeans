package com.artbeans.web.dto;

import lombok.Data;

@Data
public class SumTicketTime {

	private String time;
	
	private Long sum;
	
	private 

	public SumTicketTime(String time, Long sum) {
		this.time = time;
		this.sum = sum;
	}
	
}
