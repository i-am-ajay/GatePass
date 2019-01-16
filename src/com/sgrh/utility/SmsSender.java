package com.sgrh.utility;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

// This class creates and HTTP connection and sends a request to SMS provider to send Pass_No to given number
public class SmsSender {
	public static void sendMsg(String msg, String number) {
		HttpURLConnection con = null;
		String url = "http://bulksms.mysmsmantra.com/WebSMS/SMSAPI.jsp?username=sgrhsms&password=1632277827&sendername=SGRHIT&mobileno=";
		
		try {
			url = url+number+"&message="+URLEncoder.encode(msg,"UTF-8");
			System.out.println(url);
			URL obj = new URL(url);
			
			con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("USER_AGENT","Mozilla/5.0");
			int responseCode = con.getResponseCode();
			System.out.println("Message Sent"+responseCode);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
