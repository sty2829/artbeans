package com.artbeans.web.service;

import java.util.List;
import java.util.Map;


import com.artbeans.web.entity.FavoriteExhibition;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationService {

	ReservationSchedule getReservationSchedule(Integer eiNum);

	Map<String, Integer> getReservationTimeMap(Integer eriNum, String dateStr);

	List<ReservationTicketInfo> getReservations(ReservationTicketInfo rti);
	
	ReservationTicketInfo saveReservation(ReservationTicketInfo rti, Integer eriNum);
	
	int confirmReservation(String impId, String merchantId);
	
	int cancleReservation(Integer rtiNum);
}
