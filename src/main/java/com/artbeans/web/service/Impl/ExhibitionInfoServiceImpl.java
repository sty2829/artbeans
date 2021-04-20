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
import com.artbeans.web.entity.GalleryInfo;
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
		if(exhibitionInfo.getEiNum()!=null) {
			return exhiRepo.findAllByEiNum(exhibitionInfo.getEiNum());
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
	public ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception {//file 유무 확인해서 조건문 작성할것
		log.info("exhibitionInfo>{}",exhibitionInfo);
		FileInfo fi = exhibitionInfo.getFileInfo();
		if(fi.getFiFile() == null) {
			fi = fileRepo.findById(fi.getFiNum()).get();
			exhibitionInfo.setFileInfo(fi);
			log.info("fi =>  {}", fi);
			return exhiRepo.saveAndFlush(exhibitionInfo);
		}
		//log.info("fiNum=>{}",exhibitionInfo.getFileInfo().getFiNum());
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		if(fi.getFiNum()!=null && fileRepo.findById(fi.getFiNum()).get()!=null) {
			fileRepo.saveAndFlush(fi);
		}
		return exhiRepo.saveAndFlush(exhibitionInfo);
	}

	@Override
	public int deleteExhibitionInfo(Integer eiNum) {
		exhiRepo.deleteById(eiNum);
		if(getExhibitionInfo(eiNum)==null) return 1;
		return 0;
	}

	@Override
    public DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
		//1 은 관리자수락 상태
	    Page<ExhibitionInfo> pb =  exhiRepo.findAllByEiStatus("1", pageable);
	    dtExhibitionInfo.setData(pb.getContent());
	    dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
	    dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtExhibitionInfo;
    }
	
	
	//나중에 지울 것
	@Override
    public DataTable<ExhibitionInfo> getExhiListDemo(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo){
	    Page<ExhibitionInfo> pb =  exhiRepo.findAll( pageable);
	    dtExhibitionInfo.setData(pb.getContent());
	    dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
	    dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtExhibitionInfo;
    }//
	
	
	@Override
	public List<ExhibitionInfo> getExhibitionFindByUiNum(Integer uiNum) {
		return exhiRepo.findAllByUserInfoUiNumAndReservationInfoIsNull(uiNum);
	}
	
	//test
	@Override
	public DataTable<ExhibitionInfo> getExhiListDemoss(String giAddress, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo) {
		log.info("giAddress=>{}","%"+giAddress+"%");
		Page<ExhibitionInfo> pb = exhiRepo.findAllByGalleryInfoGiAddressLike("%"+giAddress+"%", pageable);
		dtExhibitionInfo.setData(pb.getContent());
		dtExhibitionInfo.setRecordsTotal(pb.getTotalElements());
		dtExhibitionInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtExhibitionInfo;
	}
	
}
