package com.artbeans.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="favorite_info")
public class FavoriteInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="fvi_num")
	private Integer fviNum;
	
	@ManyToOne
	@JoinColumn(name = "ei_num")
	private ExhibitionInfo exhibitionInfo;
	
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
}
