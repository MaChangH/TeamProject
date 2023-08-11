<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/game/blackJack.css">
<script type="text/javascript" src="resources/js/game/blackJack.js"></script>
</head>
<body>
	<table>
		<tr>
			<td id="bJTitle">Black Jack</td>
		</tr>
	</table>
	<div id="bJSpace">
		<input id="bJStmt" value="0" type="hidden">
		<input id="bJTurn" value="0" type="hidden">
		<input id="bJSwitch" value="0" type="hidden">
		<input id="bJMyCard" value="1" type="hidden">
		<input id="bJOpCard" value="1" type="hidden">
		<input id="bJCardNum" value="1" type="hidden">
		<input id="bJMyAce" value="0" type="hidden">
		<input id="bJOpAce" value="0" type="hidden">
		<input id="bJMySum" class="bJSum" readonly="readonly">
		<input id="bJOpSum" class="bJSum" readonly="readonly">
		
		<c:forEach var="n" items="${sessionScope.bJCards }" varStatus="status">
			<input value=${n } id="cn${bJSeq[status.index] }" type="hidden">
		</c:forEach>
		
		<button id="bJStartBtn" class="bJBtn">게임 시작</button>
		<button id="bJRuleBtn" class="bJBtn">게임 규칙</button>
		<table id="bJRuleTbl">
			<tr>
				<td align="center" id="bJRuleTitle">게임 규칙</td>
			</tr>
			<tr>
				<td class="bJRule">- 카드 숫자의 합이 큰 쪽이 승리하는 게임입니다.</td>
			</tr>
			<tr>
				<td class="bJRule">- 카드 숫자의 합이 21이 넘어가면 패배합니다.</td>
			</tr>
			<tr>
				<td class="bJRule">- 플레이어가 카드를 결정하면, 딜러는 뒷면의 카드를 공개합니다.</td>
			</tr>
			<tr>
				<td class="bJRule">- 그 후, 딜러는 카드의 합이 17이상이 될때까지 카드를 드로우합니다.</td>
			</tr>
			<tr>
				<td class="bJRule">- 나와 딜러의 숫자의 합이 같을 경우에도 딜러가 승리합니다.</td>
			</tr>
			<tr>
				<td class="bJRule">※ J,Q,K는 10으로 / A는 1 또는 11로 사용할 수 있습니다 ※</td>
			</tr>
			<tr>
				<td align="center">
					<button id="bJRuleCloseBtn" class="bJBtn">X 닫기</button>
				</td>
			</tr>
		</table>
		<div id="bJCardDeck" class="bJCardBack"><span id="bJCardDeckText">카드 받기</span></div>
		<button id="bJStandBtn" class="bJBtn">스탠드</button>
		<button id="bJRestartBtn" class="bJBtn" onclick="blackJackGo();">다시 하기</button>
		<div id="bJMyWin" class="bJResult"><span class="bJPlayer">당신</span>의 승리입니다</div>
		<div id="bJOpWin" class="bJResult"><span class="bJDealer">딜러</span>의 승리입니다</div>
		<div id="bJMyBlackJack" class="bJResult"><span class="bJPlayer">플레이어</span>의 <span class="bJBlackJack">블랙잭!</span></div>
		<div id="bJOpBlackJack" class="bJResult"><span class="bJDealer">딜러</span>의  <span class="bJBlackJack">블랙잭!</span></div>
	</div>
</body>
</html>