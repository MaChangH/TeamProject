<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/setting.jsp</title>
</head>
<body>
	<table id="settingTbl" class="themeColor">
		<tr>
			<td class="settingTd">
				<button id="settingThemeChangeBtn" class="settingBtn themeBtn">테마 설정</button>
			</td>
			<td>
				사이트의 전체적인 색감을 변경할 수 있습니다.
			</td>
		</tr>
		<c:if test="${sessionScope.loginMember ne null }">
		<tr>
			<td class="settingTd">
				<button class="settingBtn themeBtn" onclick="infoGo();">가입 정보</button>
			</td>
			<td>
				회원가입 할 때 입력한 내용들을 확인 및 수정 할 수 있습니다.
			</td>
		</tr>
		<tr>
			<td class="settingTd">
				<button class="settingBtn themeBtn" onclick="byeGo();">회원 탈퇴</button>
			</td>
			<td>
				회원탈퇴 시 작성한 모든 게시글/댓글도 함께 삭제됩니다.
			</td>
		</tr>
		</c:if>
	</table>
	
	<table id="settingThemeTbl" class="themeColor themeBackground-color themeBorderColor themePreviewColor themePreviewBackground-color themePreviewBorderColor">
		<tr>
			<td align="center" colspan="2" style="font-size: 16pt; font-weight: 900;">
				테마 설정
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="settingThemePreview">
					<table id="settingThemePreviewTbl" class="themeBackground-colorGrey themeColor themePreviewBackground-colorGrey themePreviewColor">
						<tr>
							<td id="settingThemePreviewWriter" style="font-weight: 900;">
								테마설정 <span class="themeReplyWriter themePreviewReplyWriter">(작성자)</span>
							</td>
			
						</tr>
						<tr>
							<td id="settingThemePreviewText">
								<span class="titleNotice themeNotice themePreviewNotice" style="font-weight: 900;">[중요]</span> 현재 테마에서는 이렇게 보입니다.
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<select id="settingThemeSelect">
					<option value="themeSelect">사이트 테마</option>
					<option value="Blue">Blue(기본)</option>
					<option value="Red">Red</option>
					<option value="Orange">Orange</option>
					<option value="Silver">Silver</option>
					<option value="Dark">Dark</option>
				</select>
			</td>
			<td align="right">
				<button id="settingThemeBtn" class="themeBtn themePreviewBtn">테마 변경</button>
				<button id="settingThemeCancelBtn" class="themeBtn themePreviewBtn">닫기</button>
			</td>
		</tr>
	</table>
</body>
</html>