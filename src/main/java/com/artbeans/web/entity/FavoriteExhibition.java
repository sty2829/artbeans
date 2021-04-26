package com.artbeans.web.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import lombok.Data;

@Data
@Entity
@Table(name="favorite_exhibition")
public class FavoriteExhibition {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="fe_num")
	private Integer feNum;
	
	@Column(name="fe_exhibition_name")
	private String feExhibitionName;
	
	@Column(name="fe_gallery")
	private String feGalleru;
	
	@Column(name="fe_start_date" ,insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date feStartDate;
	
	@Column(name="fe_end_date" , insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date feEndDate;
	
	@Column(name="fe_link")
	private String feLink;
	
	
	
	@OneToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
}
