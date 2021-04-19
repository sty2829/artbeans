package com.artbeans.web.util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

public class CodeGenerator {
	private static final String BASIC_CODE = "0123456789abcdefghijklmnopqrstuvwuxyABCDEFGHIJKLMNOPQRSTUVWUXY";
	private static final int CODE_LENGTH = 6;
	private static final int PAYMENT_CODE_LENGTH = 13;
	
	public static String getRandomCode() {
		StringBuilder sb = new StringBuilder();
		Random r;
		try {
			r = SecureRandom.getInstanceStrong();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			r = new Random();
		}
		for(int i=1;i<=CODE_LENGTH;i++) {
			int rNum = r.nextInt(BASIC_CODE.length());
			sb.append(BASIC_CODE.charAt(rNum));
		}
		return sb.toString();			
	}
	
	public static String getPaymentCode() {
		StringBuilder sb = new StringBuilder();
		Random r;
		try {
			r = SecureRandom.getInstanceStrong();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			r = new Random();
		}
		for(int i=1;i<=PAYMENT_CODE_LENGTH;i++) {
			int rNum = r.nextInt(8)+1;
			sb.append(BASIC_CODE.charAt(rNum));
		}
		return sb.toString();	
	}
	
}
