package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.FavoriteInfo;

public interface FavoriteInfoRepository extends JpaRepository<FavoriteInfo, Integer> {

	
	public List<FavoriteInfo> findAllByUserInfoUiNum(Integer uiNum);
}
