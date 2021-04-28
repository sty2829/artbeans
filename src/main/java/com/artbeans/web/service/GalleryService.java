package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.GalleryInfo;

public interface GalleryService {
	
	List<GalleryInfo> getGalleryInfos(GalleryInfo galleryInfo);
	
	GalleryInfo getGalleryInfo(Integer giNum);	
	int saveGalleryInfo(GalleryInfo GalleryInfo) throws Exception;
	
	Page<GalleryInfo> getGalleryLists(Pageable pageable);
	Page<GalleryInfo> getGalleryAddrList(String giAddress, Pageable pageable);

	//사용중 (가온)
	void updateGalleryInfoStatus(String data) throws Exception;
	

}
