<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "SNinput">
		<form action  = 'riot.summoners' name = SN_Form >
				<input placeholder = "소환사명" name ="SN" >
				<input type = "hidden" value ="${SNinfoURL}" readonly='readonly' id = 'k'>
				
				<button>검색</button>
			</form>
	</div>
		
		
		<br><br>
		
	HI 
	<br>
	
	<div class = 'SNcontent'> ${SN_input }</div>
</body>
</html>