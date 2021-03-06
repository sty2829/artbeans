package com.artbeans.web.api.iamport;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;

@ConstructorBinding
@ConfigurationProperties("iamport.api")
@Data
public class Iamport {

	
	private final String AUTH_URL;
	private final String PAYMENT_URL;
	private final String KEY;
	private final String SECRET;
	
	public Iamport(String aUTH_URL, String pAYMENT_URL, String kEY, String sECRET) {
		AUTH_URL = aUTH_URL;
		PAYMENT_URL = pAYMENT_URL;
		KEY = kEY;
		SECRET = sECRET;
	}

	@Autowired
	private ObjectMapper om = new ObjectMapper();
	
	public <T> IamportResult<T> getResult(String json, Class<T> contentClass) {
		try {
			JavaType type = om.getTypeFactory().constructParametricType(IamportResult.class, contentClass);
			return om.readValue(json, type);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public HttpURLConnection getHttpURLConnection(String urls) {
		HttpURLConnection conn = null;
		try {
			URL url = new URL(urls);
			conn = (HttpURLConnection) url.openConnection();
			return conn;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getToken() {
		HttpURLConnection conn = null;
		
	    try {
	        conn = getHttpURLConnection(AUTH_URL);
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setDoOutput(true);
	        DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
	        
			String param = "imp_key=" + KEY + "&imp_secret=" + SECRET;
			dos.write(param.getBytes("UTF-8"));
			dos.flush();
			dos.close();
	        
	        conn.connect();
	        
	        StringBuffer sb = new StringBuffer();
	        InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(in);
			
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}			
			
			IamportResult<AccessToken> result = getResult(sb.toString(), AccessToken.class);
			
			return result.getResponse().getToken();
	       
	    } catch (IOException e) {
			e.printStackTrace();

		}
	    
	    return null;

	}
	
	public IamportResult<Payment> getPaymentByImpId(String impId) {
		HttpURLConnection conn = null;
		
	    try {
	        conn = getHttpURLConnection("https://api.iamport.kr/payments/" + impId);
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", getToken());
	        
	        conn.connect();
	        
	        StringBuffer sb = new StringBuffer();
	        InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(in);
			
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}			
			
			return getResult(sb.toString(), Payment.class);
	       
	    } catch (IOException e) {
			e.printStackTrace();

		}

		return null;
	}
	
	
	public IamportResult<Cancel> canclePaymentByImpId(String impId) {
		HttpURLConnection conn = null;
		
	    try {
	        conn = getHttpURLConnection("https://api.iamport.kr/payments/cancel");
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", getToken());
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setDoOutput(true);
	        DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
	        
			String param = "imp_uid=" + impId;
			dos.write(param.getBytes("UTF-8"));
			dos.flush();
			dos.close();
	        
	        conn.connect();
	        
	        StringBuffer sb = new StringBuffer();
	        InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(in);
			
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}			
			return getResult(sb.toString(), Cancel.class);
	       
	    } catch (IOException e) {
			e.printStackTrace();

		}

		return null;
	}
	
	public IamportResult<Cancel> canclePaymentByMerchantId(String merchantId) {
		HttpURLConnection conn = null;
		
	    try {
	        conn = getHttpURLConnection("https://api.iamport.kr/payments/cancel");
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", getToken());
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setDoOutput(true);
	        DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
	        
			String param = "merchant_uid=" + merchantId;
			dos.write(param.getBytes("UTF-8"));
			dos.flush();
			dos.close();
	        
	        conn.connect();
	        
	        StringBuffer sb = new StringBuffer();
	        InputStreamReader in = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(in);
			
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}			
			
			return getResult(sb.toString(), Cancel.class);
	       
	    } catch (IOException e) {
			e.printStackTrace();

		}

		return null;
	}
	
}
