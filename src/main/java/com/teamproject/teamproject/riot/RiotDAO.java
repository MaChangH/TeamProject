package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class RiotDAO {
	
	String api_key = "RGAPI-31410784-d0dd-47aa-94f6-b9a86b882bf4";
	
	public String get_SummonerName(HttpServletRequest req) {
		String name = req.getParameter("SN");
		req.setAttribute("SN_input", name);
		String nameforURL = req.getParameter("SN");
		nameforURL = nameforURL.replace(" ", "%20");
//		System.out.println(nameforURL);
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
		// js 에서 값 가지고오기 => 바로는 안되고 form 써라고 하는데 
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + urlname +"?api_key=" + api_key;
		System.out.println("matchSearchWithNickName 안에있는 url입니다." + url) ;
		
		// api 키 를 여기에 String api-key = '' 넣어주고 
		// 게임아이디 쪽에 띄어쓰기가 어떻게 되는지 ... 아마 닉네임이랑 게임 아이디랑은 별개로 존재할거 같아서 닉네임을 통해서 
		// 게임아이디를 가지고 오고 그걸를 위에 url 에 넣어야 할 것으로 보임.
		
	}
	
	// 챔피언 id -> 숫자 => 트타 , 사일 이런게 숫자로 keyvalue 느낌으로 되어있는듯? -> getChampionID
	public void getChampionID(HttpServletRequest req) {
		// 여기는 champion 숫자로 되어있는거 알아내는곳. 챔피언 기본설명
		String url = "https://ddragon.leagueoflegends.com/cdn/13.15.1/data/ko_KR/champion.json";
		// json 파일을 db에 저장을 해놔야되나.?
	}

	// java 에서 json 파싱하기
	
}	
