package com.artbeans.web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TicketSumDate {

	private Date date;
	
	private Long sum;

	public TicketSumDate(Date date, Long sum) {
		this.date = date;
		this.sum = sum;
	}
	
	
	
}
