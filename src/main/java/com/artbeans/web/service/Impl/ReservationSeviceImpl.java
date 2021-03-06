package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.ReservationTimeDTO;
import com.artbeans.web.dto.Search;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.ReservationInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.repository.ReservationInfoRepository;
import com.artbeans.web.service.ReservationService;
import com.artbeans.web.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Service
public class ReservationSeviceImpl implements ReservationService {
	
	@Autowired
	private ExhibitionInfoRepository eiRepo;
	
	@Autowired
	private ReservationInfoRepository riRepo;

	@Override
	public ReservationSchedule getReservationSchedule(Integer eiNum) {
		ReservationSchedule rs = riRepo.getReservationSchedule(eiNum);
        return DateUtil.getMinDate(rs);
	}
	
	@Override
	public int saveReservation(ReservationInfo reservationInfo) {
		int count = 0;
		Integer eiNum = reservationInfo.getExhibitionInfo().getEiNum();
		Optional<ExhibitionInfo> opEi = eiRepo.findById(eiNum);
		if(!opEi.isEmpty()) {
			reservationInfo.setExhibitionInfo(opEi.get());
			count = riRepo.save(reservationInfo).getRiNum();
			return count;
		}
		
		return count;
	}

	@Override
	public List<ReservationTimeDTO> getReservationTimes(Integer riNum, String dateStr) {
		List<ReservationTimeDTO> rtList = riRepo.getReservationTime(riNum, DateUtil.StringToDate(dateStr));
		return DateUtil.setDisableTime(rtList, dateStr);
	}

	@Override
	public Page<ReservationInfo> getReservationList(Pageable pageable) {
		return riRepo.getReservationList(pageable);
	
	}
	
}
