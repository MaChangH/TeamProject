<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/game/game.css">
</head>
<body>
	<table id="boardTitleTbl">
		<tr>
			<td class="boardName">미니게임</td>
		</tr>
	</table>
	<table onclick="blackJackGo();" class="gameTbl">
		<tr>
			<td><img src="resources/img/game/blackJack/bjThumbnail.png" class="gameThumb"></td>
		</tr>
		<tr>
			<td align="center">블랙잭</td>
		</tr>
	</table>
	<table onclick="desperadoGo();" class="gameTbl">
		<tr>
			<td><img src="resources/img/game/desperado/dThumbnail.jpg" class="gameThumb"></td>
		</tr>
		<tr>
			<td align="center">데스페라도</td>
		</tr>
	</table>
</body>
</html>