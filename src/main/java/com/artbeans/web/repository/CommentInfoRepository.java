package com.artbeans.web.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.entity.CommentInfo;

public interface CommentInfoRepository extends JpaRepository<CommentInfo, Integer>{

	Page<CommentDTO> findAllByReviewInfoRviNum(Integer rviNum, Pageable pageable);
}
