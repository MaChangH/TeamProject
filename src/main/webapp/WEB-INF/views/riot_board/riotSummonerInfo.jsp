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
		<form action  = 'riot.summoners' name = SNinputForm>
				<input placeholder = "소환사명" name ="SN" id = "SN_url" >
				<button>검색</button>
			<input type = "hidden" name = ${SNinfoURL }>
			</form>
			
	</div>
		<br><br>
	HI 
	<br>
	
	<div class = 'SNcontent'> ${SN_input }</div>
</body>
</html>