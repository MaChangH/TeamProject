const api_key = "RGAPI-e072e403-a04e-470c-ab52-086a48a47cd5";

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
    console.log(response);
    console.log(data);
  } catch (error) {
    console.log(error);
  }
  // console.log(data.id);
  // console.log(data.name);
  // console.log(data.puuid);
}

//  첫 실행
$(document).ready(async function () {
  let name = await getSN();
  let url = await getURL(name);
  getJson(url);
  // url 로 fetch 하는거
});

// 버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드
function getOnClick() {
  $(document).ready(async function () {
    let name = await getSN();
    let url = await getURL(name);
    getJson(url);
  });
}

// 버튼을 눌러도 동작을 안해서 두번째 실행부터 필요한 코드
$(document).ready(function () {
  $("#b1").click(function (e) {
    getOnClick();
  });
});
