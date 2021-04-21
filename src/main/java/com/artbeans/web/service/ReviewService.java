package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.ReviewInfo;

public interface ReviewService {

	Page<ReviewDTO> getReviewInfos(Pageable pageable);
	
	//전시회 리뷰 등록
	int saveReview(ReviewInfo reviewInfo) throws Exception;
	
	ReviewDTO getReviewInfo(Integer rviNum);
	
	int saveComment(CommentInfo commentInfo);
	
	List<CommentDTO> getCommentInfos(Integer rviNum);

	int deleteComment(Integer ciNum);

}
