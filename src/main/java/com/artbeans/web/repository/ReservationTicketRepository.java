package com.artbeans.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.artbeans.web.dto.ReservationDTO;
import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.dto.UserTicketDTO;
import com.artbeans.web.entity.ReservationTicketInfo;

public interface ReservationTicketRepository extends JpaRepository<ReservationTicketInfo, Integer> {
	
	//@Query("SELECT new com.artbeans.web.dto.TicketSumDate(rti.rtiDate AS date, sum(rti.rtiNumber) AS sum) FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri where rti.exhibitionReservationInfo.eriNum = (SELECT eri.eriNum FROM ExhibitionReservationInfo eri where eri.exhibitionInfo.eiNum = ?1) GROUP By rti.rtiDate")
	
	List<ReservationTicketInfo> findAllByExhibitionReservationInfoEriNumAndRtiDate(Integer eriNum, Date rtiDate);
	
	//추후 삭제 예정
	//@Query("SELECT rti.rtiDate AS date FROM ReservationTicketInfo rti where rti.exhibitionReservationInfo.eriNum = ?1 GROUP BY rti.rtiDate HAVING sum(rti.rtiNumber) = ?2")
	//List<Date> excludeGroupByDate(Integer eriNum, Long max);
	
	//타임리스트
	@Query("SELECT new com.artbeans.web.dto.SumTicketTime(rti.rtiTime AS time, sum(rti.rtiNumber) AS sum) "
			+ " FROM ReservationTicketInfo rti LEFT JOIN rti.exhibitionReservationInfo eri "
			+ " where rti.exhibitionReservationInfo.eriNum = ?1 AND rti.rtiDate = ?2 "
			+ " GROUP BY rti.rtiTime")
	List<SumTicketTime> sumTicketGroupByTime(Integer eriNum, Date date);

	//유저번호로 예매티켓리스트 조회
	@Query("SELECT rti.rtiNum AS rtiNum, ei.eiName AS eiName,  gi.giName AS giName, "
			+ " pi.piMerchantId AS piMerchantId, fi.fiPath AS imgPath, "
			+ " function('date_format', rti.rtiDate, '%Y-%m-%d') AS rtiDate, "
			+ " rti.rtiTime AS rtiTime, rti.rtiNumber AS rtiNumber,"
			+ " cast(concat(function('date_format', rti.rtiDate, '%Y-%m-%d'), ' ', rti.rtiTime) AS LocalDateTime) AS dateTime"
			+ " FROM ReservationTicketInfo rti left join "
			+ " rti.paymentInfo pi left join"
			+ " rti.exhibitionReservationInfo eri left join"
			+ " eri.exhibitionInfo ei left join"
			+ " ei.fileInfo fi left join"
			+ " ei.galleryInfo gi where rti.userInfo.uiNum = ?1 AND rti.rtiState = 2")
	List<UserTicketDTO> findAllUserTicket(Integer uiNum); 

	ReservationDTO findByRtiNum(Integer i);
}


