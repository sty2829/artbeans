package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface GalleryRepository extends JpaRepository<GalleryInfo, Integer> {
	public List<GalleryInfo> findAllByGiNameLikeOrderByGiNum(String giName);
	
	public Page<GalleryInfo> findAllByGiAddressLike(String giAddress, Pageable pageable);

}
