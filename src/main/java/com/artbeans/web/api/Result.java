package com.artbeans.web.api;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;


@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Result {
	private String status;
	private List<Addresses> addresses;
	private String errorMessage;
	

}
