package com.artbeans.web.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	private final static String editorPath = "C:\\Users\\Administrator\\git\\artbeans\\src\\main\\webapp\\resources\\assets\\img\\editor\\";
	
	public static void fileInsert(FileInfo fileInfo, String fiType) throws Exception {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
		String fiSize = (fileInfo.getFiFile().getSize()) + "Byte";
 		if(fiName==null) {
			throw new Exception("파일은 필수 항목입니다!");
		}
 		log.info("fiName => {}", fiName);
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
	
	public static Map<String,String> ckeditorUploadImg(MultipartFile upload){
		String fileName = upload.getOriginalFilename();
		File target = new File(editorPath + fileName);
		try {
			upload.transferTo(target);
			Map<String,String> rMap = new HashMap<>();
			rMap.put("uploaded","true");
			rMap.put("url","/resources/" + fileName);
			return rMap;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
//	String deleteFile = "다운로드.jfif";
//	File file = new File(editorPath + deleteFile);
//	System.out.println(file);
//	file.delete();
//	//if( file.exists() ){//파일존재여부확인
//		File[] files = file.listFiles(); 
//		System.out.println(files[0].getName());
//		for( int i=0; i<files.length; i++){ 
//			if( files[i].delete() ){ 
//				System.out.println(files[i].getName()+" 삭제성공"); 
//			}else{ 
//				System.out.println(files[i].getName()+" 삭제실패"); 
//			} 
//		//} 
//	} 
	
	
}
