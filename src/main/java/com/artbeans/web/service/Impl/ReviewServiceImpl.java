package com.artbeans.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.ReviewInfo;
import com.artbeans.web.repository.CommentInfoRepository;
import com.artbeans.web.repository.ReviewInfoRepository;
import com.artbeans.web.service.ReviewService;
import com.artbeans.web.util.FileConverter;

@Service
public class ReviewServiceImpl implements ReviewService {

	private final String TYPE = "review";
	
	@Autowired
	private ReviewInfoRepository rviRepo;
	
	@Autowired
	private CommentInfoRepository ciRepo;
	
	@Override
	public List<ReviewDTO> getReviewInfos() {
		return rviRepo.findAllBy();
	}
	
	@Override
	public int saveReview(ReviewInfo reviewInfo) throws Exception {
		FileConverter.fileInsert(reviewInfo.getFileInfo(), TYPE);
		rviRepo.save(reviewInfo);
		return 1;
	}

	@Override
	public ReviewDTO getReviewInfo(Integer rviNum) {
		return rviRepo.getByRviNum(rviNum);
	}

	@Override
	public int saveComment(CommentInfo commentInfo) {
		return ciRepo.save(commentInfo).getCiNum();
	}

	@Override
	public List<CommentDTO> getCommentInfos(Integer rviNum) {
		return ciRepo.findAllByReviewInfoRviNum(rviNum);
	}

	@Override
	public int deleteComment(Integer ciNum) {
		ciRepo.deleteById(ciNum);
		if(getCommentInfos(ciNum)==null) return 1;
		return 0;
	}

}
