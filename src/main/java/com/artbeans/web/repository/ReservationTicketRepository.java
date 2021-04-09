package com.artbeans.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationTicketRepository extends JpaRepository<ReservationTicketInfo, Integer> {
	
	//@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri where rti.exhibitionReservationInfo.eriNum = (SELECT eri.eriNum FROM ExhibitionReservationInfo eri where eri.exhibitionInfo.eiNum = ?1) GROUP By rti.rtiDate")
	
	List<ReservationTicketInfo> findAllByExhibitionReservationInfoEriNumAndRtiDate(Integer eriNum, Date rtiDate);
	
	@Query("SELECT rti.rtiDate AS date FROM ReservationTicketInfo rti where rti.exhibitionReservationInfo.eriNum = ?1 GROUP BY rti.rtiDate HAVING sum(rti.rtiNumber) = ?2")
	List<Date> excludeGroupByDate(Integer eriNum, Long max);
}


