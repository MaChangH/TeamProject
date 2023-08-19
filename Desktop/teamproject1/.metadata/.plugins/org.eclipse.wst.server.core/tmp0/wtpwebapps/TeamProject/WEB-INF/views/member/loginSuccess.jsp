<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <%--로그인 성공 --%>
<title>loginSuccess.jsp</title>
</head>
<body>
	<table id="loginSuccessTbl">
		<tr>
			<td align="center" id="loginSuccessImg"><img src="resources/img/${sessionScope.loginMember.tp_m_photo }"></td>
		</tr>
		<tr>
			<td id="loginMemberID" align="center">환영합니다, ${sessionScope.loginMember.tp_m_nick }님!</td>
		</tr>
		<tr>
			<td id="loginPoint" align="center">내 포인트 : <span id="loginPointNum">${sessionScope.loginMember.tp_m_point } 점</span></td>
		</tr>
		<tr>
			<td align="center">
				<button onclick="infoGo();" class="loginMemberBtn">회원정보</button>
				<button onclick="logout();" class="loginMemberBtn">로그아웃</button>
			</td>
		</tr>
	</table>
</body>
</html>