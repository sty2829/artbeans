package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface GalleryRepository extends JpaRepository<GalleryInfo, Integer> {
	
	@EntityGraph(attributePaths = {"fileInfo"})
	public List<GalleryInfo> findAllByGiNameLikeOrderByGiNum(String giName);
	@EntityGraph(attributePaths = {"fileInfo"})
	public Page<GalleryInfo> findAllByGiAddressLike(String giAddress, Pageable pageable);
	@EntityGraph(attributePaths = {"fileInfo"}) 
	public Page<GalleryInfo> findAll(Pageable pageable);
	@EntityGraph(attributePaths = {"fileInfo"}) 
	public List<GalleryInfo> findAll();

}
