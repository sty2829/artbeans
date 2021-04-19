package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.api.Result;
import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.repository.GalleryRepository;
import com.artbeans.web.service.GalleryService;
import com.artbeans.web.util.FileConverter;
import com.artbeans.web.util.NaverMapApi;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class GalleryServiceImpl implements GalleryService {
	
	private static final String TYPE = "gallery";
	
	@Autowired 
	private NaverMapApi naverMapApi; 
	
	@Autowired
	private GalleryRepository gRepo;
	
	@Override
	public List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo) {
		if(galleryInfo.getGiName()!=null) {
			return gRepo.findAllByGiNameLikeOrderByGiNum("%"+galleryInfo.getGiName()+"%");
		}
		return gRepo.findAll();
	}

	@Override
	public GalleryInfo getGalleryInfo(Integer giNum) {
		Optional<GalleryInfo> opEt = gRepo.findById(giNum);
		if(opEt.isEmpty()) return null;
		return opEt.get();
	}

	@Override
	public int saveGalleryInfo(GalleryInfo galleryInfo) throws Exception {
		FileConverter.fileInsert(galleryInfo.getFileInfo(), TYPE);
		Result result = naverMapApi.getResult(galleryInfo.getGiAddress());
		String x = result.getAddresses().get(0).getX();
		String y = result.getAddresses().get(0).getY();
		galleryInfo.setGiAddressX(x);
		galleryInfo.setGiAddressY(y);		
		gRepo.save(galleryInfo);
		return galleryInfo.getGiNum();
	}

	@Override
	public DataTable<GalleryInfo> getGalleryLists(Pageable pageable, DataTable<GalleryInfo> dtGalleryInfo) {
		Page<GalleryInfo> pb = gRepo.findAll(pageable);
		dtGalleryInfo.setData(pb.getContent());
		dtGalleryInfo.setRecordsTotal(pb.getTotalElements());
		dtGalleryInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtGalleryInfo;
	}
	
	@Override
	public DataTable<GalleryInfo> getGalleryListss(String giAddress, Pageable pageable, DataTable<GalleryInfo> dtGalleryInfo) {
		log.info("giAddress=>{}","%"+giAddress+"%");
		Page<GalleryInfo> pb = gRepo.findAllByGiAddressLike("%"+giAddress+"%", pageable);
				
				//findAll(pageable);
		dtGalleryInfo.setData(pb.getContent());
		dtGalleryInfo.setRecordsTotal(pb.getTotalElements());
		dtGalleryInfo.setRecordsFiltered(pb.getTotalElements());
	    return dtGalleryInfo;
	}
	
}
