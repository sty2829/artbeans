package com.artbeans.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.domain.ReservationDateExclude;
import com.artbeans.web.dto.TicketSumDate;
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
		List<TicketSumDate> tsdList = eriRepo.ticketSumGroupByDate(eiNum);
		
		log.info("eriList => {}", tsdList);
		
		//List<TicketSumDate> sumDate = eriRepo.ticketSumGroupByDate(2);
		//log.info("sumDate => {}",sumDate);
		
		//List<ReservationTicketInfo> rtiList = rtiRepo.findAllByExhibitionReservationInfoEriNum(eri.getEriNum());
		
		return null;
	}

	@Override
	public ReservationTicketInfo saveReservationTicek(ReservationTicketInfo rti) {
		return rtiRepo.save(rti);
	}

}
