package com.artbeans.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "file_info")
@AllArgsConstructor
@NoArgsConstructor
public class FileInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fi_num")
	private Integer fiNum;
	
	@Column(name = "fi_type")
	private String fiType;
	
	@Column(name = "fi_originalname")
	private String fiOriginalname;
	
	@Column(name = "fi_size")
	private String fiSize;
	
	@Column(name = "fi_path")
	private String fiPath;
	
	@Transient
	private MultipartFile fiFile;
	

}
