package com.artbeans.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.artbeans.web.dto.ReservationSchedule;
import com.artbeans.web.dto.ReservationTimeDTO;

public class DateUtil {

	private static final String YYYY_MM_DD = "yyyy-MM-dd";
	
	
	public static ReservationSchedule getMinDate(ReservationSchedule rs) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);

		List<String> disableList = Arrays.asList(rs.getDisable().split(","));
		
		rs.setDisableList(disableList);
		
		List<Date> dateList = new ArrayList<>();
		
		for(String dateStr : disableList) {
			try {
				Date parseDate = sdf.parse(dateStr);
				dateList.add(parseDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		Date date = new Date();
		String format = sdf.format(date);
		try {
			date = sdf.parse(format);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Date minDate = StringToDate(rs.getMinDate());
		
		if(date.compareTo(minDate) > 0) {
			minDate = date;
		}
		dateList.sort(new Comparator<Date>() {
				@Override
				public int compare(Date o1, Date o2) {
					return o1.compareTo(o2);
				}
			});
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(minDate);
		
		for(Date d : dateList) {
			if(d.compareTo(minDate) > 0) {
				break;
			}else if(d.compareTo(minDate) == 0){
				cal.add(Calendar.DATE, 1);
				minDate = cal.getTime();
			}
		}
		
		
		rs.setMinDate(dateToString(minDate));
		
	    return rs;
	}
	
	public static List<ReservationTimeDTO> setDisableTime(List<ReservationTimeDTO> rtList, String dateStr) {
		LocalDate today = LocalDate.now();
		LocalDate targetDate = LocalDate.parse(dateStr, DateTimeFormatter.ISO_DATE);
		int hour = LocalTime.now().getHour();
		for(ReservationTimeDTO rt : rtList) {
			if(today.equals(targetDate)) {
				int targetHour = Integer.parseInt(rt.getTime().substring(0,2));
				if(hour >= targetHour) {
					rt.setDisableTime(true);
					continue;
				}
			}
			rt.setDisableTime(false);
		}
		
		return rtList;
	}
	
	
	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		return sdf.format(date);
	}
	
	public static Date StringToDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD);
		Date date;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
