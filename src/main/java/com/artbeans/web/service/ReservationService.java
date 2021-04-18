package com.artbeans.web.service;

import java.util.Map;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationInfo;

public interface ReservationService {

	ReservationSchedule getReservationSchedule(Integer eiNum);
	
	ReservationInfo saveReservation(ReservationInfo reservationInfo);

	Map<String, Integer> getReservationTimes(Integer riNum, String dateStr);

}
