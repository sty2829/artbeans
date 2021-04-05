package com.artbeans.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;


@Entity
@Table(name="exhibition_review_comment")
@Data
@DynamicUpdate
public class ExhibitionReviewComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="erc_num")
	private int ercNum;
	
	@Column(name="erc_content")
	private String ercContent;
	
	@Column(name="credat", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date credat;
	
	@Column(name="credat", insertable = false)
	@ColumnDefault("now()")
	private Date moddat;
		
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
	
	@ManyToOne
	@JoinColumn(name = "er_num")
	private ExhibitionReview exhibitionReview;
}
