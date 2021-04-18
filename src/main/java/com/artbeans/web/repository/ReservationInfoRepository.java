package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.entity.ReservationInfo;

public interface ReservationInfoRepository extends JpaRepository<ReservationInfo, Integer> {
	
	//전시회PK로 검색
	ReservationInfo findByExhibitionInfoEiNum(Integer eiNum);
	
	//예약스케쥴쿼리
	@Query(name = "find_reservation_schedule_dto", nativeQuery = true)
	ReservationSchedule getReservationSchedule(@Param("eiNum") Integer eiNum);
	
}   
