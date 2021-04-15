package com.artbeans.web.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

public interface ReservationDTO {

	Integer getRtiNum();
	
	String getRtiName();
	
	@JsonIgnore
	Integer getUserInfoUiNum();
	
	default Integer getUinum() {
		return getUserInfoUiNum();
	}
	
}
