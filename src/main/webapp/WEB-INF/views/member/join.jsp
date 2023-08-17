<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
	<table class="memberTitleTbl">
		<tr>
			<td class="memberTitle">회원가입</td>
		</tr>
	</table>
	<table id="joinTbl">
	<form action="member.join" method="post" enctype="multipart/form-data" name="joinForm" onsubmit="return joinCheck();">
		<tr>
			<td class="joinIndex">ID</td>
			<td class="joinContent"><input id="joinId" name="tp_m_id" placeholder="4~20자, 영어 및 숫자" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20">
				<span id="joinIdChk">이미 가입된 아이디입니다</span>
			</td>
		</tr>
		<tr>
			<td class="joinIndex">PW</td>
			<td class="joinContent"><input type="password" name="tp_m_pw" placeholder="4~20자, 영어 및 숫자 " class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20"></td>
		</tr>
		<tr>
			<td class="joinIndex">PW 확인</td>
			<td class="joinContent"><input type="password" name="tp_m_pwChk" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20"></td>
		</tr>
		<tr>
			<td class="joinIndex">닉네임</td>
			<td class="joinContent"><input id="joinNick" placeholder="2~12자" name="tp_m_nick" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="12">
				<span id="joinNicknameChk">이미 가입된 닉네임입니다</span>
			</td>
		</tr>
		<tr>
			<td class="joinIndex">이름</td>
			<td class="joinContent"><input id="c_name" placeholder="2~10자" name="tp_m_name" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="10"></td>
		</tr>
		<tr>
			<td class="joinIndex">주소</td>
			<td id="signupInputAddr" class="joinContent">
				<input name="tp_m_addr1" id="joinAddr1" class="infoInput" autocomplete="off" placeholder="우편번호" readonly="readonly"><p>
				<input name="tp_m_addr2" id="joinAddr2" class="infoInput" autocomplete="off" placeholder="주소" readonly="readonly"><p>
				<input name="tp_m_addr3" class="infoInput" autocomplete="off" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td class="joinIndex">사진</td>
			<td class="joinContent">
				<input class="imgUpload" id="signupPhoto" name="tp_m_photo" type="file"><p>
				<span id="photoNotice">png, jpg, jpeg, gif 등록가능</span>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<button>가입</button>&nbsp;&nbsp;&nbsp;
	</form>
				<button onclick="homeGo();">취소</button>
			</td>
		</tr>
	</table>
</body>
</html>