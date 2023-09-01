<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 우측 광고 관련 : id와 class에 ad 가 포함되면 크롬 확장프로그램 adblock에 의해 차단되어,
 Commercial의 앞글자로 c를 따왔음 -->
	<table id="bannerC" class="themeBackground-colorGrey">
		<tr>
			<td align="center">
				<span id="cClose" class="cSpan">&nbsp;X 닫기&nbsp;</span>
				<span id="cOpen" class="cSpan">&nbsp;광고 보기&nbsp;</span>
				<a href="https://store.steampowered.com/app/1449850/YuGiOh_Master_Duel/?l=koreana" target="_blank">
					<img id="c">
				</a>
			</td>
		</tr>
	</table>	
</body>
</html>