package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionReservationInfo;

public interface ExhibitionReservationInfoRepository extends JpaRepository<ExhibitionReservationInfo, Integer> {
	
	//전시회PK로 검색
	ExhibitionReservationInfo findByExhibitionInfoEiNum(Integer eiNum);
	
	//@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri where eri.eriNum = ?1 GROUP BY rti.rtiDate")
	//List<TicketSumDate> ticketSumGroupByDate(Integer eriNum);
	

	
	
	//@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti where rti.exhibitionReservationInfo.eriNum = (SELECT eri.eriNum FROM ExhibitionReservationInfo eri where eri.exhibitionInfo.eiNum = ?1) GROUP By rti.rtiDate")
	
	
	
	
	
	//@Query("SELECT rti FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri")
	//List<ReservationTicketInfo> getList();
	
	
}   
