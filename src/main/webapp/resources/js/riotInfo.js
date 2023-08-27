const api_key = "RGAPI-3608265c-5b64-4fd7-a96f-088032b06702";
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
    "/ids?start=0&" +
    "count=" +
    20 + // 가져올 매치 수
    "&api_key=" +
    api_key;
  console.log(url);
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
function matchInfo(matchId) {
  // 이번에는 for 문안에서 url 을 만들어야함.
  for (let i = 0; i < matchId.length; i++) {
    const m_id = matchId[i];
    console.log(m_id);
    let url =
      "https://asia.api.riotgames.com/lol/match/v5/matches/" +
      m_id +
      "?api_key=" +
      api_key;
    console.log(url);
    // url 안에서 fetch 해와야지. 여기서는 각각 개별적으로 진행하는것도 있어야할듯.
    // 일단 하나 동작하는거 만들어놓고 생각하자.
    let response = fetch(url, requestOptions);
    console.log(response);
  }
}

/**버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드  + 코드추가 */
function getOnClick() {
  $(document).ready(async function () {
    let name = await getSN();
    let url = await getURL(name);
    let InfoResult = await getJson(url);
    let encId = InfoResult[1]; //encryptedSummonerId
    let LInfo = await leagueInfo(encId);
    console.log(LInfo);
    onJsp(LInfo);
  });
}
// 매치는 puuid
// 전적은 summonerid

//  첫 실행  ++ 코드추가 (두번째 실행이랑 코드 맞추기 )
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

/**  버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드 + 내용 추가X*/
$(document).ready(function () {
  $("#b1").click(function (e) {
    getOnClick();
  });
});

/*

*/
