<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoUpdate.jsp</title>
</head>
<body>
	<table id="updateTbl">
		<form action="member.update" method="post"
			enctype="multipart/form-data" onsubmit="return updateCheck();"
			name="updateForm">
			<tr>
				<td>ID</td>
				<td>
				<input
					value="${sessionScope.loginMember.tp_m_id }" name="tp_m_id"
					class="i1" readonly="readonly" >
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
				<input type="password"
					value="${sessionScope.loginMember.tp_m_pw }" name="tp_m_pw"
					class="i1" placeholder="4~20자, 영어 및 숫자 " autofocus="autofocus" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>PW 확인</td>
				<td><input type="password" name="tp_m_pwChk" class="i1" autocomplete="off" autofocus="autofocus" maxlength="20"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input name="tp_m_nick" id="updateNick"
					value="${sessionScope.loginMember.tp_m_name }"
					class="i1" placeholder="4~12자" autocomplete="off">
				</td>
				<td id="updateNicknameChk">이미 가입된 닉네임입니다</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="tp_m_name"
					value="${sessionScope.loginMember.tp_m_name }" placeholder="이름"
					class="i1" autocomplete="off" maxlength="10">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td id="signupInputAddr">
					<input name="tp_m_addr1" id="joinAddr1" autocomplete="off" placeholder="우편번호" readonly="readonly"  value="${addr[0] }"><p>
					<input name="tp_m_addr2" id="joinAddr2" autocomplete="off" placeholder="주소" readonly="readonly"  value="${addr[1] }"><p>
					<input name="tp_m_addr3" autocomplete="off" placeholder="상세주소"  value="${addr[2] }">
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><br>
				<img src="resources/img/${sessionScope.loginMember.tp_m_photo }"
					e="max-width: 30%; box-shadow: 3px 3px 3px violet;"> <br>
					<input name="tp_m_photo" type="file"
					style="font-family: 'b'; font-size: 13pt; font-weight: 900;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>정보수정</button>&nbsp;&nbsp;&nbsp;
		</form>
					<button onclick="homeGo();">취소</button>
				</td>
				
			</tr>
	</table>
	<input id="updateNicknameNow" type="hidden" value="${sessionScope.loginMember.tp_m_nick }">
</body>
</html>