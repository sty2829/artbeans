package com.artbeans.web.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.artbeans.web.entity.ExhibitionReservationInfo;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ReservationDateExclude {

	public void exclude(ExhibitionReservationInfo eri) {
		Date rtiDate = eri.getRtiList().get(0).getRtiDate();
		log.info("rtiDate => {}", rtiDate);
		
	}
}
