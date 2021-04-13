package com.artbeans.web.dto;

import java.util.List;

public interface ReservationScheduleDTO {

	String getimgPath();
	
	String getexhibitionName();

	String getperiod();
	
	String getaudienceRating();
	
	String getrunningTime();
	
	String getminDate();
	
	String getmaxDate();
	
	Integer getcharge();
	
	Integer getmaxTicket();
	
	Integer geteriNum();
	
	List<String> getdisable();
	
	String setminDate(String mindate);
}
