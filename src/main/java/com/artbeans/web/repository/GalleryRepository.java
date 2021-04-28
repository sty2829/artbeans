package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

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
	
	//사용중(가온)
	@Transactional
	@Modifying
	@Query(value = "UPDATE gallery_info set gi_status =:giStatus where gi_num = :giNum", nativeQuery = true)
	public void updateGalleryInfoStatus(@Param("giStatus") String giStatus, @Param("giNum") String giNum);
}
