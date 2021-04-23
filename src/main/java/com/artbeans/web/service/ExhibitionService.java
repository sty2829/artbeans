package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);

	ExhibitionInfo getExhibitionInfo(Integer eiNum);
	
	List<ExhibitionInfo> eiUpdateGetExhibitionInfo(Integer uiNum);
	
	ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;

	ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;

	int deleteExhibitionInfo(Integer eiNum);

	List<ExhibitionInfo> getEiBannerLists(ExhibitionInfo exhibitionInfo);

	// getExhibitionInfoLists 대체
	DataTable<ExhibitionInfo> getOpeningList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	DataTable<ExhibitionInfo> getCloseList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	DataTable<ExhibitionInfo> getFutureList(String eiStatus, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	// 변경 지울 것
//	DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);

	// 나중에 지울 것
//	DataTable<ExhibitionInfo> getExhiListDemo(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);//

	// DataTable<ExhibitionInfo> getExhibitionInfos(Pageable pageable,
	// DataTable<ExhibitionInfo> exhibitionInfo);
	// test
	DataTable<ExhibitionInfo> getExhiListDemoss(String giAddress, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	// 전시회정보찾기 위해 추가
	List<ExhibitionInfo> getExhibitionFindByUiNum(UserSession userSession);

	// 배너허가를 위한 업데이트
	void updateExhibitionInfoEiBanner(ExhibitionInfo exhibitionInfo) throws Exception;

	// admin page
	Page<ExhibitionInfo> getBeforeConfirmLists(Pageable pageable);
	
	// admin-ei-update
	void updateExhibitionInfoWithoutFile(Integer eiStatus, Integer giNum, String eiName, String eiArtist, Integer eiCharge, String eiStartDate, String eiEndDate, String eiStartTime,String eiEndTime,String eiContent,Integer uiNum,Integer eiNum)  throws Exception ;

	DataTable<ExhibitionInfo> getOpeningCalendarList(String year, String month, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	DataTable<ExhibitionInfo> getOpeningCalendarListOneday(String eiStartDate, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	// admin-ei 검색바
	Page<ExhibitionInfo> findAllByEiNameLike(String eiName, Pageable pageable);
	Page<ExhibitionInfo> findAllByEiArtistLike(String eiArtist, Pageable pageable);
	Page<ExhibitionInfo> findAllByEiStatusLike(String eiStatus, Pageable pageable);

}
