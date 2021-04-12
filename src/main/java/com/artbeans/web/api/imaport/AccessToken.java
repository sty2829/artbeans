package com.artbeans.web.api.imaport;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AccessToken {
	
	@JsonProperty("access_token")
	private String token;
	
	@JsonProperty("expired_at")
	private int expired_at;
	
	@JsonProperty("now")
	private int now;

}
