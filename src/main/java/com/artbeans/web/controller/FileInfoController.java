package com.artbeans.web.controller;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.service.FileService;

@Controller
public class FileInfoController {
	@Autowired
	private FileService fileService;
	
	
	
	@PostMapping("/file-insert")
	public @ResponseBody Integer insert( FileInfo fileInfo) throws IllegalStateException, IOException {
		fileService.saveFileInfo(fileInfo);	
		return fileInfo.getFiNum();
	}
	


}
