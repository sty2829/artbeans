package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.artbeans.web.api.imaport.Iamport;

@Controller
public class URIController {
	
	@GetMapping("/views/**")
	public void goView() {
		
	}
	
	@GetMapping("/")
	public String hello() {
		return "views/index";
	}
	
	
}