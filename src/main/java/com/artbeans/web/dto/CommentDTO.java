package com.artbeans.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public interface CommentDTO {

	Integer getCiNum();
	
	@JsonIgnore
	Integer getUserInfoUiNum();
	
	String getCiContent();
	
	@JsonIgnore
	String getUserInfoUiEmail();
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date getModdat();
	
	default String getUiEmail() {
		int idx = getUserInfoUiEmail().indexOf("@");
		return getUserInfoUiEmail().substring(0, idx);
	}
	
	default Integer getUiNum() {
		return getUserInfoUiNum();
	}
	
}
