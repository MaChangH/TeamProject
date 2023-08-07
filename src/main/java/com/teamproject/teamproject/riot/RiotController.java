package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.teamproject.board.BoardDAO;
import com.teamproject.teamproject.member.MemberDAO;

@Controller
public class RiotController {
	@Autowired
	MemberDAO mDAO;
	BoardDAO bDAO;
	RiotDAO rDAO;
	@RequestMapping(value = "/riot.go", method = RequestMethod.GET)
	public String RiotGo(HttpServletRequest req) {
		mDAO.loginCheck(req);
		req.setAttribute("cp", "riot_board/riot.jsp");
		return "index";
	}
	@RequestMapping(value = "/riot.summoners", method = RequestMethod.GET)
	public String RiotSummonersSearch(HttpServletRequest req) {
		mDAO.loginCheck(req);
		// rDAO 에서 닉네임 입력하면 띄어쓰기 %20으로 바뀐 상태로 나와야함.
		// 각자의 아이디마다 페이지가 하나 있는거
		
		
		
		req.setAttribute("cp", "riot_board/riotSummoner.jsp");
		return "index";
	}
}
