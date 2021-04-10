package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.api.Result;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.repository.GalleryRepository;
import com.artbeans.web.service.GalleryService;
import com.artbeans.web.util.FileConverter;
import com.artbeans.web.util.NaverMapApi;


@Service
public class GalleryServiceImpl implements GalleryService {
	
	private static final String TYPE = "gallery";
	
	@Autowired 
	private NaverMapApi naverMapApi; 
	
	@Autowired
	private GalleryRepository gRepo;
	
	@Override
	public List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo) {
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
	public List<GalleryInfo> getGalleryInfoAreaListAsc(GalleryInfo galleryInfo) {
		
		return gRepo.findAllByOrderByGiAddressAsc();
	}
	
	@Override
	public List<GalleryInfo> getGalleryInfoAreaListDesc(GalleryInfo galleryInfo) {
		return gRepo.findAllByOrderByGiAddressDesc();
	}
	
	@Override
	public List<GalleryInfo> getGalleryInfoNameListAsc(GalleryInfo galleryInfo) {
		return gRepo.findAllByOrderByGiNameAsc();
	}	

	@Override
	public List<GalleryInfo> getGalleryInfoNameListDesc(GalleryInfo galleryInfo) {
		return gRepo.findAllByOrderByGiNameDesc();
	}

}
