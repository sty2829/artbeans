package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.service.ExhibitionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExhibitionController {
	@Autowired
	private ExhibitionService eService;
	
//	@GetMapping("/exhibition-list")
//	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoList(ExhibitionInfo exhibitionInfo){
//		log.info("exhibitionList=>{}",exhibitionInfo);
//		return eService.getExhibitionInfos(exhibitionInfo);
//	}
	
	@GetMapping("/exhibition-list")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoList(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		return eService.getExhibitionInfoLists(pageable, dtExhibitionInfo);
	}
	
//	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoList(ExhibitionInfo exhibitionInfo){
//
//		return eService.getExhibitionInfos(exhibitionInfo);
//	}
	

//	@GetMapping("/exhibition-list-newest")
//	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoNewestList(ExhibitionInfo exhibitionInfo){
//		return eService.getExhibitionInfoNewestList(exhibitionInfo);

	
//	@GetMapping("/exhibition-list")
//	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoList(Pageable pageable, DataTable<ExhibitionInfo> exhibitionInfo){
//		
//		return eService.getExhibitionInfos(pageable, exhibitionInfo);
//	}
	
	@GetMapping("/exhibition-list-newest")
	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoNewestList(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		return eService.getExhibitionInfoNewestLists(pageable, dtExhibitionInfo);
	}
	
	@GetMapping("/exhibition-list-deadline")
	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoDeadlineList(ExhibitionInfo exhibitionInfo){
		return eService.getExhibitionInfoDeadlineList(exhibitionInfo);
	}
	
	
	@GetMapping("/exhibition")
	public @ResponseBody ExhibitionInfo getExhibitionInfo(@RequestParam Integer eiNum){
//		log.info("eiNum=>{}",eService.getExhibitionInfo(eiNum));
		return eService.getExhibitionInfo(eiNum);
	}
	
	@PostMapping("/exhibition-insert")
	public @ResponseBody Integer saveExhibition(ExhibitionInfo exhibitionInfo) throws Exception {
		exhibitionInfo = eService.saveExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();		
	}
	
	@DeleteMapping("/exhibition")
	public @ResponseBody Integer deleteExhibition(@RequestParam Integer eiNum) {
		return eService.deleteExhibitionInfo(eiNum);
	}
	
	@PostMapping("/exhibition-update")
	public @ResponseBody Integer updateExhibitionInfo(@ModelAttribute ExhibitionInfo exhibitionInfo) throws Exception {
		log.info("exhibitionInfo=>{}",exhibitionInfo);
		exhibitionInfo = eService.updateExhibitionInfo(exhibitionInfo);
		log.info("exhibition-update=>{}",exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}

}
