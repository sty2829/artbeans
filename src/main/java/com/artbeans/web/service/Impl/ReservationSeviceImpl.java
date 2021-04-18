package com.artbeans.web.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.repository.ReservationInfoRepository;
import com.artbeans.web.repository.TicketInfoRepository;
import com.artbeans.web.service.ReservationService;
import com.artbeans.web.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationSeviceImpl implements ReservationService {
	
	@Autowired
	private ReservationInfoRepository riRepo;
	
	@Autowired
	private TicketInfoRepository tiRepo;

	@Override
	public ReservationSchedule getReservationSchedule(Integer eiNum) {
		//전시회 PK로 전시회스케쥴 호출
		com.artbeans.web.dto.ReservationSchedule rs = riRepo.getReservationSchedule(eiNum);
		log.info("rs => {}", rs);
		
		//mindate 계산후 반환
        return DateUtil.getMinDate(rs);
	}
	
	@Override
	public ReservationInfo saveReservation(ReservationInfo reservationInfo) {
		return riRepo.save(reservationInfo);
	}
	
	@Override
	public Map<String,Integer> getReservationTimes(Integer riNum, String dateStr) {
		//스트링날짜 데이트로 변환
		Date date = DateUtil.StringToDate(dateStr);
		//해당 전시회 예약정보 호출
		ReservationInfo eri = riRepo.findById(riNum).get();
		//해당 전시회 예약정보키 와 해당 날짜로 시간대별 티켓합 리스트 호출
		List<SumTicketTime> sttList = tiRepo.sumTicketGroupByTime(riNum, date);
		//전시회예약정보와 시간대별 티켓합산 리스트로 시간대별 리스트 구성
		return  DateUtil.getTimeList(eri, sttList);
	}
	
}
