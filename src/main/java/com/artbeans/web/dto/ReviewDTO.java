package com.artbeans.web.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public interface ReviewDTO {
	
	Integer getRviNum();
	
	@JsonIgnore
	Integer getTicketInfoTiNum();

	String getRviTitle();
	
	@JsonIgnore
	String getFileInfoFiPath();
	
	@JsonIgnore
	Integer getFileInfoFiNum();
	
	String getRviContent();
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date getCredat();
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date getModdat();
	
	@JsonIgnore
	String getUserInfoUiEmail();
	
	default String getUiEmail() {
		int idx = getUserInfoUiEmail().indexOf("@");
		return getUserInfoUiEmail().substring(0, idx);
	}
	
	default String getFiPath() {
		return getFileInfoFiPath();
	}
	
	default Integer getFiNum() {
		return getFileInfoFiNum();
	}
	
	default Integer getTiNum() {
		return getTicketInfoTiNum();
	}
	
}
