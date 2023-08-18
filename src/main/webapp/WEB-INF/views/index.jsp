<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/join.css">
<link rel="stylesheet" href="resources/css/info.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/banner.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/projectjQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/teamValidChecker.js"></script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/replyUpdate.js"></script>
<script type="text/javascript" src="resources/js/riot.js"></script>
<<<<<<< HEAD
<script type="text/javascript" src="resources/js/riotInfo.js"></script>
=======
<script type="text/javascript" src="resources/js/theme.js"></script>
>>>>>>> 43e2f1a9d5bc432db6d1acb4d51b414d1f65a49b
</head>
<body>
	<%-- 타이틀 및 메뉴 --%>
	<table id="indexTitleTbl" class="indexTitleMenu">
		<tr>
			<td id="indexTitle">
				<a class="indexTitleA themeColor" href = "home.go">Team Project</a>
			</td>
		</tr>
	</table>
	<table id="indexMenuTbl" class="indexTitleMenu">
		<tr>
			<td class="indexMenu"><a class="indexMenuA themeColor" href="board.go">BOARD</a></td>
			<td class="indexMenu"><a class="indexMenuA themeColor" href="notice.go">NOTICE</a></td>
			<td class="indexMenu"><a class="indexMenuA themeColor" href="riot.go">RIOT</a></td>
			<td class="indexMenu"><a class="indexMenuA themeColor" href="game.go">GAME</a></td>
			<td class="indexMenu"><a class="indexMenuA themeColor" href="member.go">MEMBER</a></td>
		</tr>
	</table>
	<input id="result" value="${r }" type="hidden">
	
	<table id="indexThemeTbl">
		<tr>
			<td>
				<select id="indexTheme">
					<option value="themeSelect">사이트 테마</option>
					<option value="Blue">Blue(기본)</option>
					<option value="Red">Red</option>
					<option value="Orange">Orange</option>
					<option value="Silver">Silver</option>
					<option value="Dark">Dark</option>
				</select>
				<input id="indexThemeInput" value="${sessionScope.themeColor }" type="hidden">
				<button id="indexThemeBtn">테마 변경</button>
			</td>
		</tr>
	</table>
	
	<%-- 로그인 페이지 --%>
	<table id="indexLoginTbl" class="themeBackground-color themeBorderColor">
		<tr>
			<td>
				<jsp:include page="${lp }" />
			</td>
		</tr>
	</table>
	
	<%-- 메인 컨텐츠 --%>
	<table id="indexContentTbl">
		<tr>
			<td align="center">
				<jsp:include page="${cp }"/>
			</td>
		</tr>
	</table>
	
	<%-- 왼쪽 배너 --%>
	<table id="indexLeftBannerTbl">
		<tr>
			<td>
				<jsp:include page="banner/leftBanner.jsp" />
			</td>
		</tr>
	</table>
	
	<%-- 오른쪽 배너 --%>
	<table id="indexRightBannerTbl">
		<tr>
			<td>
				<jsp:include page="banner/weather.jsp" />
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		colorChange();
	</script>
</body>
</html>