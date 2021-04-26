package com.artbeans.web.entity;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class ReviewStatusConverter implements AttributeConverter<String, Integer> {

	@Override
	public Integer convertToDatabaseColumn(String state) {
		if("WRITING".equals(state)) {
			return 1;
		}
		return 0;
	}

	@Override
	public String convertToEntityAttribute(Integer code) {
		if(1 == code) {
			return "WRITING";
		}
		
		return "WAIT";
	}

}
