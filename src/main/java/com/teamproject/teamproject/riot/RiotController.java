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
	private MemberDAO mDAO;
	@Autowired
	private BoardDAO bDAO;
	@Autowired
	private RiotDAO rDAO;
	
	
	@RequestMapping(value = "/riot.go", method = RequestMethod.GET)
	public String goRiot(HttpServletRequest req) {
		mDAO.loginCheck(req);
		bDAO.bannerEvent(req);
		req.setAttribute("cp", "riot_board/riot.jsp");
		return "index";
	}
	@RequestMapping(value = "/riot.summoners", method = RequestMethod.GET)
	public String getSummoner(HttpServletRequest req) {
		mDAO.loginCheck(req);
		bDAO.bannerEvent(req);
		rDAO.getSN(req); // 이놈이 지금까지 null 이라서 500 에러가 나옴.  아 아니 그러면 rDAO 가 안나와야지 왜 나오고 지랄임.사람헷갈리게
		req.setAttribute("cp", "riot_board/riotSummoner.jsp");
		return "index";
	}
	
	
}
