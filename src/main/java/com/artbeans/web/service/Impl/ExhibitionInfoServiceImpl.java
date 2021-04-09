package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExhibitionInfoServiceImpl implements ExhibitionService {
	
	private static final String TYPE = "exhibition";
	@Autowired
	private FileInfoRepository fileRepo;
	@Autowired
	private ExhibitionInfoRepository exhiRepo;

	@Override
	public List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo) {
		if(exhibitionInfo.getEiName()!=null) {
			return exhiRepo.findAllByEiNameLikeOrderByEiNum("%"+exhibitionInfo.getEiName()+"%");
		}
		
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
	@Transactional
	public ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception {
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		log.info("fiNum=>{}",exhibitionInfo.getFileInfo().getFiNum());
		FileInfo fi = exhibitionInfo.getFileInfo();
		if(fi.getFiNum()!=null && fileRepo.findById(fi.getFiNum()).get()!=null) {
			fileRepo.saveAndFlush(fi);
		}
		return exhiRepo.save(exhibitionInfo);
	}

	@Override
	public int deleteExhibitionInfo(Integer eiNum) {
		exhiRepo.deleteById(eiNum);
		if(getExhibitionInfo(eiNum)==null) return 1;
		return 0;
	}

//	@Override
//	public DataTable<ExhibitionInfo> getExhibitionInfos(Pageable pageable, DataTable<ExhibitionInfo> exhibitionInfo) {
//		Page<ExhibitionInfo> pageExhibition = exhiRepo.findAll(pageable);
//		exhibitionInfo.setData(pageExhibition.getContent());
//		exhibitionInfo.setRecordsTotal(pageExhibition.getTotalElements());
//		exhibitionInfo.setRecordsFiltered(pageExhibition.getTotalElements());		
//		return exhibitionInfo;
//	}
}
