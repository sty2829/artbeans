package com.artbeans.web.util;

import java.io.File;

import com.artbeans.web.entity.FileInfo;

public class FileConverter {
	
	private final static String ROOT = "C:\\simstudy\\workspace\\aws-sb\\src\\main\\webapp\\resources\\assets\\img\\";
	
	public static FileInfo fileConveter(FileInfo fileInfo, String fiType) throws Exception {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
		String fiSize = (fileInfo.getFiFile().getSize() / 1024 / 1024) + "MB";
 		if(fiName==null) {
			throw new Exception("파일은 필수 항목입니다!");
		}
		int idx = fiName.lastIndexOf(".");
		String extName = fiName.substring(idx);
		String path = (ROOT+fiType) + System.nanoTime() + extName;
		fileInfo.setFiOriginalname(fiName);
		fileInfo.setFiPath(path);
		fileInfo.setFiSize(fiSize);
		fileInfo.setFiType(fiType);
		if(fileInfo.getFiNum()==null) {
			throw new Exception("저장시 오류 발생");
		}
		File f = new File(path);
		fileInfo.getFiFile().transferTo(f);
		
		return fileInfo;
	}
}
