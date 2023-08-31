package com.team.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.banner.BannerDAO;
import com.team.project.member.MemberDAO;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BannerDAO baDAO;
	
	// 처음 접속 시 요청 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.getSession().setAttribute("currentPage", "home");
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
	// HOME버튼 클릭시 요청 페이지
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String goHome(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.getSession().setAttribute("currentPage", "home");
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
	// MEMBER버튼 클릭시 요청 페이지
		@RequestMapping(value = "/member.go", method = RequestMethod.GET)
		public String goMember(HttpServletRequest req) {
			mDAO.loginCheck(req);
			baDAO.bannerEvent(req);
			baDAO.getWeather(req);
			req.getSession().setAttribute("currentPage", "member");
			req.setAttribute("cp", "teamMember.jsp");
			return "index";
		}
		
	// 사이트 테마 변경시 요청 페이지
		@RequestMapping(value = "/themeChange.go", method = RequestMethod.POST)
		public String goThemeChange(HttpServletRequest req) {
			mDAO.loginCheck(req);
			baDAO.bannerEvent(req);
			baDAO.getWeather(req);
			themeChange.theme(req);
			req.setAttribute("cp", "member/setting.jsp");
			return "index";
		}
}
