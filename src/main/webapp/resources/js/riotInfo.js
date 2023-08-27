const api_key = "RGAPI-4790a197-9d5a-4584-bf8a-0a584295eb3d";
const head = "https://kr.api.riotgames.com";
// 설정할 헤더 객체
const headers = new Headers();
headers.append("Origin", "http://localhost"); // 요청이 시작된 origin 설정 (CORS 정책을 만족시키기 위해 필요)
headers.append("Accept", "application/json"); // 원하는 응답 데이터 타입

// fetch 요청 설정
const requestOptions = {
  method: "GET",
  headers: headers,
  mode: "cors", // CORS 요청 모드
};
// 함수에서 promise return (resolve)
/** 버튼 누르면  input value 를 가져온다.
 *  이벤트 핸들러 -> Promise (o) / async (x)
 */
function getSN() {
  return new Promise((resolve, reject) => {
    $("#b1").click(function (e) {
      let sn = $("#SN").val();
      resolve(sn);
    });
  });
}
/** 가져온 SN 을 가지고 주소 만들기  */
function getURL(name) {
  let n_url = name.replace(/ /g, "%20");
  // console.log(n_url);
  let url =
    head +
    "/lol/summoner/v4/summoners/by-name/" +
    n_url +
    "?api_key=" +
    api_key;
  return url;
}

/** 가져온 url 로 fetch  */
async function getJson(url) {
  try {
    let response = await fetch(url, requestOptions);
    if (response.status != 200) {
      alert("서버문제입니다.");
    }
    let data = await response.json();
    // console.log(response);
    // console.log(data);
    let arr = [
      data.accountId, // 0 ~ 4 : accountId, id, name, puuid, summonerLevel
      data.id,
      data.name,
      data.puuid,
      data.summonerLevel,
    ];
    console.log(arr);
    return arr;
  } catch (error) {
    console.log(error);
    if (
      error instanceof TypeError &&
      error.message.includes("Failed to fetch")
    ) {
      alert("없는 소환사 이름이거나 API-KEY가 만료되었습니다.");
    }
  }
}
/** encryptedSummonerId 로 소환사 ID에 대한 리그 정보들을 가져온다.*/
async function leagueInfo(encID) {
  let url =
    "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" +
    encID +
    "?api_key=" +
    api_key;
  console.log(url);
  try {
    let response = await fetch(url, requestOptions);
    let data = await response.json();
    if (response.status != 200) {
      alert("서버문제입니다.");
    }

    console.log(data);
    // 0 아니면 1인데
    for (i = 0; i < 2; i++) {
      console.log(i);
      if (data[i].queueType == "RANKED_SOLO_5x5") {
        let lP = data[i].leaguePoints;
        let rank = data[i].rank;
        let wins = data[i].wins;
        let losses = data[i].losses;
        let tier = data[i].tier;
        console.log(tier, rank, lP, wins, losses);
        arr = [tier, rank, lP, wins, losses];
        return arr;
      }
    }
  } catch (error) {
    console.log(error);
  }
}

/** LeagueInfo 에서 받아온거 jsp 출력 */
function onJsp(leagueInfo) {
  // var infolist = document.querySelector("#infolist");
  $("#infolist").empty();
  // console.log(leagueInfo);
  var tag = "";
  let match = leagueInfo[3] + leagueInfo[4];
  tag +=
    "<div>" + "솔로랭크 : " + leagueInfo[0] + "\t " + leagueInfo[1] + " </div>";
  tag += "<div>" + "League Point : " + leagueInfo[2] + "</div>";
  tag += "<div>" + "승 : " + leagueInfo[3] + " </div>";
  tag += "<div>" + "패 : " + leagueInfo[4] + " </div>";
  tag +=
    "<div>" +
    "승률 : " +
    Math.ceil((leagueInfo[3] / match) * 100) +
    "%" +
    " </div>";

  // infolist.innerHTML = tag;
  $("#infolist").append(tag);
  // console.log(tag);
}

