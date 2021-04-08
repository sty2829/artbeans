package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionInfoRepository extends JpaRepository<ExhibitionInfo, Integer> {
	
	public List<ExhibitionInfo> findAllByOrderByEiStartDateAsc();
	public List<ExhibitionInfo> findAllByOrderByEiStartDateDesc();
 
}
