package com.artbeans.web.service;

import java.util.List;
import java.util.Optional;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);
	List<ExhibitionInfo> getExhibitionInfoNewestList(ExhibitionInfo exhibitionInfo);
	List<ExhibitionInfo> getExhibitionInfoDeadlineList(ExhibitionInfo exhibitionInfo);
	ExhibitionInfo getExhibitionInfo(Integer eiNum);
	ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo) throws Exception;
	ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo);
	int deleteExhibitionInfo(Integer eiNum);

}
