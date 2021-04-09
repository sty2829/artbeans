package com.artbeans.web.service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.domain.Reservation;
import com.artbeans.web.dto.ReservationView;
import com.artbeans.web.entity.ExhibitionReservationInfo;
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
	private Reservation reservation;

	@Override
	public ReservationView getReservationView(Integer eiNum) {
		ExhibitionReservationInfo eri = eriRepo.findByExhibitionInfoEiNum(eiNum);
		
		Integer eriNum = eri.getEriNum();
		long max = reservation.dayMaximumTicket(eri);
		
        List<Date> excludeDateList = rtiRepo.excludeGroupByDate(eriNum, max);
        
        return reservation.ReservationSchedule(eri, excludeDateList);
	}

	@Override
	public ReservationTicketInfo saveReservationTicek(ReservationTicketInfo rti) {
		return rtiRepo.save(rti);
	}

}
