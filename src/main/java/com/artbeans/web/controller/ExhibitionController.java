package com.artbeans.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.ExhibitionInfo;

@Controller
public class ExhibitionController {
	
	@PostMapping("/exhibition-insert")
	public @ResponseBody Integer saveExhibition(@RequestBody ExhibitionInfo exhibitionInfo) {
		return 1;
		
	}
	

}
