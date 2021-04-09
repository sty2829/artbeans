package com.artbeans.web.dto;

import java.util.List;

import lombok.Data;

@Data
public class DataTable<T> {
	private List<T> data;
	private Integer draw;
	private Long recordsTotal;
	private Long recordsFiltered;
	

}
