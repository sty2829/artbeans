package com.artbeans.web.controller;

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
import com.artbeans.web.dto.UserSession;
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
	@GetMapping("/reviews/user")
	public Page<ReviewDTO> getUserReviews(UserSession userSession, Pageable pageable) {
		return reviewService.getUserReviews(userSession, pageable);
	}
	
	//리뷰 상세화면
	@GetMapping("/review/{rviNum}")
	public ReviewDTO getReview(@PathVariable Integer rviNum) {
		return reviewService.getReviewInfo(rviNum);
	}
	
	//유저리뷰 저장
	@PostMapping("/review/{tiNum}")
	public int saveReview(UserSession userSession, ReviewInfo reviewInfo, @PathVariable Integer tiNum) throws Exception {
		log.info("reviewInfo => {}", reviewInfo);
		return reviewService.saveReview(userSession, reviewInfo, tiNum);
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
	public int saveComment(UserSession userSession, @RequestBody CommentInfo commentInfo) {
		log.info("commentInfo => {}", commentInfo);
		return reviewService.saveComment(userSession, commentInfo);
	}
	
	//해당 리뷰의 댓글 호출
	@GetMapping("/review/comment/{rviNum}")
	public Page<CommentDTO> getComments(@PathVariable Integer rviNum, Pageable pageable) {
		return reviewService.getCommentInfos(rviNum, pageable);
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
	public Page<ReviewInfo> findAllByRviContentLike(String rviContent,Pageable pageable){
		return reviewService.findAllByRviContentLike(rviContent, pageable);
	}

}
