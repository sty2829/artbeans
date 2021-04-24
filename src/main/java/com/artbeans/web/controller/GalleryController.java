package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.service.GalleryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GalleryController {
	@Autowired
	private GalleryService gService;
	
	//사용중(상혁)
	@GetMapping("/gallerylist")
	public @ResponseBody Page<GalleryInfo> getExhibitionInfoList(Pageable pageable){
		return gService.getGalleryLists(pageable);
	}
	
	//사용중(상혁)
	@GetMapping("/gallery-addr-list/{giAddress}")
	public @ResponseBody Page<GalleryInfo> getExhibitionInfoList(@PathVariable String giAddress , Pageable pageable){
		log.info("giAddress=>{}",giAddress);
		return gService.getGalleryAddrList(giAddress, pageable);
	}
	
	//사용중(상혁)
	@GetMapping("/gallery")
	public @ResponseBody GalleryInfo getGalleryInfo(@RequestParam Integer giNum){
		return gService.getGalleryInfo(giNum);
	}
	
    //사용중(상혁)
	@PostMapping("/gallery")
	public @ResponseBody int saveGalleryInfo(GalleryInfo galleryInfo) throws Exception {
		log.info("galleryInfo => {}", galleryInfo);
		gService.saveGalleryInfo(galleryInfo);
		return 1;
	}
	
	
	
}
