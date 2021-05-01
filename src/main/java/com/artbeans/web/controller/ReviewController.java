package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
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

@RestController
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviews")
	public Page<ReviewDTO> getReviews(Pageable pageable) {
		return reviewService.getReviewInfos(pageable);
	}
	
	@GetMapping("/reviews/user")
	public Page<ReviewDTO> getUserReviews(UserSession userSession, Pageable pageable) {
		return reviewService.getUserReviews(userSession, pageable);
	}
	
	@GetMapping("/review/{rviNum}")
	public ReviewDTO getReview(@PathVariable Integer rviNum) {
		return reviewService.getReviewInfo(rviNum);
	}
	
	@PostMapping("/review")
	public int saveReview(UserSession userSession, ReviewInfo reviewInfo) throws Exception {
		return reviewService.saveReview(userSession, reviewInfo);
	}
	
	@PatchMapping("/review")
	public int updateReview(UserSession userSession, ReviewInfo reviewInfo) throws Exception {
		return reviewService.updateReview(userSession, reviewInfo);
	}
	
	@DeleteMapping("/review/{rviNum}")
	public int deleteReview(@PathVariable Integer rviNum) {
		return reviewService.removeReview(rviNum);
	}
	
	@PostMapping("/review/comment")
	public int saveComment(UserSession userSession, @RequestBody CommentInfo commentInfo) {
		return reviewService.saveComment(userSession, commentInfo);
	}
	
	@GetMapping("/review/comment/{rviNum}")
	public Page<CommentDTO> getComments(@PathVariable Integer rviNum, Pageable pageable) {
		return reviewService.getCommentInfos(rviNum, pageable);
	}
	
	@PatchMapping("/review/comment")
	public int updateComment(@RequestBody CommentInfo commentInfo) {
		return reviewService.updateComment(commentInfo);
	}
	
	@DeleteMapping("/review/comment/{ciNum}")
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
