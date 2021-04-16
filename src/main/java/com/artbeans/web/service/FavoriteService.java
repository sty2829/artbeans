package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.entity.FavoriteExhibition;

public interface FavoriteService {

	List<FavoriteExhibition> getFavoriteExhibition(FavoriteExhibition favorite);
	FavoriteExhibition getFavorite(Integer uiNum);
}
