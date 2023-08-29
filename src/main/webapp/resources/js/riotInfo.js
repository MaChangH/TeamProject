const api_key = "RGAPI-f74463b7-f619-450b-b23b-abd61742ddeb";

// 함수에서 promise return (resolve)
/** 버튼 누르면  input value 를 가져온다.
 *  이벤트 핸들러 -> Promise (o) / async (x)
 */
function getSN() {
  return new Promise((resolve, reject) => {
    $("#b1").click(function (e) {
    	let sn = $("#SN").val();
    	if (sn != "") {
    		resolve(sn);
		}
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
	/** 롤 계정 자체는 존재하지만, 랭크 게임을 하지 않은 경우 */
	    if (data == "") { 
	    	$('#riotSommonerTbl3').css('opacity', '0%');
	    	let lP = '정보를 불러올 수 없습니다';
			let rank = '';
			let wins = '';
			let losses = '';
			let tier = '통계가 부족합니다';
			let winrate = '';
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
					arr = [tier, rank, lP + ' LP', wins + ' 승', losses + ' 패', '승률 ' + winrate + ' %'];
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
	$('.riotSommonerTbl').css('opacity', '100%');
	
	$("#infolist").empty();
	$(".riotTd").empty();
	
	let tier = leagueInfo[0];
	let tierNum = leagueInfo[1];
	let img = tier;
  
	/** 챌린저, 그랜드마스터, 마스터는 티어의 구분만 있고 랭크 구분이 없음 */
	if (tier == 'CHALLENGER' || tier == 'GRANDMASTER' || tier == 'MASTER') {
		tierNum = "";
	} else if (tier == '통계가 부족합니다') {
		img = 'empty';
	}
	
  var tag1 = $('#SN').val();
  var tag2 = tier + "\t " + tierNum;
  var tag3 = leagueInfo[2];
  var tag4 = leagueInfo[3];
  var tag5 = leagueInfo[4];
  var tag6 = leagueInfo[5];
 
  $('#riotIcon').attr('src', 'resources/img/riot/' + img + '.png');
  
  

  // infolist.innerHTML = tag;
  $("#riotTd1").append(tag1);
  $("#riotTd2").append(tag2);
  $("#riotTd3").append(tag3);
  $("#riotTd4").append(tag4);
  $("#riotTd5").append(tag5);
  $("#riotTd6").append(tag6);
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
  onJsp(LInfo);

  // url 로 fetch 하는거
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
			$('#b1').trigger('click');
			return false;
		}
	});
}

$(function () {
	keydownEnter();
});
