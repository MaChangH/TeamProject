package com.team.project.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.banner.BannerDAO;
import com.team.project.member.MemberDAO;

@Controller
public class GameController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BannerDAO baDAO;
	
	@Autowired
	private GameDAO gDAO;
	
	// 게임 게시판으로 이동
	@RequestMapping(value = "/game.go", method = RequestMethod.GET)
	public String game(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.getWeather(req);
		baDAO.bannerEvent(req);
		req.setAttribute("cp", "game/game.jsp");
		return "index";
	}
	
	// 블랙잭 플레이하기
	@RequestMapping(value = "/blackJack.go", method = RequestMethod.POST)
	public String blackJack(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.getWeather(req);
		baDAO.bannerEvent(req);
		gDAO.betPoint(req);
		gDAO.blackJack(req);
		req.setAttribute("cp", "game/blackJack.jsp");
		return "index";
	}
	
	// 데스페라도 플레이하기
	@RequestMapping(value = "/desperado.go", method = RequestMethod.POST)
	public String desperado(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.getWeather(req);
		baDAO.bannerEvent(req);
		gDAO.getPoint(req);
		req.setAttribute("cp", "game/desperado.jsp");
		return "index";
	}
	
}
