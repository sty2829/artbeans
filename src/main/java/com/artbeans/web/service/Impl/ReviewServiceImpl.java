package com.artbeans.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.entity.ReviewInfo;
import com.artbeans.web.repository.CommentInfoRepository;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.repository.ReviewInfoRepository;
import com.artbeans.web.service.ReviewService;
import com.artbeans.web.util.FileConverter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {

	private final String TYPE = "review";
	
	@Autowired
	private ReviewInfoRepository rviRepo;
	
	@Autowired
	private CommentInfoRepository ciRepo;
	
	@Autowired
	private FileInfoRepository fiRepo;
	
	@Override
	public Page<ReviewDTO> getReviewInfos(Pageable pageable) {
		return rviRepo.findAllBy(pageable);
	}
	
	@Override
	public Page<ReviewDTO> getUserReviews(Integer uiNum, Pageable pageable) {
		return rviRepo.findAllByUserInfoUiNum(uiNum, pageable);
	}
	
	@Override
	public int saveReview(ReviewInfo reviewInfo) throws Exception {
		FileConverter.fileInsert(reviewInfo.getFileInfo(), TYPE);
		rviRepo.save(reviewInfo);
		return 1;
	}

	@Override
	public int updateReview(ReviewInfo reviewInfo) throws Exception {
		FileInfo fileInfo = reviewInfo.getFileInfo();
		if(fileInfo.getFiFile() == null) {
			log.info("들어오나요");
			fileInfo = fiRepo.findById(fileInfo.getFiNum()).get();
			reviewInfo.setFileInfo(fileInfo);
			rviRepo.saveAndFlush(reviewInfo);
			return  1;
		}
		log.info("일로가나요");
		FileConverter.fileInsert(fileInfo, TYPE);
		if (fileInfo.getFiNum() != null && fiRepo.findById(fileInfo.getFiNum()).get() != null) {
			fiRepo.saveAndFlush(fileInfo);
		}
		rviRepo.saveAndFlush(reviewInfo);
		
		return 1;
	}

	@Override
	public int removeReview(Integer rviNum) {
		rviRepo.deleteById(rviNum);
		if(getReviewInfo(rviNum) == null) {
			return 1;
		}
		return 0;
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
	
	//admin-review 검색바
	@Override
	public Page<ReviewInfo> findAllByRviTitleLike(String rviTitle, Pageable pageable) {
		return rviRepo.findAllByRviTitleLike("%"+rviTitle+"%", pageable);
	}
	//admin-review 검색바
	@Override
	public Page<ReviewInfo> findAllByRviContentLike(String rviContent, Pageable pageable) {
		return rviRepo.findAllByRviContentLike("%"+rviContent+"%", pageable);
	}


	

	
}
