package com.artbeans.web.service;

import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationService {

	ExhibitionReservationInfo getReservationView(Integer eiNum);
	
	ReservationTicketInfo saveReservationTicek(ReservationTicketInfo rti);
}
