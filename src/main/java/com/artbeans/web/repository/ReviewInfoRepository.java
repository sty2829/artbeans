package com.artbeans.web.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.ReviewInfo;

public interface ReviewInfoRepository extends JpaRepository<ReviewInfo, Integer> {
	
	ReviewDTO getByRviNum(Integer rviNum);
	
	Page<ReviewDTO> findAllBy(Pageable pageable);
	
	Page<ReviewDTO> findAllByUserInfoUiNum(Integer uiNum, Pageable pageable);
	
	//admin-review 검색바
	Page<ReviewInfo> findAllByRviTitleLike(String rviTitle, Pageable pageable);
	//admin-review 검색바
	Page<ReviewInfo> findAllByRviContentLike(String rviContent, Pageable pageable);
	
}
