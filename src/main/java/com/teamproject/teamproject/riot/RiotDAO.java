package com.teamproject.teamproject.riot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class RiotDAO {
	// op.gg 는 api키를 하나가지고 돌려쓸 수 없을건데 어떻게 하는거지 ?
	String api_key = "RGAPI-ff1bd468-e545-46a3-95eb-3834d987e15f";
	String username1 = "";
	// username 을 jsp 에서 가지고오면 되지 검색버튼 누르면
	public void getUserName(HttpServletRequest req) {
		
		
	}
	// 띄어쓰기로 검색했을 때 url : hide%20on%20bush
	// 플레이어 이름으로 전적검색 ( 매치 기록 / 매치 정보 )  
	// 검색창에 띄어쓰기가 있으면 %20 로 변경-> url 에 들어갈거고 거기서 id 를 파싱해 오면 될듯.
	
	// ///////////////////////////////////////////////////////////
	// jsp 에 있는 input 어떻게 여기로 가지고올건지
	// ///////////////////////////////////////////////////////////
	// SUMMONER V4 (닉네임)-> id ~ name, puuid
	// league v4 (sumonerID) -> 최근전적
	// MATCH-V5  : 매치 id가지고오기 (puuid 사용)
	
	public void searchGameID() {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + username1 + "?api_key="+ api_key;
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
