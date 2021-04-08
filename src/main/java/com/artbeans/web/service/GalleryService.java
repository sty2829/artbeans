package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.GalleryInfo;

public interface GalleryService {
	
	List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoAreaListAsc(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoAreaListDesc(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoNameListAsc(GalleryInfo galleryInfo);
	List<GalleryInfo> getGalleryInfoNameListDesc(GalleryInfo galleryInfo);
	
	GalleryInfo getGalleryInfo(Integer giNum);	
	int saveGalleryInfo(GalleryInfo GalleryInfo) throws Exception;
	

}
