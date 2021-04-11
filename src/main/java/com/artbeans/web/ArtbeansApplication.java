package com.artbeans.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@ConfigurationPropertiesScan
@SpringBootApplication
public class ArtbeansApplication {

	public static void main(String[] args) {
		SpringApplication.run(ArtbeansApplication.class, args);
	}

}
