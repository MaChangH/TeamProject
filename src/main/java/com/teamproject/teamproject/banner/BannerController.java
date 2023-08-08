package com.teamproject.teamproject.banner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.teamproject.board.BoardDAO;

@Controller
public class BannerController {
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private BannerDAO baDAO;
	
	@RequestMapping(value = "/banner.weather.get", method = RequestMethod.GET, produces="application/XML; charset=UTF-8")
	public @ResponseBody String getKoreaWeather(HttpServletRequest req) {
		return baDAO.getWeather(req);
	}

	
}
