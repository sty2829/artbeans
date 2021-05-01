package com.artbeans.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.dto.Search;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExhibitionController {
	@Autowired
	private ExhibitionService eService;

	// 사용중(진석)
	@GetMapping("/exhibition-list")
	public @ResponseBody List<ExhibitionInfo> getExhibitionList(ExhibitionInfo exhibitionInfo) {
	log.info("serach => {}", exhibitionInfo);
		return eService.getExhibitionInfos(exhibitionInfo);
	}	
	
	// 사용중(상혁)
	@GetMapping("/exhibition-getaddressList/{giAddress}")
	public @ResponseBody Page<ExhibitionInfo> getExhibitionInfoListDemo(@PathVariable String giAddress,
			Search serach, Pageable pageable) {
		return eService.getExhiAddrList(giAddress, serach, pageable);
	}
	//사용중(상혁) //admin-ei (가온)
	@GetMapping("/exhibitions")
	public @ResponseBody Page<ExhibitionInfo> getExhibitionList(Search serach, Pageable pageable) {
		//log.info("serach => {}", serach);
		return eService.getExhibitionInfos(serach, pageable);
	}
	
	// 사용중(상혁)
	@GetMapping("/exhibition")
	public @ResponseBody ExhibitionInfo getExhibitionInfo(@RequestParam Integer eiNum) {
		//log.info("eiNum=>{}", eService.getExhibitionInfo(eiNum));
		return eService.getExhibitionInfo(eiNum);
	}

	// 사용중(상혁)
	@PostMapping("/exhibition-insert")
	public @ResponseBody Integer saveExhibition(ExhibitionInfo exhibitionInfo) throws Exception {
		exhibitionInfo = eService.saveExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}

	@PostMapping("/exhibition-insert-editorimage")
	public @ResponseBody Map<String, String> uploadImg(@RequestParam MultipartFile upload) {
		return FileUtil.ckeditorUploadImg(upload);
	}

	@PostMapping("/exhibition-update")
	public @ResponseBody Integer updateExhibitionInfo(@ModelAttribute ExhibitionInfo exhibitionInfo) throws Exception {
		exhibitionInfo = eService.updateExhibitionInfo(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}

	// 유저ID로 예약전시회 찾는 컨트롤러 전시회예약정보 없는 전시회만
	// 전시회 정보 찾기위해.. 추가함
	@GetMapping("/exhibitions-user")
	public @ResponseBody List<ExhibitionInfo> getUserExhibition(UserSession userSession) {

		return eService.getExhibitionFindByUiNum(userSession);
	}

	// admin 배너허가를 위한 업데이트
	@PostMapping("/exhibition-banner-update")
	public @ResponseBody Integer updateExhibitionInfoEiBanner(@ModelAttribute ExhibitionInfo exhibitionInfo)
			throws Exception {
		eService.updateExhibitionInfoEiBanner(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}

	// admin-ei-update
	@PostMapping("/exhibition-admin-update")
	public @ResponseBody Integer updateExhibitionInfoWithoutFile(Integer eiStatus, Integer giNum, String eiName,
			String eiArtist, Integer eiCharge, String eiStartDate, String eiEndDate, String eiStartTime,
			String eiEndTime, String eiContent, Integer uiNum, Integer eiNum) throws Exception {
		eService.updateExhibitionInfoWithoutFile(eiStatus, giNum, eiName, eiArtist, eiCharge, eiStartDate, eiEndDate,
				eiStartTime, eiEndTime, eiContent, uiNum, eiNum);
		return eiNum;
	}

	// admin pagenation
	@GetMapping("/exhibitions/paging")
	public @ResponseBody Page<ExhibitionInfo> getExhibitionInfoListDemo(Pageable pageable) {
		return eService.getBeforeConfirmLists(pageable);
	}

	// exhibition calendar
	@GetMapping("/exhibition-calendar")
	public @ResponseBody DataTable<ExhibitionInfo> getOpeningCalendarList(String year, String month, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getOpeningCalendarList(year, month, pageable, dtExhibitionInfo);
	}

	// exhibition calendar oneday
	@GetMapping("/exhibition-calendar-oneday")
	public @ResponseBody DataTable<ExhibitionInfo> getOpeningCalendarListOneday(String eiStartDate, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getOpeningCalendarListOneday(eiStartDate, pageable, dtExhibitionInfo);
	}

	// admin-ei 검색바
	@GetMapping("/exhibition-search-bar/name")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiNameLike(String eiName, Pageable pageble) {
		return eService.findAllByEiNameLike(eiName, pageble);
	}

	// admin-ei 검색바
	@GetMapping("/exhibition-search-bar/artist")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiArtistLike(String eiArtist, Pageable pageble) {
		return eService.findAllByEiArtistLike(eiArtist, pageble);
	}

	// admin-ei 검색바 
	@GetMapping("/exhibition-search-bar/status")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiStatusLike(String eiStatus, Pageable pageble) {
		return eService.findAllByEiStatusLike(eiStatus, pageble);
	}
	
	// admin-banner  
	@GetMapping("/exhibition-banner/banner")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiBanner(Integer eiBanner, Pageable pageble) {
		return eService.findAllByEiBanner(eiBanner, pageble);
	}

}
