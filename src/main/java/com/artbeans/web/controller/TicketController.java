package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.dto.UserTicketDTO;
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
	public TicketInfo save(UserSession userSession,@RequestBody TicketInfo ti, @PathVariable Integer riNum) {
		return ticketService.saveTicket(userSession, ti, riNum);
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
	
	
	//유저예약정보 컨트롤러 작성..
	@GetMapping("/ticket/progress")
	public List<UserTicketDTO> getProgressTickets(UserSession userSession) {
		return ticketService.getProgressTicketList(userSession);
	}
	
	//유저예약정보 컨트롤러 작성..
	@GetMapping("/ticket/past")
	public Page<UserTicketDTO> getPastTickets(UserSession userSession, Pageable pageable) {
		return ticketService.getPastTicketList(userSession, pageable);
	}
}
