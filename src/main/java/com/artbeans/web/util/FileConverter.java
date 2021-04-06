package com.artbeans.web.util;

import java.io.File;
import java.io.IOException;

import com.artbeans.web.entity.FileInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileConverter {
	
	private final static String ROOT = "C:\\simstudy\\workspace\\artbeans\\src\\main\\webapp\\resources\\assets\\img\\";
	
	public static void fileInsert(FileInfo fileInfo, String fiType) throws Exception {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
		String fiSize = (fileInfo.getFiFile().getSize()) + "Byte";
 		if(fiName==null) {
			throw new Exception("파일은 필수 항목입니다!");
		}
		int idx = fiName.lastIndexOf(".");
		String extName = fiName.substring(idx);
		String path = (ROOT+fiType+"\\\\") + System.nanoTime() + extName;
		fileInfo.setFiOriginalname(fiName);
		fileInfo.setFiSize(fiSize);
		fileInfo.setFiPath(path);
		fileInfo.setFiType(fiType);
		log.info("fileInfo=>{}", fileInfo);
		File file = new File(path);
		fileInfo.getFiFile().transferTo(file);
	}
}
