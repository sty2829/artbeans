package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.ReservationTimeDTO;
import com.artbeans.web.entity.ReservationInfo;

public interface ReservationService {

	ReservationSchedule getReservationSchedule(Integer eiNum);
	
	int saveReservation(ReservationInfo reservationInfo);
	
	List<ReservationTimeDTO> getReservationTimes(Integer riNum, String dateStr);
	
	Page<ReservationInfo> getReservationList(ReservationInfo reservationInfo, Pageable pageable);

}
