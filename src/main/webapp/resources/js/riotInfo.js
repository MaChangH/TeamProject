const api_key = "RGAPI-8c905173-cd12-4063-9c29-d0bc2503e539";

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
    "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" +
    n_url +
    "?api_key=" +
    api_key;
  return url;
}

/** 가져온 url 로 fetch  */
async function getJson(url) {
  try {
    let response = await fetch(url);
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
    // console.log(arr);
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
    if (response.status != 200) {
      alert("서버문제입니다.");
    }

    console.log(data);

    let lP = data[0].leaguePoints;
    let rank = data[0].rank;
    let wins = data[0].wins;
    let losses = data[0].losses;
    let tier = data[0].tier;
    console.log(tier, rank, lP, wins, losses);
    arr = [tier, rank, lP, wins, losses];
    return arr;
  } catch (error) {
    console.log(error);
  }
}

/** LeagueInfo 에서 받아온거 jsp 출력 */
function onJsp(leagueInfo) {
  // var infolist = document.querySelector("#infolist");
  $("#infolist").empty();
  console.log(leagueInfo);
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

//  첫 실행  ++ 코드추가 (두번째 실행이랑 코드 맞추기 )
$(document).ready(async function () {
  let name = await getSN();
  let url = await getURL(name);
  let InfoResult = await getJson(url);
  let encId = InfoResult[1]; //encryptedSummonerId
  let LInfo = await leagueInfo(encId);
  console.log(LInfo);
  onJsp(LInfo);

  // url 로 fetch 하는거
});

/**  버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드 + 내용 추가X*/
$(document).ready(function () {
  $("#b1").click(function (e) {
    getOnClick();
  });
});
