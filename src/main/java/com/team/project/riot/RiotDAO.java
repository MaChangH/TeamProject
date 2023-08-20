package com.team.project.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class RiotDAO {
	
	String api_key = "RGAPI-d7d1c4c5-badf-4e45-9b17-c938fdab2102";
	
	
	// input으로 받은 아이디에 띄어쓰기 자리에 %20 추가 후 URL 용 아이디 return
	public String get_UrlName(HttpServletRequest req) {
		String name = req.getParameter("SN");
		req.setAttribute("SN_input", name);
		String nameforURL = req.getParameter("SN");
		nameforURL = nameforURL.replace(" ", "%20");
		return nameforURL;
	}
	
	// ///////////////////////////////////////////////////////////
	// jsp 에 있는 input 어떻게 여기로 가지고올건지
	// ///////////////////////////////////////////////////////////
	// SUMMONER V4 (닉네임)-> id ~ name, puuid
	// league v4 (sumonerID) -> 최근전적
	// MATCH-V5  : 매치 id가지고오기 (puuid 사용)
	
	public void get_Id_AccoutId_Puuid(String SNforURL, HttpServletRequest req) {
		
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + SNforURL + "?api_key="+ api_key;
		req.setAttribute("SNinfoURL", url);
	}
	
	public void matchSearchWithNickName(HttpServletRequest req) {
		String urlname = req.getParameter("SN");
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + urlname +"?api_key=" + api_key;
		System.out.println("matchSearchWithNickName 안에있는 url입니다." + url) ;
	}
	
	// 챔피언 id -> 숫자 => 트타 , 사일 이런게 숫자로 keyvalue 느낌으로 되어있는듯? -> getChampionID
	public void getChampionID(HttpServletRequest req) {
		// 여기는 champion 숫자로 되어있는거 알아내는곳. 챔피언 기본설명
		String url = "https://ddragon.leagueoflegends.com/cdn/13.15.1/data/ko_KR/champion.json";
		// json 파일을 db에 저장을 해놔야되나.?
	}

	// java 에서 json 파싱하기
	
}	
