package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.ExhibitionReservationInfo;

public interface ExhibitionReservationService {

	ExhibitionReservationInfo saveExhibitionReservation(ExhibitionReservationInfo exhibitionReservationInfo);
	
	List<ExhibitionReservationInfo> getExhibitionReservations(); 
	
	ExhibitionReservationInfo getExhibitionReservation(Integer eiNum);
	
}
