package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStatus(Pageable pageable);
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);
	public List<ExhibitionInfo> findAllByEiBanner(Integer eiBanner);
	
	public Page<ExhibitionInfo> findAllByEiStatus(String eiStatus, Pageable pageable);
	
	//심태윤- 전시회예약정보 인서트시 보여줄 전시회리스트
	public List<ExhibitionInfo> findAllByUserInfoUiNumAndExhibitionReservationInfoIsNull(Integer uiNum);
 
}
