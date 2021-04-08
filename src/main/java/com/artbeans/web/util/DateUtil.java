package com.artbeans.web.util;

import java.util.Date;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Slf4j
public class DateUtil {

	
	private static final String YYYY_MM_DD = "yyyy-MM-dd";
	
	
	public static Date compareDate (Date startDate) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Date date = new Date();
		 try {
			Date today = sdf.parse(sdf.format(date));
			if(today.compareTo(startDate) > 0) {
				log.info("투데이가 더크면 이날짜로 동일하거나 시작날짜가 크면 반환 X");
				return today;
			} else if(today.compareTo(startDate) < 0){
				log.info("시작 잘짜 더큼");
			} else {
				log.info("동일");
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		 
		return null;
	}
	
	public static String getDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		return sdf.format(date);
	}
}
