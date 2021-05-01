package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.TicketInfo;

public interface TicketService {

	List<TicketInfo> getReservations(TicketInfo ti);
	
	TicketInfo saveTicket(UserSession userSession, TicketInfo ti, Integer riNum);
	
	int confirmReservation(String impId, String merchantId);
	
	int cancleReservation(Integer tiNum);
	
	List<UserTicketDTO> getProgressTicketList(UserSession userSession);
	
	Page<UserTicketDTO> getPastTicketList(UserSession userSession, Pageable pageable);
}
