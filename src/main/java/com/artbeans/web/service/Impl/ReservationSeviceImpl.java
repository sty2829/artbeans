package com.artbeans.web.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.SumTicketTime;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.ReservationSchedule;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;
import com.artbeans.web.repository.ReservationTicketRepository;
import com.artbeans.web.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationSeviceImpl implements ReservationService {
	
	@Autowired
	private ExhibitionReservationInfoRepository eriRepo;
	
	@Autowired
	private ReservationTicketRepository rtiRepo;
	
	@Autowired 
	private ReservationSchedule reservationSchedule;

	@Override
	public ReservationSchedule getReservationSchedule(Integer eiNum) {
		//전시회 PK로 전시회예약정보 호출
		ExhibitionReservationInfo eri = eriRepo.findByExhibitionInfoEiNum(eiNum);
		//하루 맥시멈 티켓 
		long dayMaximum = reservationSchedule.dayMaximumTicket(eri);
		//전시회예약정보 키와 맥시멈티켓수로 더이상 예약할수 없는 날짜 리스트 호출
        List<Date> excludeDateList = rtiRepo.excludeGroupByDate(eri.getEriNum(), dayMaximum);
        //전시회 예약정보와 제외날짜리스트로 스케쥴구성
        return reservationSchedule.createSchedule(eri, excludeDateList);
	}
	
	@Override
	public Map<String,Integer> getReservationTimeMap(Integer eriNum, String dateStr) {
		//view에서 받은 해당날짜를 date로 변환
		Date date = reservationSchedule.StringToDate(dateStr);
		//해당 전시회 예약정보 호출
		ExhibitionReservationInfo eri = eriRepo.findById(eriNum).get();
		//해당 전시회 예약정보키 와 해당 날짜로 시간대별 티켓합 리스트 호출
		List<SumTicketTime> sttList = rtiRepo.sumTicketGroupByTime(eriNum, date);
		//전시회예약정보와 시간대별 티켓합산 리스트로 시간대별 리스트 구성
		return reservationSchedule.reservationTimeList(eri, sttList);
	}

	@Override
	public ReservationTicketInfo saveReservationTicket(ReservationTicketInfo rti) {
		return rtiRepo.save(rti);
	}

	
}