/** match id 가지고오기 */
async function getMatch(encpuuid) {
  // console.log(encAccId);
  let url =
    "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" +
    encpuuid +
    "/ids?type=ranked&start=0&" +
    "count=" +
    19 + // 가져올 매치 수 0부터 시작 총 20개 20 이상은 한번에 안되는듯? 그 뒤로 는 나눠서 요청필요
    "&api_key=" +
    api_key;
  console.log("여기요" + url);
  try {
    let response = fetch(url, requestOptions);
    let data = (await response).json();
    console.log(data);
    return data;
  } catch (error) {
    console.log(error);
  }
}
/**match id 하나씩 넣어서 matchInfo 가지고오기 */
async function matchInfo(matchId, encpuuid) {
  // 이번에는 for 문안에서 url 을 만들어야함.
  let count = 0;
  for (let i = 0; i < matchId.length; i++) {
    const m_id = matchId[i];
    console.log("================================");
    console.log(m_id);
    let url =
      "https://asia.api.riotgames.com/lol/match/v5/matches/" +
      m_id +
      "?api_key=" +
      api_key;
    console.log(url);
    // url 안에서 fetch 해와야지. 여기서는 각각 개별적으로 진행하는것도 있어야할듯.
    // 일단 하나 동작하는거 만들어놓고 생각하자.
    let response = await fetch(url, requestOptions);
    let data = await response.json();
    count++;
    console.log(count + "번째 ");
    //게임진행시간  게임 진행시간 ms 로 가지고온다.
    let gameDuration = humanReadable(data.info.gameDuration);
    console.log("게임진행시간 :" + gameDuration);

    // 유닉스 시간
    // 여기는 2022-12-22 이런값이 들어가야하는데 ㅣ...
    let WhenGameEnds_Unix = UnixTimeTransfer(data.info.gameEndTimestamp);
    // 게임 끝난지 얼마나 지났는지 (1분전 10분전 하루 전등)
    let WhenGameEnds = timeForToday(WhenGameEnds_Unix);
    console.log("게임 끝난지 " + WhenGameEnds);
    let ArrIndex = data.metadata.participants;
    let indexForSearcherPuuid = ArrIndex.indexOf(encpuuid); // info-participants-summonerName , 숫자
    // 검색한 사람 닉네임.
    let summonerName =
      data.info.participants[indexForSearcherPuuid].summonerName;
    console.log(summonerName);
    //  챔피언이름
    let ChampionName =
      data.info.participants[indexForSearcherPuuid].championName;
    console.log(ChampionName);
    // 게임 끝났을 때 챔피언 레벨
    let C_level_endgame = await data.info.participants[indexForSearcherPuuid]
      .champLevel;
    console.log(C_level_endgame + "레벨");
    // 아이템
    let item1 = await data.info.participants[indexForSearcherPuuid].item1;
    let item2 = await data.info.participants[indexForSearcherPuuid].item2;
    let item3 = await data.info.participants[indexForSearcherPuuid].item3;
    let item4 = await data.info.participants[indexForSearcherPuuid].item4;
    let item5 = await data.info.participants[indexForSearcherPuuid].item5;
    let item6 = await data.info.participants[indexForSearcherPuuid].item6;
    console.log(item1, item2, item3, item4, item5, item6);

    // 승리 패배 출력
    let n = await data.info.participants[indexForSearcherPuuid].win;
    if (n == true) {
      console.log("승리");
    } else {
      // 10분? 이전 패배면 -> 다시하기
      console.log("패배");
      if (data.info.gameDuration < 600) {
        console.log("다시하기");
      }
    }
    // KDA 출력
    let challenges = data.info.participants[indexForSearcherPuuid].challenges;

    if (challenges) {
      // challenges 객체가 존재하는 경우
      // console.log(challenges);
      console.log("kda : " + challenges.kda);
    } else {
      // challenges 객체가 없는 경우
      console.log("challenges 오브젝트 없음");
      let k = data.info.participants[indexForSearcherPuuid].kills;
      let d = data.info.participants[indexForSearcherPuuid].deaths;
      let a = data.info.participants[indexForSearcherPuuid].assists;
      if (d == 0) {
        console.log("Perfect : No Death");
      } else {
        let kda = k + a / d;
        console.log("KDA :" + kda);
      }
    }

    // console.log(indexForSearcherPuuid);
    // console.log(ArrIndex);
    // console.log(WhatNumberInfo);
    // puuid 도 파라미터로 받아와야되겠네...
  }
}
/** 유닉스 시간 변환 */
function UnixTimeTransfer(unixTimestamp) {
  // 현재 Unix 타임스탬프 (밀리초) 가져오기

  // Unix 타임스탬프를 Date 객체로 변환하기
  const date = new Date(unixTimestamp);

  // 원하는 날짜 및 시간 형식으로 변환하기
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();
  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();

  let result = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  // console.log(`${year}-${month}-${day} ${hours}:${minutes}:${seconds}`);
  return result;
}

