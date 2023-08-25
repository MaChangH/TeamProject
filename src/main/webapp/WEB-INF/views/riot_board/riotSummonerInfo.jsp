<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/riot.css">
<script type="text/javascript" src="resources/js/riotInfo.js"></script>
</head>
<body>
	<table id="boardTitleTbl">
		<tr>
			<td class="boardName themeColor">League of Legends 전적검색 <span class="themeReplyWriter">(솔로랭크)</span></td>
		</tr>
	</table>
	<h3 class="themeNotice">API key의 유효기간을 확인해주세요 ( 하루 한 번 )</h3>
	<div id = "SNinput">
		<input placeholder = "소환사명" name ="SN"  id = "SN" autocomplete="off" autofocus="autofocus" >
		<button id = 'b1' class="themeBtn" onclick="return riotSearchCheck();">검색</button>
			<!--  검색을 누른 뒤 페이지를 따로 summoners 로 넘어감. -->
	</div>
	<table id="riotSommonerTbl1" class="riotSommonerTbl themeColor theme-BorderColor themeBackground-color">
		<tr id="riotTr0">
			<td id="riotTd0" rowspan="3" align="center">
				<img id="riotIcon">
			</td>
			<td>
				<table id="riotSommonerTbl2">
					<tr id="riotTr1">
						<td id="riotTd1" class="riotTd themeReplyWriter" align="left">
						</td>
					</tr>
					<tr id="riotTr2">
						<td id="riotTd2" class="riotTd" align="right">
						</td>
					</tr>
					<tr id="riotTr3">
						<td id="riotTd3" class="riotTd" align="right">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<table id="riotSommonerTbl3" border="1" class="riotSommonerTbl themeBackground-colorGrey themeColor">
		<tr id="riotTr4">
			<td id="riotTd4" class="riotTd riotInfo" align="left">
			</td>
			<td id="riotTd5" class="riotTd riotInfo" align="left">
			</td>
			<td id="riotTd6" class="riotTd riotInfo" align="left">
			</td>
		</tr>
	</table>
	
</body>
</html>