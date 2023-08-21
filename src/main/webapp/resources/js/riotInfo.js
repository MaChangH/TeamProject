
const api_key = 'RGAPI-34e221cd-0ae6-4a94-9556-cb7f9b289f9c';


/** 소환사명을 넣으면 id/puuid/accountid 파싱가능한 url 나오게  */
// 1. jsp 값 가지고와 . jQuery
$(document).ready(function() {
  $("#b1").click(function () {
      let name = $("#SN").val();
      // console.log(name);
      // alert(name)
      let name_URL = replaceAll(name, " " , "%20") // name_URL : %20 추가된 name
      let InfoURL = Info_JSON_URL(name_URL); // %20 + api_key 된 url
      console.log(InfoURL) 
      let JSONData = logJSONData(Info_JSON_URL) // JSON 가지고 오기만 해결하면 된다.
      console.log(JSONData)
  });
});


/** 2. url 용 닉네임 띄어쓰기에 %20 추가해주는 함수 */
function replaceAll(name, search, replace) {
  const id_urlForm =  name.split(search).join(replace);
  alert("return " + id_urlForm)
  return id_urlForm;
}

/** 3. %20 추가된 값을 url이름에 넣어줌. url 완성*/ 
function Info_JSON_URL(name_URL) {
  let url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name_URL + "?api_key=" + api_key
  // console.log(url)
  // alert(url)
  return url;
}

/** a = url 파싱해서 return 3개 해주기 */
async function logJSONData(url) {
  const response = await fetch(url);
  const jsonData = await response.json();
  console.log(jsonData);
};
