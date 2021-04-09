package com.artbeans.web.service;

import java.io.IOException;

import com.artbeans.web.entity.FileInfo;



public interface FileService {

	FileInfo saveFileInfo(FileInfo fileInfo) throws IllegalStateException, IOException;
	

}
