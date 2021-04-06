package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.service.GalleryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GalleryController {
	@Autowired
	private GalleryService gService;
	
	@GetMapping("/Gallery-list")
	public @ResponseBody List<GalleryInfo> getGalleryInfoList(@ModelAttribute GalleryInfo galleryInfo){
		return gService.getGalleryInfos(galleryInfo);
	}
	
	@GetMapping("/Gallery")
	public @ResponseBody GalleryInfo getGalleryInfo(@RequestParam Integer giNum){
		return gService.getGalleryInfo(giNum);
	}
	
}
