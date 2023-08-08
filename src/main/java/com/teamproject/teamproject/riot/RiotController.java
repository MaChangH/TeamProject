package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.teamproject.board.BoardDAO;
import com.teamproject.teamproject.member.MemberDAO;
import com.teamproject.teamproject.riot.RiotDAO;

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
		try {
			if (rDAO.sNTrueFalse(req)) {
				rDAO.getSummonerName(req);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 검색을 해와 -> 값이 있으면 참이고 아니면 거짓일건데 값이 있는지 없는지 를 확인하는 메소드를 하나 만들어야한.ㅏ/?
		
		// rDAO 에서 닉네임 입력하면 띄어쓰기 %20으로 바뀐 상태로 나와야함.
		// 각자의 아이디마다 페이지가 하나 있는거
		
		req.setAttribute("cp", "riot_board/riotSummoner.jsp");
		return "index";
	}
}
