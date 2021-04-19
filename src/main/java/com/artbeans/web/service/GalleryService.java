package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface GalleryService {
	
	List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo);
	
	GalleryInfo getGalleryInfo(Integer giNum);	
	int saveGalleryInfo(GalleryInfo GalleryInfo) throws Exception;
	
	DataTable<GalleryInfo> getGalleryLists(Pageable pageable, DataTable<GalleryInfo> dtGalleryInfo);
	DataTable<GalleryInfo> getGalleryListss(String giAddress, Pageable pageable, DataTable<GalleryInfo> dtGalleryInfo);
	

}
