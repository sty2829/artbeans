package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.FileInfo;

public interface FileInfoRepository extends JpaRepository<FileInfo, Integer> {

}
