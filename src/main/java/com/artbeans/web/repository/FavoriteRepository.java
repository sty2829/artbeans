package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.FavoriteExhibition;

public interface FavoriteRepository extends JpaRepository<FavoriteExhibition, Integer> {

}
