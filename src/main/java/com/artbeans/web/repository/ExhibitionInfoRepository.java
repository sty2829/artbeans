package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStatus(Pageable pageable);
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);
	public List<ExhibitionInfo> findAllByEiBanner(Integer eiBanner);
	public List<ExhibitionInfo> findAllByEiNum(Integer eiNum);
	
	public Page<ExhibitionInfo> findAllByEiStatus(String eiStatus, Pageable pageable);
	
	//test
	public Page<ExhibitionInfo> findAllByGalleryInfoGiAddressLike(String giAddress, Pageable pageable);
	
	//심태윤- 전시회예약정보 인서트시 보여줄 전시회리스트
	public List<ExhibitionInfo> findAllByUserInfoUiNumAndReservationInfoIsNull(Integer uiNum);
 
	
	 @Transactional
	 @Modifying
	 @Query(value = "UPDATE exhibition_info set ei_banner =:eiBanner where ei_num = :eiNum",
	            nativeQuery = true)
	public void updateExhibitionInfoEiBanner(@Param("eiBanner") Integer eiBanner, @Param("eiNum") Integer eiNum);
	 
	@Query("SELECT ei FROM ExhibitionInfo ei where ei.eiStatus = ?1 AND ei.eiStartDate <= current_date AND ei.eiEndDate >= current_date")
	public Page<ExhibitionInfo> getList(String eiStatus, Pageable pageable);
}
