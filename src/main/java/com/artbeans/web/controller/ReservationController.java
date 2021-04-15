package com.artbeans.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	//파라미터 전시회 PK
	//예약구매자가 전시회 예약화면으로 이동시 전시회예약 스케쥴
	@GetMapping("/reservation/{eiNum}")
	public ReservationSchedule getSchedule(@PathVariable Integer eiNum) {
		return rService.getReservationSchedule(eiNum);
	}

	//추후에 eriNum으로 수정하는게 날듯
	//해당전시회 선택한 예약날짜의 예매시간리스트 가져옴
	@GetMapping("/reservation-time/{eiNum}/{dateStr}")
	public Map<String,Integer> getView(@PathVariable Integer eiNum, @PathVariable String dateStr) {
		log.info("eiNum =>{}", eiNum);
		log.info("day =>{}", dateStr);
		
		return rService.getReservationTimeMap(eiNum, dateStr);
	}
	
	// 전시회 유저예약취소
	@DeleteMapping("/reservation")
	public void cancel() {
		
	}
}
