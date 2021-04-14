package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStartDateAsc(Pageable pageable);
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);
	
	//심태윤- 전시회예약정보 인서트시 보여줄 전시회리스트
	public List<ExhibitionInfo> findAllByUserInfoUiNumAndExhibitionReservationInfoIsNull(Integer uiNum);
 
}
