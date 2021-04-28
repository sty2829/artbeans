package com.artbeans.web.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReservationSchedule {

	private String imgPath;
	
	private String exhibitionName;

	private String period;
	
	private String audienceRating;
	
	private String holiday;
	
	private String minDate;
	
	private String maxDate;
	
	private Integer charge;
	
	private Integer maxTicket;
	
	private Integer riNum;
	
	private String disable;
	
	private List<String> disableList;
	
	private String x;
	
	private String y;
	
	private String giName;

	public ReservationSchedule(String imgPath, String exhibitionName, String period, String audienceRating,
			String holiday, String minDate, String maxDate, Integer charge, Integer maxTicket, Integer riNum,
			String disable, String x, String y, String giName) {
		this.imgPath = imgPath;
		this.exhibitionName = exhibitionName;
		this.period = period;
		this.audienceRating = audienceRating;
		this.holiday = holiday;
		this.minDate = minDate;
		this.maxDate = maxDate;
		this.charge = charge;
		this.maxTicket = maxTicket;
		this.riNum = riNum;
		this.disable = disable;
		this.x = x;
		this.y = y;
		this.giName = giName;
	}

	
}
