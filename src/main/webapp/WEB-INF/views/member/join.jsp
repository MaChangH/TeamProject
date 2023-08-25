<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
	<table class="memberTitleTbl themeColor">
		<tr>
			<td class="memberTitle">회원가입</td>
		</tr>
	</table>
	<table id="joinTbl" class="themeColor themeBackground-color themeBorderColor"">
	<form action="member.join" method="post" enctype="multipart/form-data" name="joinForm" onsubmit="return joinCheck();">
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">ID</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor"><input id="joinId" name="tp_m_id" placeholder="4~20자, 영어 및 숫자" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20">
				<span id="joinIdChk" class="themeNotice">이미 가입된 아이디입니다</span>
			</td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">PW</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor"><input type="password" name="tp_m_pw" placeholder="4~20자, 영어 및 숫자 " class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20"></td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">PW 확인</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor"><input type="password" name="tp_m_pwChk" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20"></td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">닉네임</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor"><input id="joinNick" placeholder="2~12자" name="tp_m_nick" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="12">
				<span id="joinNicknameChk" class="themeNotice">이미 가입된 닉네임입니다</span>
			</td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">이름</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor"><input id="c_name" placeholder="2~10자" name="tp_m_name" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="10"></td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">주소</td>
			<td id="signupInputAddr" class="joinContent themeBackground-colorGrey themeBorderColor">
				<input name="tp_m_addr1" id="joinAddr1" class="infoInput" autocomplete="off" placeholder="우편번호" readonly="readonly"><p>
				<input name="tp_m_addr2" id="joinAddr2" class="infoInput" autocomplete="off" placeholder="주소" readonly="readonly"><p>
				<input name="tp_m_addr3" class="infoInput" autocomplete="off" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td class="joinIndex themeReplyWriter themeBackground-color themeBorderColor">사진</td>
			<td class="joinContent themeBackground-colorGrey themeBorderColor">
				<input class="imgUpload" id="signupPhoto" name="tp_m_photo" type="file"><p>
				<span id="photoNotice">png, jpg, jpeg, gif 등록가능</span>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<button class="themeBtn">가입</button>&nbsp;&nbsp;&nbsp;
	</form>
				<button onclick="loginGo();" class="themeBtn">취소</button>
			</td>
		</tr>
	</table>
</body>
</html>