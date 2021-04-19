package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.ReviewInfo;

public interface ReviewService {

	List<ReviewInfo> getReviewInfos();
	
	//전시회 리뷰 등록
	int saveReview(ReviewInfo reviewInfo) throws Exception;
	
	ReviewDTO getReviewInfo(Integer rviNum);
	
	int saveComment(CommentInfo commentInfo);
	
	List<CommentDTO> getCommentInfos(Integer rviNum);

	int deleteComment(Integer ciNum);

}
