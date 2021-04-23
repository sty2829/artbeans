package com.artbeans.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ExhibitionController {
	@Autowired
	private ExhibitionService eService;

	// @Autowired
	// private ExhibitionInfoRepository eiRepo;

//	@GetMapping("/exhibition-list")
//	public @ResponseBody List<ExhibitionInfo> getExhibitionInfoList(ExhibitionInfo exhibitionInfo){
//		log.info("exhibitionList=>{}",exhibitionInfo);
//		return eService.getExhibitionInfos(exhibitionInfo);
//	}Demo

	// tsets
	// @GetMapping("/exhibition/test/{str}")
	// public @ResponseBody Page<ExhibitionInfo> getTest(@PathVariable String str,
	// Pageable pageable){
	// return eiRepo.getList(str, pageable);
	// }

//	// 나중에 지울 것
//	@GetMapping("/exhibition-listDemo")
//	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoListDemo(Pageable pageable,
//			DataTable<ExhibitionInfo> dtExhibitionInfo) {
//		return eService.getExhiListDemo(pageable, dtExhibitionInfo);
//	}

	// 사용중(상혁)
	@GetMapping("/exhibition-listDemoss/{giAddress}")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoListDemo(@PathVariable String giAddress,
			Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo) {
		log.info("giAddress=>{}", giAddress);
		return eService.getExhiListDemoss(giAddress, pageable, dtExhibitionInfo);
	}

//	// 지울걸
//	@GetMapping("/exhibition-list")
//	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionInfoList(Pageable pageable,
//			DataTable<ExhibitionInfo> dtExhibitionInfo) {
//		return eService.getExhibitionInfoLists(pageable, dtExhibitionInfo);
//	}

	// 사용중(상혁) exhibition-list 변경
	@GetMapping("/exhibition-openinglist")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionOpeningList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getOpeningList(eiStatus, pageable, dtExhibitionInfo);
	}

	// 사용중(상혁) 무료
	@GetMapping("/exhibition-openinglistgetfree")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionOpeningListGetFree(String eiStatus, Integer eiCharge,
			Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getOpeningListGetFree(eiStatus, eiCharge, pageable, dtExhibitionInfo);
	}

	// 사용중(상혁) exhibition-list 변경
	@GetMapping("/exhibition-closelist")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionCloseList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getCloseList(eiStatus, pageable, dtExhibitionInfo);
	}

	// 사용중(상혁) exhibition-list 변경
	@GetMapping("/exhibition-futurelist")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionFutureList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getFutureList(eiStatus, pageable, dtExhibitionInfo);
	}

	// 사용중(상혁) 무료
	@GetMapping("/exhibition-futurelistgetfree")
	public @ResponseBody DataTable<ExhibitionInfo> getExhibitionFutureListGetFree(String eiStatus, Integer eiCharge,
			Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo) {
		return eService.getFutureListGetFree(eiStatus, eiCharge, pageable, dtExhibitionInfo);
	}

	// 사용중(상혁)
	@GetMapping("/exhibition")
	public @ResponseBody ExhibitionInfo getExhibitionInfo(@RequestParam Integer eiNum) {
		log.info("eiNum=>{}", eService.getExhibitionInfo(eiNum));
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
		return FileConverter.ckeditorUploadImg(upload);
	}

//	@DeleteMapping("/exhibition")
//	public @ResponseBody Integer deleteExhibition(@RequestParam Integer eiNum) {
//		return eService.deleteExhibitionInfo(eiNum);
//	}

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
		log.info("eiNum=>{}", eiNum);
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
		log.info("eiName=>{}", eiName);
		return eService.findAllByEiNameLike(eiName, pageble);
	}

	// admin-ei 검색바
	@GetMapping("/exhibition-search-bar/artist")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiArtistLike(String eiArtist, Pageable pageble) {
		log.info("eiArtist=>{}", eiArtist);
		return eService.findAllByEiArtistLike(eiArtist, pageble);
	}

	// admin-ei 검색바
	@GetMapping("/exhibition-search-bar/status")
	public @ResponseBody Page<ExhibitionInfo> findAllByEiStatusLike(String eiStatus, Pageable pageble) {
		log.info("eiStatus=>{}", eiStatus);
		return eService.findAllByEiStatusLike(eiStatus, pageble);
	}

}
