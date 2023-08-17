<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info.jsp</title>
</head>
<body>
	<table class="memberTitleTbl">
		<tr>
			<td class="memberTitle">회원정보</td>
		</tr>
	</table>
	<table id="infoTbl" class="infoTbl">
		<form action="member.update.go" method="post"
			enctype="multipart/form-data"
			name="memberUpdateForm">
			<tr>
				<td class="infoIndex">ID</td>
				<td class="infoContent">
				<input
					value="${sessionScope.loginMember.tp_m_id }" name="tp_m_id"
					class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex">PW</td>
				<td class="infoContent">
				<input type="password"
					value="${sessionScope.loginMember.tp_m_pw }" name="tp_m_pw"
					class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex">닉네임</td>
				<td class="infoContent"><input name="tp_m_nick"
					value="${sessionScope.loginMember.tp_m_name }"
					class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex">이름</td>
				<td class="infoContent"><input name="tp_m_name"
					value="${sessionScope.loginMember.tp_m_name }" placeholder="이름"
					class="infoInput" autocomplete="off" maxlength="10" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex">주소</td>
				<td id="infoInputAddr" colspan="2" class="infoContent">
					<input value="${addr[0] }" class="infoInput" readonly="readonly"><p>
					<input value="${addr[1] }" class="infoInput" readonly="readonly"><p>
					<input value="${addr[2] }" class="infoInput" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="infoIndex">사진</td>
				<td class="infoContent">
				<img src="resources/img/${sessionScope.loginMember.tp_m_photo }" class="infoImg"> <br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>정보수정</button>&nbsp;&nbsp;&nbsp;
		</form>
					<button onclick="byeGo();">회원탈퇴</button>
				</td>
				
			</tr>
	</table>
</body>
</html>