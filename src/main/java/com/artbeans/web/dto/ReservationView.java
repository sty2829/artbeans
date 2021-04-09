package com.artbeans.web.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReservationView {
	
	private String imgPath;
	
	private String exhibitionName;

	private String period;
	
	private String audienceRating;
	
	private String runningTime;
	
	private String minDate;
	
	private String maxDate;
	
	private Integer charge;
	
	private List<String> disable;

	public ReservationView(String imgPath, String exhibitionName, String period, String audienceRating, String runningTime, String minDate, String maxDate,
			Integer charge, List<String> disable) {
		this.imgPath = imgPath;
		this.exhibitionName = exhibitionName;
		this.period = period;
		this.audienceRating = audienceRating;
		this.runningTime = runningTime;
		this.minDate = minDate;
		this.maxDate = maxDate;
		this.charge = charge;
		this.disable = disable;
	}
	
}
