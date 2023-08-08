package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class RiotDAO {
	public void getSN(HttpServletRequest req) {
		String name = req.getParameter("SN");
		System.out.println(name);
		req.setAttribute("SN_input", name);
	}
}
