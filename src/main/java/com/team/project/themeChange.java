package com.team.project;

import javax.servlet.http.HttpServletRequest;

public class themeChange {

	public static void theme(HttpServletRequest req) {
		String color = req.getParameter("color");
		req.getSession().setAttribute("themeColor", color);
		req.setAttribute("r", "테마가 " + color + "로 변경되었습니다");
	}
	
}
