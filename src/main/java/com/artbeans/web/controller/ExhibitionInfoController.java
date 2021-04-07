package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.entity.ExhibitionInfo;
import com.artbeans.web.repository.ExhibitionInfoRepository;
import com.artbeans.web.util.FileConverter;

import lombok.extern.slf4j.Slf4j;

/*
 * 테스트용 전시회 컨트롤러입니다.
 * 
 */
@RestController
@Slf4j
public class ExhibitionInfoController {

	private static final String TYPE = "exhibition";
	
	@Autowired
	private ExhibitionInfoRepository exhibitionInfoRepository;
	
	@PostMapping("/test/exhibition")
	public int insert(ExhibitionInfo exhibitionInfo) throws Exception {
		log.info("exhibition => {}", exhibitionInfo);
		FileConverter.fileInsert(exhibitionInfo.getFileInfo(), TYPE);
		exhibitionInfoRepository.save(exhibitionInfo);
		return exhibitionInfo.getEiNum();
	}
	
	@GetMapping("/test/exhibition/{eiNum}")
	public ExhibitionInfo getExhibition(@PathVariable Integer eiNum) {
		return exhibitionInfoRepository.findById(eiNum).get();
	}
}
