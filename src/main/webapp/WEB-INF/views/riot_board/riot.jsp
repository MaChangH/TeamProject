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
			<td class="boardName">League of Legends 전적검색</td>
		</tr>
	</table>
	<h3>API key의 유효기간을 확인해주세요 하루한번</h3>

	<form action  = 'riot.summoners'>
		<input placeholder = "소환사명" name ="SN">
		<button>검색</button>
	</form>
</body>
</html>