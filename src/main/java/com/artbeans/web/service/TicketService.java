package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.TicketInfo;

public interface TicketService {

	List<TicketInfo> getReservations(TicketInfo ti);
	
	TicketInfo saveTicket(TicketInfo ti, Integer riNum);
	
	int confirmReservation(String impId, String merchantId);
	
	int cancleReservation(Integer tiNum);
}
