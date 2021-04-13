package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStartDateAsc(Pageable pageable);
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
	public List<ExhibitionInfo> findAllByEiNameLikeOrderByEiNum(String eiName);
	//유저가 가지고있는 전시회리스트 예약정보.. 씀
	
	//@Query("SELECT ei FROM ExhibitionInfo ei LEFT JOIN ExhibitionReservationInfo eri where  ")
	public List<ExhibitionInfo> findAllByUserInfoUiNum(Integer uiNum);
 
}
