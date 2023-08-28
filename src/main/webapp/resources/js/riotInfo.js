const api_key = "RGAPI-f74463b7-f619-450b-b23b-abd61742ddeb";
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
    let response = await fetch(url);
    let data = await response.json();
    /** 롤 계정 자체는 존재하지만, 랭크 게임을 하지 않은 경우 */
    if (data == "") {
      $("#riotSommonerTbl3").css("opacity", "0%");
      let lP = "정보를 불러올 수 없습니다";
      let rank = "";
      let wins = "";
      let losses = "";
      let tier = "통계가 부족합니다";
      let winrate = "";
      console.log(tier, rank, lP, wins, losses, winrate);
      arr = [tier, rank, lP, wins, losses, winrate];
      return arr;
    } else {
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
          let match = wins + losses;
          let winrate = Math.ceil((wins / match) * 100);
          console.log(tier, rank, lP, wins, losses, winrate);
          arr = [
            tier,
            rank,
            lP + " LP",
            wins + " 승",
            losses + " 패",
            "승률 " + winrate + " %",
          ];
          return arr;
        }
      }
    }
  } catch (error) {
    console.log(error);
  }
}

/** LeagueInfo 에서 받아온거 jsp 출력 */
function onJsp(leagueInfo) {
  // var infolist = document.querySelector("#infolist");
  $(".riotSommonerTbl").css("opacity", "100%");

  $("#infolist").empty();
  $(".riotTd").empty();

  let tier = leagueInfo[0];
  let tierNum = leagueInfo[1];
  let img = tier;

  /** 챌린저, 그랜드마스터, 마스터는 티어의 구분만 있고 랭크 구분이 없음 */
  if (tier == "CHALLENGER" || tier == "GRANDMASTER" || tier == "MASTER") {
    tierNum = "";
  } else if (tier == "통계가 부족합니다") {
    img = "empty";
  }

  var tag1 = $("#SN").val();
  var tag2 = tier + "\t " + tierNum;
  var tag3 = leagueInfo[2];
  var tag4 = leagueInfo[3];
  var tag5 = leagueInfo[4];
  var tag6 = leagueInfo[5];

  $("#riotIcon").attr("src", "resources/img/riot/" + img + ".png");

  // infolist.innerHTML = tag;
  $("#riotTd1").append(tag1);
  $("#riotTd2").append(tag2);
  $("#riotTd3").append(tag3);
  $("#riotTd4").append(tag4);
  $("#riotTd5").append(tag5);
  $("#riotTd6").append(tag6);
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
  // 검색하면 보이게 .
  $(".riotDetailInfoTbl").css("opacity", "100%");
  // $(".riotDetailInfoTbl").empty();
  // 이번에는 for 문안에서 url 을 만들어야함.
  let count = 0;
  for (let i = 0; i < matchId.length; i++) {
    const m_id = matchId[i];
    console.log("================================");
    // console.log(m_id);
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
    let summonerName = await data.info.participants[indexForSearcherPuuid]
      .summonerName;
    console.log(summonerName);
    //  챔피언이름
    let ChampionName =
      data.info.participants[indexForSearcherPuuid].championName;
    console.log(ChampionName);
    //  챔피언 사진 (사각형)
    let ChampionSquarePhoto =
      "http://ddragon.leagueoflegends.com/cdn/13.16.1/img/champion/" +
      ChampionName +
      ".png";
    console.log(ChampionSquarePhoto);
    // 게임 끝났을 때 챔피언 레벨
    let C_level_endgame = await data.info.participants[indexForSearcherPuuid]
      .champLevel;
    console.log(C_level_endgame + "레벨");
    // 아이템
    let item0 = await data.info.participants[indexForSearcherPuuid].item0;
    let item1 = await data.info.participants[indexForSearcherPuuid].item1;
    let item2 = await data.info.participants[indexForSearcherPuuid].item2;
    let item3 = await data.info.participants[indexForSearcherPuuid].item3;
    let item4 = await data.info.participants[indexForSearcherPuuid].item4;
    let item5 = await data.info.participants[indexForSearcherPuuid].item5;
    let item6 = await data.info.participants[indexForSearcherPuuid].item6;
    itemArr = [item0, item1, item2, item3, item4, item5, item6];
    // console.log(item1, item2, item3, item4, item5, item6);
    //  아이템 사진 itemUrlArr 주소들어간 사진배열
    itemUrlArr = [];
    for (let i = 0; i < 7; i++) {
      const itemNumber = itemArr[i];
      if (itemNumber == 0) {
        itemUrl =
          "https://w7.pngwing.com/pngs/111/998/png-transparent-letter-x-illustration-x-mark-check-mark-desktop-x-mark-miscellaneous-angle-flag.png";
        // 비어있는 사진 넣는게 더 좋을 듯 ?
      } else {
        itemUrl =
          "https://ddragon.leagueoflegends.com/cdn/13.16.1/img/item/" +
          itemNumber +
          ".png";
      }
      itemUrlArr.push(itemUrl);
    }
    console.log(itemUrlArr[6]);
    // 승리 패배 출력
    let n = await data.info.participants[indexForSearcherPuuid].win;
    let gameResult;
    if (n == true) {
      gameResult = "승리";
      console.log(gameResult);
    } else {
      // 10분? 이전 패배면 -> 다시하기
      gameResult = "패배";
      console.log(gameResult);
      if (data.info.gameDuration < 600) {
        gameResult = "다시하기";
        console.log(gameResult);
      }
    }
    // KDA 출력
    let kill = Number(data.info.participants[indexForSearcherPuuid].kills);
    let death = Number(data.info.participants[indexForSearcherPuuid].deaths);
    let assist = Number(data.info.participants[indexForSearcherPuuid].assists);
    let challenges = data.info.participants[indexForSearcherPuuid].challenges;
    let jsp_kda;
    if (challenges) {
      // challenges 객체가 존재하는 경우
      // console.log(challenges);
      jsp_kda = Math.round(challenges.kda) / 10;
      console.log("kda : " + jsp_kda);
    } else {
      // challenges 객체가 없는 경우
      console.log("challenges 오브젝트 없음");
      let kda = Math.round(kill + assist / death) / 10;
      if (death == 0) {
        jsp_kda = "Perfect!!  No Death";
        console.log(jsp_kda);
      } else {
        jsp_kda = kda;
        console.log("KDA :" + jsp_kda);
      }
    }
    // 순서대로 안되어있네 .. 그러면 win true false 로 팀 나누고  배열로 넘겨야겠다.
    // ㄴㄴ 다시 승리는 필요없음. 그러면어디서부터 어디까지 우리팀인지 알면됨.
    // 우리팀 이 teamId 100 인지 200 인지
    let ourTeam = data.info.participants[indexForSearcherPuuid].teamId;

    console.log(ourTeam);

    // 끝날 때 까지 진행한 사람 총 몇명
    let len = data.metadata.participants;
    let howManyPlayed = len.length; // 10 명 8명 이게 필요하지 안에 내용물은 필요없음.
    console.log(howManyPlayed);
    teamarr1 = [];
    teamarr2 = [];
    for (let i = 0; i < howManyPlayed; i++) {
      let teamId = data.info.participants[i].teamId;
      if (teamId == ourTeam) {
        teamarr1.push(data.info.participants[i].summonerName);
      } else {
        teamarr2.push(data.info.participants[i].summonerName);
      }
      // const element = len[i];
      // console.log(element);
    }
    // 팀 2개로 나눠서 배열만들기 성공
    console.log(teamarr1);
    console.log(teamarr2);
    console.log(kill);
    var jspgameDuration = gameDuration; // 진행시간
    var jspWhenGameEnds = WhenGameEnds; // 몇일전
    // var jspsummonerName = summonerName; // hide on bush
    var jspChampionName = ChampionName; // Ahri
    var jspChampionSquarePhoto = ChampionSquarePhoto; // 사진 사각형
    var jspC_level_endgame = C_level_endgame; // 끝날때 레벨
    var jspGameresult = gameResult; // 게임결과 승리 패배
    // $("#gameDuration").append(jspgameDuration);
    // $("#gameEndsTime").append(jspWhenGameEnds);
    // $("#summonerName").append(jspsummonerName);
    // $("#ChampionName").append(jspChampionName);
    // $("#ChampionSquarePhoto").append(jspChampionSquarePhoto);
    // $("#Champion_level_endgame").append(jspC_level_endgame);

    // 여기서 부터 DetailTag 추가하고
    let DetailTag;
    DetailTag =
      "<tr>" +
      "<td>" +
      "<table>" +
      "<tr>" +
      "<td>솔랭</td>" +
      "</tr>" +
      "<tr>" +
      "<td>" +
      jspWhenGameEnds +
      "</td>" +
      "</tr>" +
      "</table>" +
      "</td>" +
      "<td>" +
      "<table>" +
      "<tr>" +
      "<td>" +
      jspC_level_endgame +
      "</td>" +
      "<td> <img src =" +
      jspChampionSquarePhoto +
      "> </img>챔피언사진</td>" +
      "<td>" +
      jspChampionName +
      "</td>" +
      "<td>" +
      kill +
      "/" +
      death +
      "/" +
      assist +
      "KDA : " +
      jsp_kda +
      "</td>" +
      "</tr>" +
      "</table>" +
      "</td>" +
      "<td rowspan='2'>" +
      "<table>" +
      "<tr><td>" +
      teamarr1[0] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr1[1] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr1[2] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr1[3] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr1[4] +
      "</td></tr>" +
      "</table>" +
      "</td>" +
      "<td rowspan='2'>" +
      "<table>" +
      "<tr><td>" +
      teamarr2[0] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr2[1] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr2[2] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr2[3] +
      "</td></tr>" +
      "<tr><td>" +
      teamarr2[4] +
      "</td></tr>" +
      "</table>" +
      "</td>" +
      "</tr>" +
      "<tr>" +
      "<td>" +
      "<table>" +
      "<tr><td>" +
      jspGameresult +
      "</td></tr>" +
      "<tr><td>" +
      jspgameDuration +
      "</td></tr>" +
      "</table>" +
      "</td>" +
      "<td>" +
      "<table>" +
      "<tr>" +
      "<td><img src =" +
      itemUrlArr[0] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[1] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[2] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[3] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[4] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[5] +
      " width='32' height='32'></td>" +
      "<td><img src =" +
      itemUrlArr[6] +
      " width='32' height='32'></td>" +
      "</tr>" +
      "</table>" +
      "</td>" +
      "</tr>";
    $(".riotDetailInfoTbl").append(DetailTag);
    console.log(itemUrlArr[5]);
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

// 엔터 치면 검색 버튼이 클릭되도록
function keydownEnter() {
  $(document).keydown((e) => {
    if (e.keyCode == 13) {
      $("#b1").trigger("click");
      return false;
    }
  });
}

$(function () {
  keydownEnter();
});
