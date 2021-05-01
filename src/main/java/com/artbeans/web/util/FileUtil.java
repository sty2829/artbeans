package com.artbeans.web.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.artbeans.web.entity.FileInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FileUtil {
	
	private static String root;
	
	private static String editorPath;
	
	@Value("${fileUtil.path.root}")
    public void setRoot(String root) {
		FileUtil.root = root;

    }
	
	@Value("${fileUtil.path.editor}")
    public void setEditorPath(String editor) {
		FileUtil.editorPath = editor;
    }
	
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
		File file = new File(root + fiType + File.separator + path);
		fileInfo.getFiFile().transferTo(file);
		
	}
	
	public static void fileUpdate(FileInfo fileInfo, String fiType, String deletePath) throws Exception {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
 		if(fiName==null) {
			throw new Exception("파일은 필수 항목입니다!");
		}
 		String fiSize = (fileInfo.getFiFile().getSize()) + "Byte";
 		
		int idx = fiName.lastIndexOf(".");
		String extName = fiName.substring(idx);
		String path = System.nanoTime() + extName;
		fileInfo.setFiOriginalname(fiName);
		fileInfo.setFiSize(fiSize);
		fileInfo.setFiPath(path);
		fileInfo.setFiType(fiType);
		
		File file = new File(root + fiType + File.separator + path);
		fileInfo.getFiFile().transferTo(file);
		
		file = new File(root + fiType + deletePath);
		
		if(!file.delete()) {
			log.info(fiType + "의 " + deletePath + " 파일삭제에 실패하였습니다.");
		}
	}
	
	public static Map<String,String> ckeditorUploadImg(MultipartFile upload){
		String fileName = upload.getOriginalFilename();
		File target = new File(editorPath + fileName);
		try {
			upload.transferTo(target);
			Map<String,String> rMap = new HashMap<>();
			rMap.put("uploaded","true");
			rMap.put("url", "/upload/" + fileName);
			return rMap;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
