/** 소환사명을 넣으면 id/puuid/accountid 파싱가능한 url 나오게  */
$(document).ready(function() {
  $("#b1").click(function() {
      let url = $("#info").val();
      console.log(url)
      // logJSONData(url);
      alert(url)
  });
});
 
/** a = url 파싱해서 return 3개 해주기 */
async function logJSONData(a) {
  try {
    const response = await fetch(a);
    const jsonData = await response.json();
    console.log(jsonData);
    alert(jsonData)
  } catch (error) {
    console.log(error)
    alert(error)
  }

};
