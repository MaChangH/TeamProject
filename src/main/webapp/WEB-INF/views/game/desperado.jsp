<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/game/desperado.css">
<script type="text/javascript" src="resources/js/game/desperado.js"></script>
</head>
<body>
	<table class="themeColor">
		<tr>
			<td id="dTitle" class="themeColor">Desperado</td>
		</tr>
	</table>
	<div id="dSpace"> <!-- 게임 공간 -->
	<input id="dStmt" value="0" type="hidden"> <!-- 게임 상황을 결정하는 변수 -->
	<input id="dGunFireStmt" value="0" type="hidden"> <!-- 총 발사 가능여부를 결정하는 변수 -->
	<input id="dGunBullet" readonly="readonly" class="dInput" value="6"> <!-- 남은 총알 -->
	<input id="dGunBullet6" readonly="readonly" class="dInput" value="/ 6"> <!-- 최대 총알 -->
	<input id="dBottleShot" value="1" type="hidden"> <!-- 몇 번째 술병을 쏠 차례인지 나타내는 변수 -->
	<input id="dTimer" value="3" readonly="readonly" type="hidden"> <!-- 제한시간 -->
	<input id="dSwitch" value="0" readonly="readonly" type="hidden"> <!-- 0,1 값으로 여러 가지 동작을 제한하는 스위치 -->
	<input id="dScore" name="myPoint" value="0" class="dInput" readonly="readonly"> <!-- 획득 점수 -->
	<c:choose>
		<c:when test="${sessionScope.loginMember eq null }">
			<input id="dLoginChk" value="0" type="hidden"> <!-- 로그인 안 했으면 값이 0 -->
		</c:when>
		<c:otherwise>
			<input id="dLoginChk" value="1" type="hidden"> <!-- 로그인 했으면 값이 1 -->
		</c:otherwise>
	</c:choose>
	<div id="dOpening">Press Any Key</div>
	<div id="Desperado">Desperado</div>
	
		<img src="resources/img/game/desperado/dGun1.png" id="dGun">
		<img src="resources/img/game/desperado/dFire2.png" id="dFire">
		
		<img id="dBottle1" class="dBottle">
		<input id="dBottle1Shape" type="hidden">
		<input id="dBottle1Key" class="dInput dBottleKey">
		<input id="dBottle1KeyNum" type="hidden">
		
		<img id="dBottle2" class="dBottle">
		<input id="dBottle2Shape" type="hidden">
		<input id="dBottle2Key" class="dInput dBottleKey">
		<input id="dBottle2KeyNum" type="hidden">
		
		<img id="dBottle3" class="dBottle">
		<input id="dBottle3Shape" type="hidden">
		<input id="dBottle3Key" class="dInput dBottleKey">
		<input id="dBottle3KeyNum" type="hidden">
		
		<img id="dBottle4" class="dBottle">
		<input id="dBottle4Shape" type="hidden">
		<input id="dBottle4Key" class="dInput dBottleKey">
		<input id="dBottle4KeyNum" type="hidden">
		
		<img id="dBottle5" class="dBottle">
		<input id="dBottle5Shape" type="hidden">
		<input id="dBottle5Key" class="dInput dBottleKey">
		<input id="dBottle5KeyNum" type="hidden">
		
		<button id="dStartBtn" class="dBtn">Game Start</button>
		<button id="dRestartBtn" class="dBtn" onclick="desperadoGo();">Restart</button>
		
		<img id="dTumbleweed" class="dTumbleweed" src="resources/img/game/desperado/dTumbleweed.png">
		<img id="dShadow" class="dTumbleweed" src="resources/img/game/desperado/dShadow.png">
		
		<div id="dBulletInstruction" class="dInstruction">
			총알은 6발이므로<br>
			한 번의 실수는 허용됩니다
		 </div>
		 
		<div id="dRuleInstruction" class="dInstruction">
			각 병에 맞는 키를 입력하면 명중합니다<br>
			제한시간 안에 모든 병을 맞춰야 합니다
		 </div>
		 
		 <div id="dTimeNum"></div>
		 <div id="dTimeBar"></div>
		 <div id="d321"></div>
		 <div id="dResult"></div>
		 
		
	</div>
</body>
</html>