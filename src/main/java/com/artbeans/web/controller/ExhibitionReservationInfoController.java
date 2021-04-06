package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ExhibitionReservationInfoController {

	@Autowired
	private ExhibitionReservationInfoRepository exhibitionReservationInfoRepository;
	
	@PostMapping("/exhibitionReservation")
	public int insert(@RequestBody ExhibitionReservationInfo exhibitionReservationInfo) {
		log.info("exhibitionReservation => {}", exhibitionReservationInfo);
		exhibitionReservationInfoRepository.save(exhibitionReservationInfo);
		return exhibitionReservationInfo.getEriNum();
	}
	
	@GetMapping("/exhibitionReservation")
	public ExhibitionReservationInfo getER(@RequestBody Integer eiNum) {
		return null;
	}
}
