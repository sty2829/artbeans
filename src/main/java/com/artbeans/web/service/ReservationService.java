package com.artbeans.web.service;

import java.util.Map;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationService {

	ReservationSchedule getReservationSchedule(Integer eiNum);
	
	Map<String, Integer> getReservationTimeMap(Integer eriNum, String dateStr);
	
	ReservationTicketInfo saveReservation(ReservationTicketInfo rti, Integer eriNum);
	
	int confirmReservation(String impId, String merchantId);
	
	int cancleReservation(Integer rtiNum);
}
