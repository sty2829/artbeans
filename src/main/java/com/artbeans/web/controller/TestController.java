package com.artbeans.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.artbeans.web.api.iamport.Cancel;
import com.artbeans.web.api.iamport.Iamport;
import com.artbeans.web.api.iamport.IamportResult;
import com.artbeans.web.dto.ReservationDTO;
import com.artbeans.web.entity.ReservationTicketInfo;
import com.artbeans.web.repository.ReservationTicketRepository;

@RestController
public class TestController {

	@Autowired
	private Iamport iamport;
	
	@Autowired
	private ReservationTicketRepository rtiRepo;
	
	
	@GetMapping("/test/payment")
	public IamportResult<Cancel> getCancel(@RequestParam String impUid) {
		return iamport.canclePaymentByImpId(impUid);
	}
	
	@PostMapping("/test/reservation")
	public int getSave(@RequestBody ReservationTicketInfo rti) {
		//rtiRepo.save(rti);
		return 1;
	}
	
	@GetMapping("/test/reservation/{rtiNum}")
	public ReservationDTO getCancel(@PathVariable Integer rtiNum) {
		return rtiRepo.findByRtiNum(rtiNum);
	}
	
	
}
