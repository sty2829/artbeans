package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.service.ExhibitionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExhibitionController {
	@Autowired
	private ExhibitionService eService;
	
	@GetMapping("/exhibition-list")
	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoList(@ModelAttribute ExhibitionInfo exhibitionInfo){
		return eService.getExhibitionInfos(exhibitionInfo);
	}
	
	@GetMapping("/exhibition")
	public @ResponseBody ExhibitionInfo getExhibitionInfo(@RequestParam Integer eiNum){
		return eService.getExhibitionInfo(eiNum);
	}
	
	@PostMapping("/exhibition-insert")
	public @ResponseBody Integer saveExhibition(ExhibitionInfo exhibitionInfo) throws Exception {
		log.info("exhibitionInfo=>{}",exhibitionInfo);
		exhibitionInfo = eService.saveExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();		
	}
	
	@DeleteMapping("/exhibition")
	public @ResponseBody Integer deleteExhibition(@RequestParam Integer eiNum) {
		return eService.deleteExhibitionInfo(eiNum);
	}
	
	@PostMapping("/exhibition-update")
	public @ResponseBody Integer updateExhibitionInfo(@RequestBody ExhibitionInfo exhibitionInfo) {
		exhibitionInfo = eService.updateExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}

}
