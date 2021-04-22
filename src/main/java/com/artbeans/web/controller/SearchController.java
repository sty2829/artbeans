package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.service.GalleryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SearchController {
	
	@Autowired
	private ExhibitionService eService;
	@Autowired
	private GalleryService gService;
	
	@GetMapping("/search") //헤더 검색창 단순 화면전환 및 keyword 키밸류 이동
	public String search(@RequestParam (value = "keyword") String keyword, Model model) {
		log.info("search=>{}", keyword);
		model.addAttribute("keyword",keyword);
		log.info("model=>{}", model);
		return "/views/search/searchResults";
	}
	
	@GetMapping("/exhibition-search")//통합검색 전시회 name like로 가져옴
	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoList(ExhibitionInfo exhibitionInfo){
		log.info("exhibitionList=>{}",exhibitionInfo);
		return eService.getExhibitionInfos(exhibitionInfo);
	}
	@GetMapping("/Gallery-lists")// 통합검색 갤러리 위와 동일하게 name like로 가져옴
	public @ResponseBody List<GalleryInfo> getGalleryInfoList(@ModelAttribute GalleryInfo galleryInfo){
		return gService.getGalleryInfos(galleryInfo);
	}
	
	@GetMapping("/exhibition-banner")//슬라이드 배너 스테이터스 구분하여 리스트 가져옴
	public @ResponseBody List<ExhibitionInfo> getEiBannerList(ExhibitionInfo exhibitionInfo){
		log.info("exhibition-banner=>{}",exhibitionInfo);
		return eService.getEiBannerLists(exhibitionInfo);
	}
	
	
	
	
	
}
