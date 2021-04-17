package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.service.ExhibitionService;
import com.artbeans.web.util.FileConverter;


@Service
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
	@Override
	public List<ExhibitionInfo> getEiBannerLists(ExhibitionInfo exhibitionInfo) {
		
			return exhiRepo.findAllByEiBanner(1);
		
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
		//log.info("fiNum=>{}",exhibitionInfo.getFileInfo().getFiNum());
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

	@Override
    public DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		
	    Page<ExhibitionInfo> pb =  exhiRepo.findAllByEiStatus("1", pageable);
	    dtExhibitionInfo.setData(pb.getContent());
	    dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
	    dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtExhibitionInfo;
    }
	
	
}
