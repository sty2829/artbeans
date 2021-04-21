package com.artbeans.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.TicketInfo;

public interface TicketInfoRepository extends JpaRepository<TicketInfo, Integer> {
	
	List<TicketInfo> findAllByReservationInfoRiNumAndTiDate(Integer riNum, Date tiDate);
	
	//타임리스트
	@Query("SELECT new com.artbeans.web.dto.SumTicketTime(ti.tiTime AS time, sum(ti.tiNumber) AS sum) "
			+ " FROM TicketInfo ti LEFT JOIN ti.reservationInfo ri "
			+ " where ti.reservationInfo.riNum = ?1 AND ti.tiDate = ?2 "
			+ " GROUP BY ti.tiTime")
	List<SumTicketTime> sumTicketGroupByTime(Integer riNum, Date date);

	//유저번호로 예매티켓리스트 조회
	@Query("SELECT ti.tiNum AS tiNum, ei.eiName AS eiName,  gi.giName AS giName, "
			+ " pi.piMerchantId AS piMerchantId, fi.fiPath AS imgPath, "
			+ " function('date_format', ti.tiDate, '%Y-%m-%d') AS tiDate, "
			+ " ti.tiTime AS tiTime, ti.tiNumber AS tiNumber"
			+ " FROM TicketInfo ti left join "
			+ " ti.paymentInfo pi left join"
			+ " ti.reservationInfo ri left join"
			+ " ri.exhibitionInfo ei left join"
			+ " ei.fileInfo fi left join"
			+ " ei.galleryInfo gi where ti.userInfo.uiNum = ?1 AND ti.tiState = 2"
			+ " AND current_timestamp < cast(concat(function('date_format', ti.tiDate, '%Y-%m-%d'), ' ', ti.tiTime) AS LocalDateTime)")
	List<UserTicketDTO> findAllProgressUserTicket(Integer uiNum);
	
	
	@Query("SELECT ti.tiNum AS tiNum, ei.eiName AS eiName,  gi.giName AS giName, "
			+ " pi.piMerchantId AS piMerchantId, fi.fiPath AS imgPath, "
			+ " function('date_format', ti.tiDate, '%Y-%m-%d') AS tiDate, "
			+ " ti.tiTime AS tiTime, ti.tiNumber AS tiNumber"
			+ " FROM TicketInfo ti left join "
			+ " ti.paymentInfo pi left join"
			+ " ti.reservationInfo ri left join"
			+ " ri.exhibitionInfo ei left join"
			+ " ei.fileInfo fi left join"
			+ " ei.galleryInfo gi where ti.userInfo.uiNum = ?1 AND ti.tiState = 2"
			+ " AND current_timestamp > cast(concat(function('date_format', ti.tiDate, '%Y-%m-%d'), ' ', ti.tiTime) AS LocalDateTime)")
	Page<UserTicketDTO> findAllPastUserTicket(Integer uiNum, Pageable pageable);
	

	
	

}


