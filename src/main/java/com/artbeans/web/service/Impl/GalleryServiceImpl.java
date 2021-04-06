package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;
import com.artbeans.web.repository.GalleryRepository;
import com.artbeans.web.service.GalleryService;

@Service
public class GalleryServiceImpl implements GalleryService {
	
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

}
