package com.artbeans.web.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;


@Entity
@Table(name="review_info")
@Data
public class ReviewInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="rvi_num")
	private Integer rviNum;
	
	@Column(name="rvi_title")
	private String rviTitle;
	
	@Column(name="rvi_content")
	private String rviContent;
	
	@Column(name="rvi_hit")
	private Integer rviHit;
	
	@Column(name="credat", insertable = false, updatable = false)
	@ColumnDefault("now()")
	private Date credat;
	
	@Column(name="moddat", insertable = false)
	@ColumnDefault("now()")
	private Date moddat;
		
	@ManyToOne
	@JoinColumn(name = "ui_num")
	private UserInfo userInfo;
	
	@OneToOne(cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "fi_num")
	private FileInfo fileInfo;
	
	@OneToMany(mappedBy = "reviewInfo", cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<CommentInfo> CommentInfos;
	

}
