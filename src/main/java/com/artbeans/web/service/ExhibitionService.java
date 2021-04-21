package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.entity.GalleryInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);

	ExhibitionInfo getExhibitionInfo(Integer eiNum);

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
	DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);

	// 나중에 지울 것
	DataTable<ExhibitionInfo> getExhiListDemo(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);//

	// DataTable<ExhibitionInfo> getExhibitionInfos(Pageable pageable,
	// DataTable<ExhibitionInfo> exhibitionInfo);
	// test
	DataTable<ExhibitionInfo> getExhiListDemoss(String giAddress, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	// 전시회정보찾기 위해 추가
	List<ExhibitionInfo> getExhibitionFindByUiNum(Integer uiNum);

	// 배너허가를 위한 업데이트
	void updateExhibitionInfoEiBanner(ExhibitionInfo exhibitionInfo) throws Exception;

	// admin page
	Page<ExhibitionInfo> getBeforeConfirmLists(Pageable pageable);

	DataTable<ExhibitionInfo> getOpeningCalendarList(String year, String month, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

	DataTable<ExhibitionInfo> getOpeningCalendarListOneday(String eiStartDate, Pageable pageable,
			DataTable<ExhibitionInfo> dtExhibitionInfo);

}
