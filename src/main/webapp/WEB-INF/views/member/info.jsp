<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info.jsp</title>
</head>
<body>
	<table id="joinTbl">
		<form action="member.update.go" method="post"
			enctype="multipart/form-data"
			name="memberUpdateForm">
			<tr>
				<td>ID</td>
				<td>
				<input
					value="${sessionScope.loginMember.tp_m_id }" name="tp_m_id"
					class="i1" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
				<input type="password"
					value="${sessionScope.loginMember.tp_m_pw }" name="tp_m_pw"
					class="i1" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input name="tp_m_nick"
					value="${sessionScope.loginMember.tp_m_name }"
					class="i1" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="tp_m_name"
					value="${sessionScope.loginMember.tp_m_name }" placeholder="이름"
					class="i1" autocomplete="off" maxlength="10" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td id="infoInputAddr" colspan="2">
					<input value="${addr[0] }" readonly="readonly"><p>
					<input value="${addr[1] }" readonly="readonly"><p>
					<input value="${addr[2] }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
				<img src="resources/img/${sessionScope.loginMember.tp_m_photo }"
					e="max-width: 30%; box-shadow: 3px 3px 3px violet;"> <br>
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