package com.artbeans.web.entity.NaverMapApi;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Addresses {

	private String x;
	
	private String y;
}
