package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.dto.ExhibitionDTO;
import com.artbeans.web.dto.Search;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);
	
	//페이지 동적, 사용중 (상혁)
	Page<ExhibitionInfo> getExhibitionInfos(Search Search, Pageable pageable);
	
	// 사용중 (상혁)
	Page<ExhibitionInfo> getExhiAddrList(String giAddress, Search Search, Pageable pageable);
	
	ExhibitionDTO getExhibitionInfo(Integer eiNum);
	
	List<ExhibitionInfo> eiUpdateGetExhibitionInfo(Integer uiNum);
	
	ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;

	ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;

	int deleteExhibitionInfo(Integer eiNum);
	
	// 전시회정보찾기 위해 추가
	List<ExhibitionInfo> getExhibitionFindByUiNum(UserSession userSession);

	// 배너허가를 위한 업데이트
	void updateExhibitionInfoEiBanner(ExhibitionInfo exhibitionInfo) throws Exception;

	// admin page
	Page<ExhibitionInfo> getBeforeConfirmLists(Pageable pageable);
	
	// admin-ei-update
	void updateExhibitionInfoWithoutFile(Integer eiStatus, Integer giNum, String eiName, String eiArtist, Integer eiCharge, String eiStartDate, String eiEndDate, String eiStartTime,String eiEndTime,String eiContent,Integer uiNum,Integer eiNum)  throws Exception ;

	Page<ExhibitionInfo> getOpeningCalendarList(String year, String month, Pageable pageable);
	Page<ExhibitionInfo> getOpeningCalendarListOneday(String eiStartDate, Pageable pageable);

	// admin-ei 검색바
	Page<ExhibitionInfo> findAllByEiNameLike(String eiName, Pageable pageable);
	Page<ExhibitionInfo> findAllByEiArtistLike(String eiArtist, Pageable pageable);
	Page<ExhibitionInfo> findAllByEiStatusLike(String eiStatus, Pageable pageable);

	// admin-banner
	Page<ExhibitionInfo> findAllByEiBanner(Integer eiBanner, Pageable pageable);
}
