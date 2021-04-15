package com.artbeans.web.service.Impl;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artbeans.web.entity.FileInfo;
import com.artbeans.web.repository.FileInfoRepository;
import com.artbeans.web.service.FileService;

@Service
public class FileServiceImpl implements FileService {
	private final static String ROOT = "";
	
	
	@Autowired
	private FileInfoRepository fileInfoRepo;

	@Override
	public FileInfo saveFileInfo(FileInfo fileInfo) throws IllegalStateException, IOException {
		String fiName = fileInfo.getFiFile().getOriginalFilename();
		int idx = fiName.lastIndexOf(".");
		String extName = fiName.substring(idx);
		String path = ROOT + System.nanoTime() + extName;
		fileInfo.setFiOriginalname(fiName);
		fileInfo.setFiPath(path);
		fileInfoRepo.save(fileInfo);
		File f = new File(path);
		fileInfo.getFiFile().transferTo(f);
		return fileInfo;
	}


	

}
