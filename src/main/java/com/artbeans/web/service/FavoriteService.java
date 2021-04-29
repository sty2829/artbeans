package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.FavoriteInfo;

public interface FavoriteService {

	public List<FavoriteInfo> getFavoriteExhibition(Integer uiNum);

	public Integer deleteFavorite(List<Integer> fviNumList);
	
	public Integer getFviEiNum(Integer eiNum);
	
	public Integer saveFavoriteExhibition(FavoriteInfo fvi);
}
