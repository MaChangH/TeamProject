<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoUpdate.jsp</title>
</head>
<body>
	<table class="memberTitleTbl themeColor">
		<tr>
			<td class="memberTitle">정보수정</td>
		</tr>
	</table>
	<table id="infoUpdateTbl" class="infoTbl themeColor themeBackground-color themeBorderColor">
		<form action="member.update" method="post"
			enctype="multipart/form-data" onsubmit="return updateCheck();"
			name="updateForm">
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">ID</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor">
				<input
					value="${sessionScope.loginMember.tp_m_id }" name="tp_m_id"
					class="infoInput" readonly="readonly" >
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">PW</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor">
				<input type="password"
					value="${sessionScope.loginMember.tp_m_pw }" name="tp_m_pw"
					class="infoInput" placeholder="4~20자, 영어 및 숫자 " autofocus="autofocus" maxlength="20">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">PW 확인</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor">
					<input type="password" name="tp_m_pwChk" class="infoInput" autocomplete="off" autofocus="autofocus" maxlength="20">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">닉네임</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor"><input name="tp_m_nick" id="updateNick"
					value="${sessionScope.loginMember.tp_m_nick }"
					class="infoInput" placeholder="2~12자" autocomplete="off">
					<span id="updateNicknameChk" class="themeNotice">이미 가입된 닉네임입니다</span>
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">이름</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor"><input name="tp_m_name"
					value="${sessionScope.loginMember.tp_m_name }" placeholder="이름"
					class="infoInput" autocomplete="off" maxlength="10">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">주소</td>
				<td id="signupInputAddr" class="infoContent themeBackground-colorGrey themeBorderColor"><p>
					<input name="tp_m_addr1" id="joinAddr1" class="infoInput" autocomplete="off" placeholder="우편번호" readonly="readonly"  value="${addr[0] }"><p>
					<input name="tp_m_addr2" id="joinAddr2" class="infoInput" autocomplete="off" placeholder="주소" readonly="readonly"  value="${addr[1] }"><p>
					<input name="tp_m_addr3" class="infoInput" autocomplete="off" placeholder="상세주소"  value="${addr[2] }">
				</td>
			</tr>
			<tr>
				<td class="infoIndex themeReplyWriter themeBackground-color themeBorderColor">사진</td>
				<td class="infoContent themeBackground-colorGrey themeBorderColor"><p>
					<img src="resources/img/${sessionScope.loginMember.tp_m_photo }" class="infoImg"> 
					<img id="photoPreview" class="photoPreview memberPhotoPreview themeBackground-color themeBorderColor" src="resources/img/photoPreview.png"><p>
					<input class="imgUpload" id="imgUpload" name="tp_m_photo" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="themeBtn">정보수정</button>&nbsp;&nbsp;&nbsp;
		</form>
					<button onclick="homeGo();" class="themeBtn">취소</button>
				</td>
				
			</tr>
	</table>
	<input id="updateNicknameNow" type="hidden" value="${sessionScope.loginMember.tp_m_nick }">
</body>
</html>