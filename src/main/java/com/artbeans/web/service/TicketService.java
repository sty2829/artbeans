package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.TicketInfo;

public interface TicketService {

	List<TicketInfo> getReservations(TicketInfo ti);
	
	TicketInfo saveTicket(TicketInfo ti, Integer riNum);
	
	int confirmReservation(String impId, String merchantId);
	
	int cancleReservation(Integer tiNum);
	
	//예약티켓 진행중리스트 조회
	List<UserTicketDTO> getProgressTicketList(Integer uiNum);
	
	//예약티켓 지난리스트 조회
	Page<UserTicketDTO> getPastTicketList(Integer uiNum, Pageable pageable);
}
