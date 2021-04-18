package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.ReviewInfo;
import com.artbeans.web.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//커뮤니티 리뷰리스트 호출
	@GetMapping("/reviews")
	public List<ReviewInfo> getReviews() {
		return reviewService.getReviewInfos();
	}
	
	//리뷰 상세화면
	@GetMapping("/review/{rviNum}")
	public ReviewDTO getReview(@PathVariable Integer rviNum) {
		return reviewService.getReviewInfo(rviNum);
	}
	
	//유저리뷰 저장
	@PostMapping("/review")
	public int saveReview(ReviewInfo reviewInfo) throws Exception {
		log.info("reviewInfo => {}", reviewInfo);
		return reviewService.saveReview(reviewInfo);
	}
	
	//리뷰댓글 저장
	@PostMapping("/review/comment")
	public int saveComment(@RequestBody CommentInfo commentInfo) {
		log.info("commentInfo => {}", commentInfo);
		return reviewService.saveComment(commentInfo);
	}
	
	//해당 리뷰의 댓글 호출
	@GetMapping("/review/comment/{rviNum}")
	public List<CommentDTO> getComments(@PathVariable Integer rviNum) {
		return reviewService.getCommentInfos(rviNum);
	}
}
