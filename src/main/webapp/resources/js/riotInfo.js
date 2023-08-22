
const api_key = 'RGAPI-a6c48516-45e1-4584-8009-d1fa6e0fb548';

/** 소환사명을 넣으면 id/puuid/accountid 파싱가능한 url 나오게  */
// 1. jsp 값 가지고와 . jQuery
$(document).ready(function() {
  $("#b1").click( async function () {
      Uname = $("#SN").val();
      let name_URL = replaceAll(Uname, " " , "%20") // name_URL : %20 추가된 name
      let InfoURL = await Info_JSON_URL(name_URL); // %20 + api_key 된 url
      let result = await logJSONData(InfoURL) // 개개인의 정보(id,name,...) 가지고 오기.
      console.log(result) //여기는 안나오네 .. 아마 함수 값 나오기 전에 호출한듯.
  });
});

/** 2. url 용 닉네임 띄어쓰기에 %20 추가해주는 함수 */
function replaceAll(name, search, replace) {
  const id_urlForm =  name.split(search).join(replace);
  // alert("return " + id_urlForm)
  return id_urlForm;
}

/** 3. %20 추가된 값을 url이름에 넣어줌. url 완성*/ 
function Info_JSON_URL(name_URL) {
  let url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name_URL + "?api_key=" + api_key
  // console.log(url)
  // alert(url)
  return url;
}

/** a = url 파싱해서 return id 1개 해주기  return 더 필요하면 (puuid / accountId ) list 나 array 형태로 return */
function logJSONData(url) {
  fetch(url)
  .then(function (response){
    response.json().then(function(data) {
      console.log(data)
      let id = data.id;
      // let puuid = data.puuid;
      // let accountId = data.accountId;
      // console.log(id)  
      let result = [data.id, data.puuid, data.accountId, data.name];
      console.log(result)
      return result ;
    })
  })
};

/** logJSONData 의 return 인 id 를 받아와서 전적검색 */
