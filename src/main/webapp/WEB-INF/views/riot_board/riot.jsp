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

	<form action  = 'riot.summoners'>
		<input placeholder = "소환사명" name ="SN">
		<button class="themeBtn">검색</button>
	</form>
</body>
</html>