<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginGo.jsp</title>
</head>
<body>
	<table class="memberTitleTbl themeColor">
		<tr>
			<td class="memberTitle">로그인</td>
		</tr>
	</table>
	<table id="loginGoTbl" class="themeBackground-color themeBorderColor themeColor">
		<form action="member.login" method="POST">
		<tr>
			<td align="center"><input name="tp_m_id" placeholder="ID" class="i1" maxlength="20" autocomplete="off" autofocus="autofocus"></td>
		</tr>
		<tr>
			<td align="center"><input name="tp_m_pw" type="password" placeholder="PW" class="i1" maxlength="20"></td>
		</tr>
		<tr>
			<td align="center">
			<button class="themeBtn">로그인</button>&nbsp;&nbsp;&nbsp;
		</form>
			<button onclick="goJoin();" class="themeBtn">회원가입</button>
			</td> 
		</tr>	
	</table>
</body>
</html>