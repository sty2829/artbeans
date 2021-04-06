package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.GalleryInfo;

public interface GalleryRepository extends JpaRepository<GalleryInfo, Integer> {

}
