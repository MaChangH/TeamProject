package com.teamproject.teamproject.banner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.teamproject.board.BoardDAO;

@Controller
public class BannerController {
	
	@Autowired
	private BoardDAO bDAO;

	
}
