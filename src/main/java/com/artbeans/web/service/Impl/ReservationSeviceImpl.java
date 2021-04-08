package com.artbeans.web.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.domain.ReservationDateExclude;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;
import com.artbeans.web.repository.ReservationTicketRepository;
import com.artbeans.web.service.ReservationService;
import com.artbeans.web.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationSeviceImpl implements ReservationService {
	
	@Autowired
	private ExhibitionReservationInfoRepository eriRepo;
	
	@Autowired
	private ReservationTicketRepository rtiRepo;
	
	@Autowired 
	private ReservationDateExclude rde;

	@Override
	public ExhibitionReservationInfo getReservationView(Integer eiNum) {
		ExhibitionReservationInfo eri = eriRepo.findByExhibitionInfoEiNum(eiNum);
		rde.exclude(eri);
		//List<ReservationTicketInfo> rtiList = rtiRepo.findAllByExhibitionReservationInfoEriNum(eri.getEriNum());
		
		DateUtil.compareDate(eri.getEriStartDate());
		log.info("eri => {}", eri);
		return eri;
	}

	@Override
	public ReservationTicketInfo saveReservationTicek(ReservationTicketInfo rti) {
		return rtiRepo.save(rti);
	}

}
