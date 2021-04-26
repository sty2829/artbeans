package com.artbeans.web.service;

import java.util.List;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.FavoriteInfo;

public interface FavoriteService {

	public List<FavoriteInfo> getFavoriteExhibition(UserSession userSession);

	public Integer deleteFavorite(Integer fviNum);
}
