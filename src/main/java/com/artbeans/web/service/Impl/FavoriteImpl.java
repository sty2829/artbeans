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
	public List<FavoriteInfo> getFavoriteExhibition(Integer uiNum) {
	log.info("UserSession=>{}",uiNum);
	log.info("fRepo.findAllByUserInfoUiNum(userSession.getUiNum());=>{}",fRepo.findAllByUserInfoUiNum(uiNum));
	
		return fRepo.findAllByUserInfoUiNum(uiNum);
	}

	@Override
	public Integer deleteFavorite(List<Integer> fviNumList) {
		if(fviNumList!= null) {
			fRepo.deleteAllByIdInQuery(fviNumList);
			return 1;
		}
		
		return null;
	}

	@Override
	public Integer getFviEiNum(Integer eiNum) {
		
		if(fRepo.findAllByExhibitionInfoEiNum(eiNum)!=null) {
			return 1;
		}
		return 0;
	}

	@Override
	public Integer saveFavoriteExhibition(FavoriteInfo fvi) {
		log.info("impl fvi=>{}",fvi);
		if(fvi.getUserInfo().getUiNum()!=0 && fvi.getFviNum()== null) {
			fRepo.save(fvi);
			return 1;
		}
		if(fvi.getUserInfo().getUiNum()==0) {
			return 2;
		}
		if(fvi.getFviNum()!=null) {
			fRepo.deleteById(fvi.getFviNum());
			return 0;
		}
		return null;
	}



}
