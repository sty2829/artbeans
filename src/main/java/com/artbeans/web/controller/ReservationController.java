package com.artbeans.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	//파라미터 전시회 PK
	//예약구매자가 전시회 예약화면으로 이동시 전시회예약 스케쥴
	@GetMapping("/reservation/{eiNum}")
	public ReservationSchedule getSchedule(@PathVariable Integer eiNum) {
		return reservationService.getReservationSchedule(eiNum);
	}

	//전시회 예약정보 세이브
	@PostMapping("/reservation")
	public int saveReservation(@RequestBody ReservationInfo reservationInfo) {
		log.info("reservationInfo => {}", reservationInfo);
		return reservationService.saveReservation(reservationInfo);
	}
	
	//해당전시회 선택한 예약날짜의 예매시간리스트 가져옴
	@GetMapping("/reservation/{riNum}/{dateStr}")
	public Map<String,Integer> getTimes(@PathVariable Integer riNum, @PathVariable String dateStr) {
		return reservationService.getReservationTimes(riNum, dateStr);
	}
	
}
