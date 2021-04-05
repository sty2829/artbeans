package com.artbeans.web.service;

import java.util.List;
import java.util.Optional;

import com.artbeans.web.entity.ExhibitionInfo;

public interface ExhibitionService {
	List<ExhibitionInfo> getExhibitionInfos(ExhibitionInfo exhibitionInfo);
	ExhibitionInfo getExhibitionInfo(Integer eiNum);
	ExhibitionInfo saveExhibitionInfo(ExhibitionInfo exhibitionInfo);
	ExhibitionInfo updateExhibitionInfo(ExhibitionInfo exhibitionInfo);
	int deleteExhibitionInfo(Integer eiNum);

}
