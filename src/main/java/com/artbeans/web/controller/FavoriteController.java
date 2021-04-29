package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.FavoriteInfo;
import com.artbeans.web.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;
import retrofit2.http.POST;

@RestController
@Slf4j
public class FavoriteController {

	@Autowired
	private FavoriteService fService;

	@GetMapping("/favorite-exhibitions")
	public  List<FavoriteInfo> getFavoriteExhibition(@RequestParam Integer uiNum) {
		log.info("userssesion=>{}", uiNum);

		return fService.getFavoriteExhibition(uiNum);

	}
	@PostMapping("/favorite-insert")
	public int getFviEinum(@RequestBody FavoriteInfo fvi) {
		
		
		return fService.saveFavoriteExhibition(fvi);
		
	}

	@DeleteMapping("/favorite-delete/{fviNumList}")
	public Integer deleteFavorite(@PathVariable List<Integer> fviNumList) {
		log.info("fviNumList => {}", fviNumList);
		
		return fService.deleteFavorite(fviNumList);

	}

}
