package com.artbeans.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public Page<ReviewDTO> getReviews(Pageable pageable) {
		return reviewService.getReviewInfos(pageable);
	}
	
	//해당유저의 리뷰 모두가져오기
	@GetMapping("/reviews/{uiNum}")
	public Page<ReviewDTO> getUserReviews(@PathVariable Integer uiNum, Pageable pageable) {
		return reviewService.getUserReviews(uiNum, pageable);
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
	
	//유저리뷰 수정
	@PostMapping("/review-update")
	public int updateReview(ReviewInfo reviewInfo) throws Exception {
		log.info("reviewInfo => {}", reviewInfo);
		return reviewService.updateReview(reviewInfo);
	}
	
	//리뷰 삭제
	@DeleteMapping("/review/{rviNum}")
	public int deleteReview(@PathVariable Integer rviNum) {
		log.info("rviNum => {}", rviNum);
		return reviewService.removeReview(rviNum);
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
	
	//리뷰관련 comments 삭제
	@GetMapping("/review/delete/{ciNum}")
	public int deleteComment(@PathVariable Integer ciNum) {
		return reviewService.deleteComment(ciNum);
	}
	
	//admin-review 검색바
	@GetMapping("/review-search-bar/title")
	public Page<ReviewInfo> findAllByRviTitleLike(String rviTitle,Pageable pageable){
		return reviewService.findAllByRviTitleLike(rviTitle, pageable);
	}
	
	//admin-review 검색바
	@GetMapping("/review-search-bar/content")
	public Page<ReviewInfo> findAllByRviContentLike(String rviTitle,Pageable pageable){
		return reviewService.findAllByRviContentLike(rviTitle, pageable);
	}
	
}
