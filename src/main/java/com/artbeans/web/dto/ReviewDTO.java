package com.artbeans.web.dto;

import java.util.Date;

import com.artbeans.web.util.DateUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;

public interface ReviewDTO {
	
	Integer getRviNum();

	String getRviTitle();
	
	@JsonIgnore
	String getFileInfoFiPath();
	
	@JsonIgnore
	String getFileInfoFiNum();
	
	String getRviContent();
	
	@JsonIgnore
	Date getCredat();
	
	@JsonIgnore
	String getUserInfoUiEmail();
	
	default String getDate() {
		return DateUtil.dateToString(getCredat());
	}
	
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
