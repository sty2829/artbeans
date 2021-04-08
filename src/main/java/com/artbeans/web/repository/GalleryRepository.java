package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface GalleryRepository extends JpaRepository<GalleryInfo, Integer> {
	public List<GalleryInfo> findAllByOrderByGiNameAsc();
	public List<GalleryInfo> findAllByOrderByGiAddressAsc();

}
