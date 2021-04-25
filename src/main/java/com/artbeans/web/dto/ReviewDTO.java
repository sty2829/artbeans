package com.artbeans.web.dto;

import java.util.Date;

import com.artbeans.web.util.DateUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public interface ReviewDTO {
	
	Integer getRviNum();

	String getRviTitle();
	
	@JsonIgnore
	String getFileInfoFiPath();
	
	@JsonIgnore
	String getFileInfoFiNum();
	
	String getRviContent();
	
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
	
	default String getFiNum() {
		return getFileInfoFiNum();
	}
	
}
