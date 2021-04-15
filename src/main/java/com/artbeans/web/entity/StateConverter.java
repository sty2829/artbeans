package com.artbeans.web.entity;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class StateConverter implements AttributeConverter<String, Integer> {

	@Override
	public Integer convertToDatabaseColumn(String state) {
		if("CONFIRM".equals(state)) {
			return 2;
		}else if("CANCEL".equals(state)) {
			return 0;
		}
		return 1;
	}

	@Override
	public String convertToEntityAttribute(Integer code) {
		if(2 == code) {
			return "CONFIRM";
		}else if(0 == code) {
			return "CANCEL";
		}
		return "PENDING";
	}

	

}
