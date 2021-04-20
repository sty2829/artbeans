package com.artbeans.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	}
	
	//test
	@GetMapping("/exhibition-listDemoss/{giAddress}")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoListDemo(@PathVariable String giAddress, Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		log.info("giAddress=>{}",giAddress);
		return eService.getExhiListDemoss(giAddress, pageable, dtExhibitionInfo);
	}
	
	//
	
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

	//유저ID로 예약전시회 찾는 컨트롤러 전시회예약정보 없는 전시회만
	//전시회 정보 찾기위해.. 추가함
	@GetMapping("/exhibition/{uiNum}")
	public @ResponseBody List<ExhibitionInfo> getUserExhibition(@PathVariable Integer uiNum){
		return eService.getExhibitionFindByUiNum(uiNum);
	}
	
	//배너허가를 위한 업데이트 
	@PostMapping("/exhibition-banner-update")
	public @ResponseBody Integer updateExhibitionInfoEiBanner(@ModelAttribute ExhibitionInfo exhibitionInfo) throws Exception {
		eService.updateExhibitionInfoEiBanner(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}
	
}
