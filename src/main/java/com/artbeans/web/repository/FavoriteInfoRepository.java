package com.artbeans.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.artbeans.web.entity.FavoriteInfo;

public interface FavoriteInfoRepository extends JpaRepository<FavoriteInfo, Integer> {

	
	public List<FavoriteInfo> findAllByUserInfoUiNum(Integer uiNum);
	
	@Modifying
	@Transactional	
	@Query(value = "DELETE FROM favorite_info WHERE favorite_info.fvi_num IN :fviNumList", nativeQuery = true)
	List<Integer> deleteAllByIdInQuery(List<Integer> fviNumList);
	
	
}
