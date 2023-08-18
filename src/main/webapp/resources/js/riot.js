// 파라미터로 받아온 값을 json 에서 뽑아내는함수 
function getSN_URL(info) {
  
  const url = document.SN_Form.info.value;
  console.log('url : ' + url)
  // 받아온 k 파라미터를 url 에서 파싱하는 콜백함수
  $.getJSON(url, function(get_var) {
    let m = get_var[info];
    callvalFromgetSN_URL(m)
    return m;
  });
}

// 다른 url 만들고 거기서 id/puuid/accountId 가지고 각각 파싱하는 거 만들면됨.
// 어떤 url 을 가지고 와야하는지 
// return 의 값을 함수내에서 정하고 
// 함수 호출 후 변수에 저장

// 방법 1. 비동기식 -> 동기식으로 전환 promise 사용
// 방법 2. java DAO 랑 연결해서 거기서 값을 가지고오는거. 
// 		DAO에서 진행해서 여기서는 띄워주기만 하는거.
// return 값을 DAO 로 넘겨주는 작업을 할 줄 알아야됨. DAO까지 안가더라도 jsp 에서 나오게만 해도 el에다가 넣어주면  DAO 랑 왔다갔다 가능하니까
// js -> jsp 랑 append / prepend 써가지고 나오게 
function callvalFromgetSN_URL(m){
//	alert(m + "여기는 callval 의 a 값")
	console.log(m)
}

$(function () {
// json 에서 파싱할 값을 정하는 곳
  let id = "id";
  let accountId = "accountId";
  let puuid = "puuid";
  let name = "name";
  getSN_URL(id);
  getSN_URL(accountId);
  getSN_URL(puuid);
  getSN_URL(name);
//  callval(id)
});
