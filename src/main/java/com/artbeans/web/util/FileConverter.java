package com.artbeans.web.util;

import java.io.File;

import com.artbeans.web.entity.FileInfo;

import lombok.extern.slf4j.Slf4j;

/*
 * 파일공통입니다. 
 */
@Slf4j
public class FileConverter {
	
	/*
	 * 파일위치 안건드리셔도 됩니다.
	 */
	private final static String PROJECT_PATH = System.getProperty("user.dir");
	private final static String ROOT = "\\src\\main\\webapp\\resources\\assets\\img\\";
	
	public static void fileInsert(FileInfo fileInfo, String fiType) throws Exception {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
		String fiSize = (fileInfo.getFiFile().getSize()) + "Byte";
 		if(fiName==null) {
			throw new Exception("파일은 필수 항목입니다!");
		}
		int idx = fiName.lastIndexOf(".");
		String extName = fiName.substring(idx);
		String path = System.nanoTime() + extName;
		fileInfo.setFiOriginalname(fiName);
		fileInfo.setFiSize(fiSize);
		fileInfo.setFiPath(path);
		fileInfo.setFiType(fiType);
		log.info("fileInfo=>{}", fileInfo);
		log.info("path => {}", PROJECT_PATH + ROOT + fiType + "\\\\" + path );
		File file = new File(PROJECT_PATH + ROOT + fiType + "\\\\" + path);
		fileInfo.getFiFile().transferTo(file);
		
	}
}
