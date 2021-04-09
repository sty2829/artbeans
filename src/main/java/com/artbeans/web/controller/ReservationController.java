package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.ReservationView;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	
	//이용자가 예약정보 화면에서 봐야할 데이터를 보내는 메서드
	@GetMapping("/reservation/{eiNum}")
	public ReservationView getView(@PathVariable Integer eiNum) {
		ReservationView reservationView = rService.getReservationView(eiNum);
		return reservationView;
	}
	
	//이용자가 예약하고 난 데이터를 저장하는 메서드
	@PostMapping("/reservation")
	public int insert(@RequestBody ReservationTicketInfo rti) {
		log.info("eti => {}", rti);
		rService.saveReservationTicek(rti);
		return rti.getRtiNum();
	}
}
