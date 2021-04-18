package com.artbeans.web.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

public interface CommentDTO {

	String getCiContent();
	
	@JsonIgnore
	String getUserInfoUiEmail();
	
	default String getUiEmail() {
		return getUserInfoUiEmail();
	}
	
}
