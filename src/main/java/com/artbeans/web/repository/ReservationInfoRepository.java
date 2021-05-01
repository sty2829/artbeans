package com.artbeans.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.ReservationTimeDTO;
import com.artbeans.web.entity.ReservationInfo;

public interface ReservationInfoRepository extends JpaRepository<ReservationInfo, Integer> {
	
	@EntityGraph(attributePaths = {"exhibitionInfo", "exhibitionInfo.galleryInfo","exhibitionInfo.fileInfo","exhibitionInfo.userInfo","exhibitionInfo.galleryInfo.fileInfo"})
	@Override
	List<ReservationInfo> findAll();
	
	ReservationInfo findByExhibitionInfoEiNum(Integer eiNum);
	
	@Query(name = "find_reservation_schedule_dto", nativeQuery = true)
	ReservationSchedule getReservationSchedule(@Param("eiNum") Integer eiNum);
	
	@Query(name = "find_reservation_time_dto", nativeQuery = true)
	List<ReservationTimeDTO> getReservationTime(@Param("riNum") Integer riNum, @Param("targetDate") Date targetDate);
	
	@Query("SELECT ri FROM ReservationInfo ri where ri.riEndTime < current_date")	
	Page<ReservationInfo> getReservationList(Pageable pageable);
}   
