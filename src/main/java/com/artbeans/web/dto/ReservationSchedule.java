package com.artbeans.web.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReservationSchedule {

	private String imgPath;
	
	private String exhibitionName;

	private String period;
	
	private String audienceRating;
	
	private String runningTime;
	
	private String minDate;
	
	private String maxDate;
	
	private Integer charge;
	
	private Integer maxTicket;
	
	private Integer eriNum;
	
	private String disable;
	
	private List<String> disableList;

	public ReservationSchedule(String imgPath, String exhibitionName, String period, String audienceRating,
			String runningTime, String minDate, String maxDate, Integer charge, Integer maxTicket, Integer eriNum,
			String disable) {
		this.imgPath = imgPath;
		this.exhibitionName = exhibitionName;
		this.period = period;
		this.audienceRating = audienceRating;
		this.runningTime = runningTime;
		this.minDate = minDate;
		this.maxDate = maxDate;
		this.charge = charge;
		this.maxTicket = maxTicket;
		this.eriNum = eriNum;
		this.disable = disable;
	}
	
	
}
