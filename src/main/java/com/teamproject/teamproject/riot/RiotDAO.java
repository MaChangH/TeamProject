package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class RiotDAO {
	
	String api_key = "RGAPI-e854d293-6175-4008-8a8c-840757bb5fcb";
	String username1 = "";
	
	public String get_SummonerName(HttpServletRequest req) {
		String name = req.getParameter("SN");
		req.setAttribute("SN_input", name);
		String nameforURL = req.getParameter("SN");
		nameforURL = nameforURL.replace(" ", "%20");
//		System.out.println(nameforURL);
		return nameforURL;
		/* 
		 * 1. 여기안에서 띄어쓰기는 %20 으로 바꾸고 URL 에 넣기 완
		 * 2.  내가 원하는 데이터가 어떤 파라미터가 필요한지 정리해놓기.
		 * 3. SUMMONER로 검색하는 데이터가 어떤건지 찾고
		 */
	}
	
	// username 을 jsp 에서 가지고오면 되지 검색버튼 누르면
//	public void getUserName(HttpServletRequest req) {
//		// jsp에 있는 input name summonerName 을 일로 가지고 오고 
//		String username = req.getParameter("summonerName");
//		// 그러면 자동완성 써서 getParameter 말고 getAttribute 써서 이게 null 이 계속 나왔던거임???? 
//		System.out.println(username);
//	}
	// 띄어쓰기로 검색했을 때 url : hide%20on%20bush
	// 플레이어 이름으로 전적검색 ( 매치 기록 / 매치 정보 )  
	// 검색창에 띄어쓰기가 있으면 %20 로 변경-> url 에 들어갈거고 거기서 id 를 파싱해 오면 될듯.
	
	// ///////////////////////////////////////////////////////////
	// jsp 에 있는 input 어떻게 여기로 가지고올건지
	// ///////////////////////////////////////////////////////////
	// SUMMONER V4 (닉네임)-> id ~ name, puuid
	// league v4 (sumonerID) -> 최근전적
	// MATCH-V5  : 매치 id가지고오기 (puuid 사용)
	
	public void get_Id_AccoutId_Puuid(String SNforURL, HttpServletRequest req) {
		
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + SNforURL + "?api_key="+ api_key;
		req.setAttribute("SNinfoURL", url);
		System.out.println("SNifo 값 :" + url);
		// status 객체안에 message 가 "Forbidden" , "status_code" 가 403 => 
		
		
//		try {
//			if ( url == url) {
//				// 파싱해서 나온게 값이 
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(url);
	}
	
	public void matchSearchWithNickName(HttpServletRequest req) {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/{게임아이디}?api_key={발급받은키}";
		// api 키 를 여기에 String api-key = '' 넣어주고 
		// 게임아이디 쪽에 띄어쓰기가 어떻게 되는지 ... 아마 닉네임이랑 게임 아이디랑은 별개로 존재할거 같아서 닉네임을 통해서 
		// 게임아이디를 가지고 오고 그걸를 위에 url 에 넣어야 할 것으로 보임.
		
	}
	
	// 챔피언 id -> 숫자 => 트타 , 사일 이런게 숫자로 keyvalue 느낌으로 되어있는듯? -> getChampionID
	public void getChampionID(HttpServletRequest req) {
		// 여기는 champion 숫자로 되어있는거 알아내는곳. 챔피언 기본설명
		String url = "https://ddragon.leagueoflegends.com/cdn/13.15.1/data/ko_KR/champion.json";
		
	}
}
