package com.artbeans.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SearchController {
	
	@GetMapping("/search")
	public String search(@RequestParam (value = "keyword") String keyword, Model model) {
		log.info("search=>{}", keyword);
		model.addAttribute("keyword",keyword);
		log.info("model=>{}", model);
		return "/views/search/searchResults";
	}
	
	
	
}