/** gameDuration 받아오는 1000초대 -> 분 변환   */
function humanReadable(seconds) {
  if (seconds < 61) {
    return "00:" + addZero(seconds);
  }
  // sec
  var hours = Math.floor(seconds / 3600);
  var mins = Math.floor((seconds - hours * 3600) / 60);
  var secs = seconds - hours * 3600 - mins * 60;
  if (hours == 0) {
    return addZero(mins) + "분" + addZero(secs);
  }
  return addZero(hours) + "시" + addZero(mins) + "분" + addZero(secs) + "초";

  function addZero(num) {
    return (num < 10 ? "0" : "") + num;
  }
}

/** 지금으로 부터 몇분전 만들기 시작시간 / 게임 끝나는 시간. */
function timeForToday(value) {
  const today = new Date();
  const timeValue = new Date(value);

  const betweenTime = Math.floor(
    (today.getTime() - timeValue.getTime()) / 1000 / 60
  );
  if (betweenTime < 1) return "방금전";
  if (betweenTime < 60) {
    return `${betweenTime}분전`;
  }

  const betweenTimeHour = Math.floor(betweenTime / 60);
  if (betweenTimeHour < 24) {
    return `${betweenTimeHour}시간전`;
  }

  const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
  if (betweenTimeDay < 365) {
    return `${betweenTimeDay}일전`;
  }

  return `${Math.floor(betweenTimeDay / 365)}년전`;
}

/**버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드  + 코드추가 */
function getOnClick() {
  $(document).ready(async function () {
    let name = await getSN();
    let url = getURL(name);
    let InfoResult = await getJson(url);
    let encAccId = InfoResult[0]; // encryptedAccountId
    let encId = InfoResult[1]; //encryptedSummonerId
    let encpuuid = InfoResult[3]; //encryptedSummonerId
    let LInfo = await leagueInfo(encId);
    let matchId = await getMatch(encpuuid); //matchID 정보 array
    onJsp(LInfo); // 단순실행 -> 화면에 띄우기
    matchInfo(matchId);
  });
}
// 매치는 puuid
// 전적은 summonerid

//  첫 실행  ++ 코드추가 (두번째 실행이랑 코드 맞추기 )
$(document).ready(async function () {
  let name = await getSN();
  let url = getURL(name);
  let InfoResult = await getJson(url);
  // let encAccId = InfoResult[0]; // encryptedAccountId
  let encId = InfoResult[1]; //encryptedSummonerId
  let encpuuid = InfoResult[3]; //encryptedSummonerId
  let LInfo = await leagueInfo(encId);
  let matchId = await getMatch(encpuuid); //matchID 정보 array
  onJsp(LInfo); // 단순실행 -> 화면에 띄우기
  matchInfo(matchId, encpuuid);
});

/**  버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드 + 내용 추가X*/
$(document).ready(function () {
  $("#b1").click(function (e) {
    getOnClick();
  });
});

/*

*/
