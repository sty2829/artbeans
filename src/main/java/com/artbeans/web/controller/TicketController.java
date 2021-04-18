package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.TicketInfo;
import com.artbeans.web.service.TicketService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	//이거먼지모르겟다
	@GetMapping("/reservation-ticket")
	public @ResponseBody List<TicketInfo> getList(TicketInfo ti) {
		log.info("ti=>{}",ti);
		return ticketService.getReservations(ti);
	}
	
	//예약 티켓 세이브
	@PostMapping("/ticket/{riNum}")
	public TicketInfo save(@RequestBody TicketInfo ti, @PathVariable Integer riNum) {
		log.info("ti => {}", ti);
		return ticketService.saveTicket(ti, riNum);
	}
	
	//서버에서 결제정보 컨펌
	@PostMapping("/ticket/confirm")
	public int confirm(String impId, String merchantId) {
		log.info("impId => {}", impId);
		log.info("merchantId => {}", merchantId);
		return ticketService.confirmReservation(impId, merchantId);
		
	}
	
	// 전시회 유저예약취소
	@DeleteMapping("/ticket/cancel/{tiNum}")
	public int cancel(@PathVariable Integer tiNum) {
		return ticketService.cancleReservation(tiNum);
	}
}
