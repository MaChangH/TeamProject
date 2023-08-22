package com.team.project.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.banner.BannerDAO;
import com.team.project.board.BoardDAO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private BannerDAO baDAO; 
	
	@RequestMapping(value = "/member.id.check", method = RequestMethod.GET, produces="application/JSON; charset=UTF-8")
	public @ResponseBody Members memberIdCheck(Member m) {
		return mDAO.idCheck(m);
	}
	
	@RequestMapping(value = "/member.nickname.check", method = RequestMethod.GET, produces="application/JSON; charset=UTF-8")
	public @ResponseBody Members memberNicknameCheck(Member m) {
		return mDAO.nicknameCheck(m);
	}

	@RequestMapping(value = "/member.join.go", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			req.setAttribute("cp", "member/join.jsp");
		} else {
			req.setAttribute("cp", "home.jsp");
		}
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		return "index";
	}
	
	@RequestMapping(value = "/member.join", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req) {
		mDAO.join(m, req);
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.setAttribute("cp", "member/loginGo.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/member.login.go", method = RequestMethod.GET)
	public String memberLoginGo(Member m, HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		if (mDAO.loginCheck(req)) {
			req.setAttribute("cp", "home.jsp");
		} else {
			req.setAttribute("cp", "member/loginGo.jsp");
		}
		req.getSession().setAttribute("currentPage", "login");
		return "index";
	}
	
	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String memberLogin(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		return "index";
	}
	
	@RequestMapping(value = "/member.logout", method = RequestMethod.GET)
	public String memberLogout(Member m, HttpServletRequest req) {
		mDAO.logout(req);
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/member.setting", method = RequestMethod.GET)
	public String memberSetting(Member m, HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.setAttribute("cp", "member/setting.jsp");
		req.getSession().setAttribute("currentPage", "setting");
		return "index";
	}
	
	@RequestMapping(value = "/member.infoCheck.go", method = RequestMethod.GET)
	public String memberInfoCheckGo(HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			req.setAttribute("cp", "member/infoCheck.jsp");
		} else {
			req.setAttribute("cp", "home.jsp");
		}
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.getSession().setAttribute("currentPage", "info");
		return "index";
	}
	
	@RequestMapping(value = "/member.info.go", method = RequestMethod.POST)
	public String memberInfoGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		if (mDAO.infoCheck(req)) {
			mDAO.infoAddr(req);
			req.setAttribute("cp", "member/info.jsp");
		} else {
			req.setAttribute("cp", "home.jsp");
		}
		req.getSession().setAttribute("currentPage", "info");
		return "index";
	}

	@RequestMapping(value = "/member.bye", method = RequestMethod.GET)
	public String memberBye(HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.bye(req);
			mDAO.loginCheck(req);
		}
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/member.update.go", method = RequestMethod.POST)
	public String memberUpdateGo(Member m, HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.infoAddr(req);
			req.setAttribute("cp", "member/infoUpdate.jsp");
		} else {
			req.setAttribute("cp", "home.jsp");
		}
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		req.getSession().setAttribute("currentPage", "info");
		return "index";
	}
	
	@RequestMapping(value = "/member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {
		if (mDAO.loginCheck(req)) {
			mDAO.update(m, req);
			req.setAttribute("cp", "home.jsp");
		} else {
			req.setAttribute("cp", "home.jsp");
		}
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		return "index";
	}
	
}
