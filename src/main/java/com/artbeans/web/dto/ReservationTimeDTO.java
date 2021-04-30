package com.artbeans.web.dto;

import lombok.Data;

@Data
public class ReservationTimeDTO {

	private String time;
	
	private Integer ticket;
	
	private boolean disableTime;

	public ReservationTimeDTO(String time, Integer ticket) {
		this.time = time;
		this.ticket = ticket;
	}
	
}
