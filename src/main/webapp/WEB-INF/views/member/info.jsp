<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info.jsp</title>
</head>
<body>
	<table class="memberTitleTbl themeColor">
		<tr>
			<td class="memberTitle">회원정보</td>
		</tr>
	</table>
	<table id="infoTbl" class="infoTbl themeColor themeBackground-color themeBorderColor">
		<form action="member.update.go" method="post"
			enctype="multipart/form-data"
			name="memberUpdateForm">
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">ID</td>
				<td class="infoContent themeColor themeBackground-colorGrey themeBorderColor">
				<input
					value="${sessionScope.loginMember.tp_m_id }" name="tp_m_id"
					class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">PW</td>
				<td class="infoContent themeColor themeBackground-colorGrey themeBorderColor"">
				<input id="infoPW" type="password"
					value="${sessionScope.loginMember.tp_m_pw }" name="tp_m_pw"
					class="infoInput" readonly="readonly">
					<span id="seePW" style="font-weight: 900; cursor: pointer;">PW보기</span>
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">닉네임</td>
				<td class="infoContent themeColor themeBackground-colorGrey themeBorderColor""><input name="tp_m_nick"
					value="${sessionScope.loginMember.tp_m_nick }"
					class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">이름</td>
				<td class="infoContent themeColor themeBackground-colorGrey themeBorderColor""><input name="tp_m_name"
					value="${sessionScope.loginMember.tp_m_name }" placeholder="이름"
					class="infoInput" autocomplete="off" maxlength="10" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">주소</td>
				<td id="infoInputAddr" class="themeColor themeBackground-colorGrey themeBorderColor" colspan="2" class="infoContent">
					<input value="${addr[0] }" class="infoInput" readonly="readonly"><p>
					<input value="${addr[1] }" class="infoInput" readonly="readonly"><p>
					<input value="${addr[2] }" class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBorderColor">사진</td>
				<td class="infoContent themeColor themeBackground-colorGrey themeBorderColor"">
				<img src="resources/img/${sessionScope.loginMember.tp_m_photo }" class="infoImg"> <br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="themeBtn">정보수정</button>&nbsp;&nbsp;&nbsp;
		</form>
					<button onclick="settingGo();" class="themeBtn">뒤로</button>
				</td>
				
			</tr>
	</table>
</body>
</html>