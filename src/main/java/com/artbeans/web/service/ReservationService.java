package com.artbeans.web.service;

import com.artbeans.web.dto.ReservationView;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationService {

	ReservationView getReservationView(Integer eiNum);
	
	ReservationTicketInfo saveReservationTicek(ReservationTicketInfo rti);
}
