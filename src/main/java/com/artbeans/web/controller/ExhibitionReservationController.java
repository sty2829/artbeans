package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.service.ExhibitionReservationService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ExhibitionReservationController {

	@Autowired
	private ExhibitionReservationService eriService;
	
	@PostMapping("/exhibition-reservation")
	public int insert(@RequestBody ExhibitionReservationInfo exhibitionReservationInfo) {
		log.info("exhibitionReservation => {}", exhibitionReservationInfo);
		eriService.saveExhibitionReservation(exhibitionReservationInfo);
		return exhibitionReservationInfo.getEriNum();
	}
	
	@GetMapping("/exhibition-reservations")
	public List<ExhibitionReservationInfo> getList() {
		List<ExhibitionReservationInfo> eriList = eriService.getExhibitionReservations();
		log.info("eriList => {}", eriList);
		return eriService.getExhibitionReservations();
	}
	
	@GetMapping("/exhibition-reservations/{eriNum}")
	public ExhibitionReservationInfo get(@PathVariable Integer eriNum) {
		ExhibitionReservationInfo eri = eriService.getExhibitionReservation(eriNum);
		log.info("eriList => {}", eri);
		return eriService.getExhibitionReservation(eriNum);
	}

	//유저ID로 예약전시회 찾는 컨트롤러..
	@GetMapping("/exhibition/{uiNum}")
	public @ResponseBody List<ExhibitionInfo> getUserExhibition(@PathVariable Integer uiNum){
		return eriService.getExhibitionFindByUiNum(uiNum);
	}
}
