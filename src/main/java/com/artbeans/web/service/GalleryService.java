package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.GalleryInfo;

public interface GalleryService {
	
	List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoAreaList(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoNameList(GalleryInfo galleryInfo);
	
	GalleryInfo getGalleryInfo(Integer giNum);
	
	int saveGalleryInfo(GalleryInfo GalleryInfo) throws Exception;
	

}
