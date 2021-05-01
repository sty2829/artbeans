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

@RestController
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	@GetMapping("/reservation-ticket")
	public @ResponseBody List<TicketInfo> getList(TicketInfo ti) {
		return ticketService.getReservations(ti);
	}
	
	@PostMapping("/ticket/{riNum}")
	public TicketInfo save(UserSession userSession,@RequestBody TicketInfo ti, @PathVariable Integer riNum) {
		return ticketService.saveTicket(userSession, ti, riNum);
	}
	
	@PostMapping("/ticket/confirm")
	public int confirm(String impId, String merchantId) {
		return ticketService.confirmReservation(impId, merchantId);
		
		
	}
	@DeleteMapping("/ticket/cancel/{tiNum}")
	public int cancel(@PathVariable Integer tiNum) {
		return ticketService.cancleReservation(tiNum);
	}
	
	
	@GetMapping("/ticket/progress")
	public List<UserTicketDTO> getProgressTickets(UserSession userSession) {
		return ticketService.getProgressTicketList(userSession);
	}
	
	@GetMapping("/ticket/past")
	public Page<UserTicketDTO> getPastTickets(UserSession userSession, Pageable pageable) {
		return ticketService.getPastTicketList(userSession, pageable);
	}
}
