package com.artbeans.web.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.ReviewInfo;

public interface ReviewService {

	Page<ReviewDTO> getReviewInfos(Pageable pageable);
	
	Page<ReviewDTO> getUserReviews(UserSession userSession, Pageable pageable);
	
	int saveReview(UserSession userSession, ReviewInfo reviewInfo) throws Exception;
	
	int updateReview(ReviewInfo reviewInfo) throws Exception;
	
	int removeReview(Integer rviNum);
	
	ReviewDTO getReviewInfo(Integer rviNum);
	
	int saveComment(UserSession userSession, CommentInfo commentInfo);
	
	Page<CommentDTO> getCommentInfos(Integer rviNum, Pageable pageable);

	int deleteComment(Integer ciNum);

	//admin-review 검색바
	Page<ReviewInfo> findAllByRviTitleLike(String rviTitle,Pageable pageable);
	//admin-review 검색바
	Page<ReviewInfo> findAllByRviContentLike(String rviContent,Pageable pageable);
}
