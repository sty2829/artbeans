package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.FavoriteExhibition;
import com.artbeans.web.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;
@RestController
@Slf4j
public class FavoriteController {
	
	@Autowired
	private FavoriteService fService;
	
	@GetMapping("/favorite-exhibitions")
	public @ResponseBody List<FavoriteExhibition> getFavoriteExhibition(@RequestBody FavoriteExhibition favorite){
		log.info("favorite=>{}",favorite);
		return fService.getFavoriteExhibition(favorite);
	}
	
	@GetMapping("/favorite-exhibition")
	public @ResponseBody FavoriteExhibition getFavorite(@RequestParam Integer uiNum) {
		log.info("uiNum=>{}",uiNum);
		return fService.getFavorite(uiNum);
	}
}
