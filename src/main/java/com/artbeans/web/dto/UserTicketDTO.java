package com.artbeans.web.dto;

import java.time.LocalDateTime;

public interface UserTicketDTO {
	
	Integer getRtiNum();

	String getEiName();
	
	String getGiName();
	
	String getPiMerchantId();
	
	String getImgPath();
	
	String getRtiDate();
	
	String getRtiTime();
	
	Integer getRtiNumber();
	
	LocalDateTime getDateTime();
}
