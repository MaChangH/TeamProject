<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	HI 
	<div id = "SNinput">
		<form action  = 'riot.summoners' name = SN_Form onsubmit = "riotSearchCheck();" >
				<input placeholder = "소환사명" name ="SN"  id = "SN" > <br>
				<input  value ="${SNinfoURL}" readonly='readonly' id = 'k'><br>
				<!--  input 타입에 hidden 넣기 -->
				<button>검색</button>
			</form>
	</div>
		
		
		<br><br>
		
	<br>
	
	<div class = 'SNcontent'> ${SN_input }</div>
</body>
</html>