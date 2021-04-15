package com.artbeans.web.service;

import java.util.Map;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.entity.TicketCancelInfo;

public interface ReservationService {

	ReservationSchedule getReservationSchedule(Integer eiNum);
	
	Map<String, Integer> getReservationTimeMap(Integer eriNum, String dateStr);
	
	void cancleReservation(TicketCancelInfo tci);
}
