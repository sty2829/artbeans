package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.FavoriteInfo;
import com.artbeans.web.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class FavoriteController {

	@Autowired
	private FavoriteService fService;

	@GetMapping("/favorite-exhibitions")
	public  List<FavoriteInfo> getFavoriteExhibition(UserSession userssesion) {
		log.info("userssesion=>{}", userssesion);

		return fService.getFavoriteExhibition(userssesion);

	}

	@DeleteMapping("/favorite-delete/{fviNumList}")
	public Integer deleteFavorite(@PathVariable List<Integer> fviNumList) {
		log.info("fviNumList => {}", fviNumList);
		
		return fService.deleteFavorite(fviNumList);

	}

}
