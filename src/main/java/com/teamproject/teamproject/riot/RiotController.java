package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.teamproject.TokenMaker;
import com.teamproject.teamproject.banner.BannerDAO;
import com.teamproject.teamproject.member.MemberDAO;

@Controller
public class RiotController {
	
	
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private BannerDAO baDAO;
	@Autowired
	private RiotDAO rDAO;
	
	@RequestMapping(value = "/riot.go", method = RequestMethod.GET)
	public String goRiot(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		req.setAttribute("cp", "riot_board/riot.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/riot.summoners", method = RequestMethod.GET)
	public String getSummoner(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		String summonerName = rDAO.get_UrlName(req); // js 안에서 %20 처리
		rDAO.get_Id_AccoutId_Puuid(summonerName, req); // 처리된 이름 기반 url 넣기
		req.setAttribute("cp", "riot_board/riotSummonerInfo.jsp");
		rDAO.matchSearchWithNickName(req);	// 필요없음.
		return "index";
	}
	
	
}
