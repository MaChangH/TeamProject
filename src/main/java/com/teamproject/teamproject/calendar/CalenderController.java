package com.teamproject.teamproject.calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.teamproject.TokenMaker;
import com.teamproject.teamproject.member.MemberDAO;

@Controller
public class CalenderController {
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/calendar.go", method = RequestMethod.GET)
	public String calendar(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("cp", "calendar/calendar.jsp");
		return "index";
	}
	
}
