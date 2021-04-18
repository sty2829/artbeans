package com.artbeans.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;

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
//	}Demo
	
	//나중에 지울 것
	@GetMapping("/exhibition-listDemo")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoListDemo(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		return eService.getExhiListDemo(pageable, dtExhibitionInfo);
	}//
	
	@GetMapping("/exhibition-list")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoList(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		return eService.getExhibitionInfoLists(pageable, dtExhibitionInfo);
	}
	
	@GetMapping("/exhibition")
	public @ResponseBody ExhibitionInfo getExhibitionInfo(@RequestParam Integer eiNum){
		log.info("eiNum=>{}",eService.getExhibitionInfo(eiNum));
		return eService.getExhibitionInfo(eiNum);
	}
	
	@PostMapping("/exhibition-insert")
	public @ResponseBody Integer saveExhibition(ExhibitionInfo exhibitionInfo) throws Exception {
		exhibitionInfo = eService.saveExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();		
	}
	
	@PostMapping("/exhibition-insert-editorimage")
	public @ResponseBody Map<String,String> uploadImg(@RequestParam MultipartFile upload){
		return FileConverter.ckeditorUploadImg(upload);
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
