package com.artbeans.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

public interface ReviewDTO {

	String getRviTitle();
	
	String getRviContent();
	
	Date getCredat();
	
	@JsonIgnore
	String getUserInfoUiEmail();
	
	default String getUiEmail() {
		return getUserInfoUiEmail();
	}
	
}
