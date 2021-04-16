package com.artbeans.web.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.FavoriteExhibition;
import com.artbeans.web.repository.FavoriteRepository;
import com.artbeans.web.service.FavoriteService;
@Service
public class FavoriteImpl implements FavoriteService {
	
	@Autowired
	private FavoriteRepository fRepo;
	@Override
	public List<FavoriteExhibition> getFavoriteExhibition(FavoriteExhibition favorite) {
		return fRepo.findAll();
	}
	@Override
	public FavoriteExhibition getFavorite(Integer uiNum) {
		Optional<FavoriteExhibition> opFi = fRepo.findById(uiNum);
		return opFi.get();
	}

}
