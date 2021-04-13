package com.artbeans.web.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.artbeans.web.dto.DataTable;
import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);
	List<ExhibitionInfo> getExhibitionInfoNewestList(ExhibitionInfo exhibitionInfo);
	List<ExhibitionInfo> getExhibitionInfoDeadlineList(ExhibitionInfo exhibitionInfo);
	ExhibitionInfo getExhibitionInfo(Integer eiNum);
	ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;
	ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;
	int deleteExhibitionInfo(Integer eiNum);
	DataTable<ExhibitionInfo> getExhibitionInfoLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);
	List<ExhibitionInfo> getExhibitionInfoNewestLists(Pageable pageable, DataTable<ExhibitionInfo> dtExhibitionInfo);
	
	//DataTable<ExhibitionInfo> getExhibitionInfos(Pageable pageable, DataTable<ExhibitionInfo> exhibitionInfo);

}
