package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.repository.GalleryInfoRepository;

import lombok.extern.slf4j.Slf4j;


/*
 * 테스트용 변경하셔도 됩니다.
 * 
 * 
 */

@RestController
@Slf4j
public class GalleryInfoController {

	@Autowired
	private GalleryInfoRepository galleryInfoRepository;
	
	@PostMapping("/gallery")
	public int insert(@RequestBody GalleryInfo galleryInfo) {
		log.info("gallery => {}", galleryInfo);
		galleryInfoRepository.save(galleryInfo);
		return galleryInfo.getGiNum();
	}
}
