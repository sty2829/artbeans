package com.artbeans.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.ExhibitionReservationInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.repository.ExhibitionReservationInfoRepository;
import com.artbeans.web.service.ExhibitionReservationService;

@Service
public class ExhibitionReservationServiceImpl implements ExhibitionReservationService {
	
	@Autowired
	private ExhibitionInfoRepository eiRepo;
	
	@Autowired
	private ExhibitionReservationInfoRepository eriRepo;

	@Override
	public ExhibitionReservationInfo saveExhibitionReservation(ExhibitionReservationInfo exhibitionReservationInfo) {
		return eriRepo.save(exhibitionReservationInfo);
	}

	@Override
	public List<ExhibitionReservationInfo> getExhibitionReservations() {
		return eriRepo.findAll();
	}

	@Override
	public ExhibitionReservationInfo getExhibitionReservation(Integer eiNum) {
		return eriRepo.findById(eiNum).get();
	}

	//전시회 인서트에서 uiNum으로 예약등록가능한 전시회리스트 보여줌
	@Override
	public List<ExhibitionInfo> getExhibitionFindByUiNum(Integer uiNum) {
		return eiRepo.findAllByUserInfoUiNumAndExhibitionReservationInfoIsNull(uiNum);
	}

}
