package com.team.project.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.TokenMaker;
import com.team.project.banner.BannerDAO;
import com.team.project.member.MemberDAO;

@Controller
public class RiotController {
	
	
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private BannerDAO baDAO;
	@Autowired
	private RiotDAO rDAO;
	// 안씀.
	@RequestMapping(value = "/riot.go", method = RequestMethod.GET)
	public String goRiot(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.getSession().setAttribute("currentPage", "riot");
		req.setAttribute("cp", "riot_board/riotSummonerInfo.jsp");
		return "index";
	}
	
	/*@RequestMapping(value = "/riot.summoners", method = RequestMethod.GET)
	public String getSummoner(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.setAttribute("cp", "riot_board/riotSummonerInfo.jsp");
		return "index";
	}*/
	
	
}
