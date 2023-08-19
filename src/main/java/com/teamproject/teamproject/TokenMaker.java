package com.teamproject.teamproject;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenMaker {
	public static void makeToken(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hhmmss");
		String token = sdf.format(d);
		req.setAttribute("token", token);
	}
}








