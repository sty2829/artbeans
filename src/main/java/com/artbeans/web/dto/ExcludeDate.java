package com.artbeans.web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ExcludeDate {

	private Date date;
	

	public ExcludeDate(Date date) {
		this.date = date;
	}

}
