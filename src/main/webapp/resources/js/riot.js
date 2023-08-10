// 파라미터로 받아온 값을 json 에서 뽑아내는함수 
function getSN_URL(k) {
  alert("k 값은 ? " + k);
  const url = document.SN_Form.k.value;

  // 받아온 k 파라미터를 url 에서 파싱하는 콜백함수
  $.getJSON(url, function(get_var) {
    let m = get_var[k];
    alert(`${k}는` + m);
    
  });
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
});
