package com.artbeans.web.api.imaport;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

import lombok.Data;

@Data
@ConstructorBinding
@ConfigurationProperties("imaport.api")
public class IamportProperties {

	private final String KEY;
	 
	private final String SECRET;
	
	private final String AUTH_URL;

	public IamportProperties(String kEY, String sECRET, String aUTH_URL) {
		KEY = kEY;
		SECRET = sECRET;
		AUTH_URL = aUTH_URL;
	}

}
