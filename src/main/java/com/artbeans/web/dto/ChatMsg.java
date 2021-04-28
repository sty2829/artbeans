package com.artbeans.web.dto;

import lombok.Data;

@Data
public class ChatMsg {
	
	private String type;
	private String msg;
	private String name;
	private int usercount;

}
