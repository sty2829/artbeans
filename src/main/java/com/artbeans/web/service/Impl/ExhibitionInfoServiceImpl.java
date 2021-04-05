package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.service.ExhibitionService;

@Service
public class ExhibitionInfoServiceImpl implements ExhibitionService {
	@Autowired
	private ExhibitionInfoRepository exhiRepo;

	@Override
	public List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo) {
		return exhiRepo.findAll();
	}

	@Override
	public Optional<ExhibitionInfo> getExhibitionInfo(Integer eiNum) {
		return exhiRepo.findById(eiNum);
	}

	@Override
	public ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) {
		return exhiRepo.save(exhibitionInfo);
	}

	@Override
	public ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteExhibitionInfo(Integer eiNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
