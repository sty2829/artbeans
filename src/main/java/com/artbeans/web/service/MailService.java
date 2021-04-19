package com.artbeans.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "psh951009@gmail.com";
	
	public void mailSend(SimpleMailMessage message) {
		message.setFrom(MailService.FROM_ADDRESS);
		mailSender.send(message);
	}
}
