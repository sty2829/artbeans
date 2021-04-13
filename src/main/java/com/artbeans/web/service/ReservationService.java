package com.artbeans.web.service;

import java.util.Map;

import com.artbeans.web.dto.ReservationScheduleDTO;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationService {

	com.artbeans.web.dto.ReservationSchedule getReservationSchedule(Integer eiNum);
	
	ReservationTicketInfo saveReservationTicket(ReservationTicketInfo rti);

	Map<String, Integer> getReservationTimeMap(Integer eriNum, String dateStr);
}
