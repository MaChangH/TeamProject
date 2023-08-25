<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="boardTitleTbl">
		<tr>
			<td class="boardName themeColor">League of Legends 전적검색</td>
		</tr>
	</table>
	<h3 class="themeColor">API key의 유효기간을 확인해주세요 하루한번</h3>
	<div id = "SNinput">
		<form action  = 'riot.summoners' name = SN_Form onsubmit = "riotSearchCheck();" >
				<input placeholder = "소환사명" name ="SN"  id = "SN" > <br>
			</form>
				<button id = 'b1'>검색</button>
	</div>
	<div id = "infolist"></div>
	
</body>
</html>