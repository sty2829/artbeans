package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.artbeans.web.dto.TicketSumDate;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ExhibitionReservationInfoRepository extends JpaRepository<ExhibitionReservationInfo, Integer> {
	
	ExhibitionReservationInfo findByExhibitionInfoEiNum(Integer eiNum);
	
	//@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri where eri.eriNum = ?1 GROUP BY rti.rtiDate")
	//List<TicketSumDate> ticketSumGroupByDate(Integer eriNum);
	
	@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti where rti.exhibitionReservationInfo.eriNum = (SELECT eri.eriNum FROM ExhibitionReservationInfo eri where eri.exhibitionInfo.eiNum = ?1) GROUP By rti.rtiDate")
	List<TicketSumDate> ticketSumGroupByDate(Integer eiNum);
	
	//@Query("SELECT rti FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri")
	//List<ReservationTicketInfo> getList();
	
	
}   
