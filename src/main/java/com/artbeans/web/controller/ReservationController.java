package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.ReservationTimeDTO;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/reservation/{eiNum}")
	public ReservationSchedule getSchedule(@PathVariable Integer eiNum) {
		return reservationService.getReservationSchedule(eiNum);
	}

	@PostMapping("/reservation")
	public int saveReservation(@RequestBody ReservationInfo reservationInfo) {
		log.info("reservationInfo => {}", reservationInfo);
		return reservationService.saveReservation(reservationInfo);
	}
	
	@GetMapping("/reservation")
	public List<ReservationTimeDTO> getTimeTest(Integer riNum, String dateStr) {
		return reservationService.getReservationTimes(riNum, dateStr);
	}
	
	@GetMapping("/reservation-list")
	public Page<ReservationInfo> getList(Pageable pageable){
		return reservationService.getReservationList(pageable);
	}
}
