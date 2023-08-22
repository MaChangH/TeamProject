<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <%--로그인 성공 --%>
<title>loginSuccess.jsp</title>
</head>
<body>
	<table id="loginSuccessTbl" class="themeColor">
		<tr>
			<td align="center" id="loginSuccessImg" class="themeBackground-colorGrey"><img src="resources/img/${sessionScope.loginMember.tp_m_photo }"></td>
		</tr>
		<tr>
			<td id="loginMemberID" align="center">환영합니다, <span class="themeReplyWriter" style="font-weight: 900;">${sessionScope.loginMember.tp_m_nick }</span>님!</td>
		</tr>
		<tr>
			<td id="loginPoint" align="center">내 포인트 : <span id="loginPointNum">${sessionScope.loginMember.tp_m_point } 점</span></td>
		</tr>
		<tr>
			<td align="center">
				<button onclick="settingGo();" class="loginMemberBtn themeBtn">설정</button>
				<button onclick="logout();" class="loginMemberBtn themeBtn">로그아웃</button>
			</td>
		</tr>
	</table>
</body>
</html>