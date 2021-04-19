package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.ReviewInfo;

public interface ReviewInfoRepository extends JpaRepository<ReviewInfo, Integer> {
	
	ReviewDTO getByRviNum(Integer rviNum);

}