package com.artbeans.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class URIController {
	
	@GetMapping("/views/**")
	public void goView() {
		log.info("테스트");
	}
	
	@GetMapping("/")
	public String hello() {
		return "views/index";
	}
	
	
}