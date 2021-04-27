package com.artbeans.web.service.Impl;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.CommentDTO;
import com.artbeans.web.dto.ReviewDTO;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.CommentInfo;
import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.entity.ReviewInfo;
import com.artbeans.web.entity.UserInfo;
import com.artbeans.web.repository.CommentInfoRepository;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.repository.ReviewInfoRepository;
import com.artbeans.web.repository.UserInfoRepository;
import com.artbeans.web.service.ReviewService;
import com.artbeans.web.util.FileUtil;

@Service
public class ReviewServiceImpl implements ReviewService {

	private final String TYPE = "review";
	
	@Autowired
	private ReviewInfoRepository rviRepo;
	
	@Autowired
	private CommentInfoRepository ciRepo;
	
	@Autowired
	private FileInfoRepository fiRepo;
	
	@Autowired
	private UserInfoRepository uiRepo;
	
	@Override
	public Page<ReviewDTO> getReviewInfos(Pageable pageable) {
		return rviRepo.findAllBy(pageable);
	}
	
	@Override
	public Page<ReviewDTO> getUserReviews(UserSession userSession, Pageable pageable) {
		return rviRepo.findAllByUserInfoUiNum(userSession.getUiNum(), pageable);
	}
	
	@Override
	public int saveReview(UserSession userSession, ReviewInfo reviewInfo, Integer tiNum) throws Exception {
		int count = 0;
		Optional<UserInfo> opUI = uiRepo.findById(userSession.getUiNum());
		if(!opUI.isEmpty()) {
			reviewInfo.setUserInfo(opUI.get());
			FileUtil.fileInsert(reviewInfo.getFileInfo(), TYPE);
			count = rviRepo.save(reviewInfo).getRviNum();
		}
		return count;
	}

	@Override
	public int updateReview(ReviewInfo reviewInfo) throws Exception {
		int count = 0;
		FileInfo fileInfo = reviewInfo.getFileInfo();
		if(fileInfo != null && fileInfo.getFiNum() != null) {
			Optional<FileInfo> opFI = fiRepo.findById(fileInfo.getFiNum());
			if(!opFI.isEmpty() && fileInfo.getFiFile() != null) {
				FileUtil.fileUpdate(fileInfo, TYPE, opFI.get().getFiPath());
				count = rviRepo.save(reviewInfo).getRviNum();
			}else {
				reviewInfo.setFileInfo(opFI.get());
				count = rviRepo.save(reviewInfo).getRviNum();
			}
		}
		return count;
	}

	@Override
	public int removeReview(Integer rviNum) {
		//이것도 수정
		int count = 0;
		rviRepo.deleteById(rviNum);
		Optional<ReviewInfo> opRI = rviRepo.findById(rviNum);
		if(opRI.isEmpty()) {
			count = 1;
		}
		return count;
	}

	@Override
	public ReviewDTO getReviewInfo(Integer rviNum) {
		return rviRepo.getByRviNum(rviNum);
	}

	@Override
	public Page<CommentDTO> getCommentInfos(Integer rviNum, Pageable pageable) {
		return ciRepo.findAllByReviewInfoRviNum(rviNum, pageable);
	}
	
	@Override
	public int saveComment(UserSession userSession, CommentInfo commentInfo) {
		int count = 0;
		Optional<UserInfo> userInfo = uiRepo.findById(userSession.getUiNum());
		if(!userInfo.isEmpty()) {
			commentInfo.setUserInfo(userInfo.get());
			count = ciRepo.save(commentInfo).getCiNum();
		}
		return count;
	}
	

	@Override
	public int updateComment(CommentInfo commentInfo) {
		int count = 0;
		Optional<CommentInfo> opCI = ciRepo.findById(commentInfo.getCiNum());
		if(!opCI.isEmpty()) {
			CommentInfo ci = opCI.get();
			ci.setCiContent(commentInfo.getCiContent());
			ci.setModdat(new Date());
			count = ciRepo.save(ci).getCiNum();
		}
		return count;
	}

	@Override
	public int deleteComment(Integer ciNum) {
		//필요해서 수정합니다.
		int count = 0;
		ciRepo.deleteById(ciNum);
		Optional<CommentInfo> opCI = ciRepo.findById(ciNum);
		if(opCI.isEmpty()) {
			count = 1;
		}
		return count;
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
