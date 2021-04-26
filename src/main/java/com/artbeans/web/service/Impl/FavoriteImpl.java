package com.artbeans.web.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.FavoriteInfo;
import com.artbeans.web.repository.FavoriteInfoRepository;
import com.artbeans.web.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class FavoriteImpl implements FavoriteService {
	
	@Autowired
	private FavoriteInfoRepository fRepo;

	@Override
	public List<FavoriteInfo> getFavoriteExhibition(UserSession userSession) {
	log.info("UserSession=>{}",userSession);
	log.info("fRepo.findAllByUserInfoUiNum(userSession.getUiNum());=>{}",fRepo.findAllByUserInfoUiNum(userSession.getUiNum()));
	
		return fRepo.findAllByUserInfoUiNum(userSession.getUiNum());
	}

}
