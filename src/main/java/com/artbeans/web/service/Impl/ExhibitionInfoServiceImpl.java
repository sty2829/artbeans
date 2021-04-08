package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;

@Service
public class ExhibitionInfoServiceImpl implements ExhibitionService {
	
	private static final String TYPE = "exhibition";
	
	@Autowired
	private ExhibitionInfoRepository exhiRepo;

	@Override
	public List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo) {
		return exhiRepo.findAll();
	}
	
	public List<ExhibitionInfo> getExhibitionInfoNewestList(ExhibitionInfo exhibitionInfo) {
		return exhiRepo.findAllByOrderByEiStartDateAsc();
	}
	
	public List<ExhibitionInfo> getExhibitionInfoDeadlineList(ExhibitionInfo exhibitionInfo) {
		return exhiRepo.findAllByOrderByEiStartDateDesc();
	}

	@Override
	public ExhibitionInfo getExhibitionInfo(Integer eiNum) {
		Optional<ExhibitionInfo> opEt = exhiRepo.findById(eiNum);
		if(opEt.isEmpty()) return null;
		return opEt.get();
	}

	@Override
	public ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception  {
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		return exhiRepo.save(exhibitionInfo);
	}

	@Override
	public ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception {
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		return exhiRepo.save(exhibitionInfo);
	}

	@Override
	public int deleteExhibitionInfo(Integer eiNum) {
		exhiRepo.deleteById(eiNum);
		if(getExhibitionInfo(eiNum)==null) return 1;
		return 0;
	}
}
