package com.artbeans.web.api.imaport;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class Iamport {

	@Autowired
	private ObjectMapper om;
	
	@Autowired
	private IamportProperties ip;

	public IamportResult getResult() {
		String json = getAuth();
		IamportResult result = null;
		try {
			result = om.readValue(json, IamportResult.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public HttpsURLConnection getHttpsURLConnection(String urls) {
		HttpsURLConnection conn = null;
		try {
			URL url = new URL(urls);
			conn = (HttpsURLConnection) url.openConnection();
			return conn;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String getAuth() {
		HttpURLConnection conn = null;
		
	    try {
	        conn = getHttpsURLConnection("https://api.iamport.kr/users/getToken");
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("imp_key", "2807716025317744");
	        conn.setRequestProperty("imp_secret", "de7bd1901dca0eb283d3e359f482906a5c33a843f904c05bedf3e4aa16bb147d8c6051c224b98203");
	       // SSLContext context = SSLContext.getInstance("TLS"); 
	       // context.init(null, null, null); 
	       // conn.setSSLSocketFactory(context.getSocketFactory());
	        //conn.setS


	        
	        conn.connect();
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println(responseCode);
	        StringBuffer sb = new StringBuffer();
	        InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(in);
			
			String line = null;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
				sb.append(line);
			}				
			return sb.toString();
	       
	    } catch (IOException e) {
			e.printStackTrace();

		}

		return "";
	}
	
	public static void main(String[] args) {
		Iamport i = new Iamport();
		i.getAuth();
		
	}
}
