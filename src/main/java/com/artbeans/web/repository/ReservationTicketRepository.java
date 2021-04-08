package com.artbeans.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationTicketRepository extends JpaRepository<ReservationTicketInfo, Integer> {

	
	List<ReservationTicketInfo> findAllByExhibitionReservationInfoEriNumAndRtiDate(Integer eriNum, Date rtiDate);
}
