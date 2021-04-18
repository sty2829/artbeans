package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.entity.CommentInfo;

public interface CommentInfoRepository extends JpaRepository<CommentInfo, Integer>{

	List<CommentDTO> findAllByReviewInfoRviNum(Integer rviNum);
}
