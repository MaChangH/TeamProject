<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardWrite.jsp</title>
</head>
<body>
	<table>
		<tr>
			<th colspan="3" align="left">글 작 성</th>
		</tr>
	</table>
		<table id="boardWriteTbl" border="1">
	<form action="board.write" method="post" enctype="multipart/form-data" name="writeForm" onsubmit="return writeCheck();">
	<input name="token" value="${token }" type="hidden">
			<tr>
				<td>
					<table id="writeTbl" border="1">
						<tr>
							<td id="boardWriteTitle">제목 :</td>
							<td>
								<input id="boardWriteTitleContext" name="tp_b_title" autocomplete="off" maxlength="50">
							</td>
						</tr>
						<tr>
							<td align="center">
								<c:if test="${sessionScope.loginMember.tp_m_role eq 1 }">
								공지 : 
									<input id="noticeChk" type="checkbox">
								중요 : 
									<input id="importantChk" type="checkbox">
								</c:if>
									<input id="isNotice" value="0" name="tp_b_notice" type="hidden">
									<input id="isImportant" value="0" name="tp_b_imp" type="hidden">
							</td>
							<td id="boardWriteWriter"><input id="boardWriteWriterContext" name="tp_b_writer" value="${sessionScope.loginMember.tp_m_nick }" readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="2" id="boardWriteImg">이미지 첨부 : <input id="boardWriteImgSelect" type="file" name="tp_b_photo"></td>
						</tr>
						<tr>
							<td class="textarea" id="boardWriteText" colspan="3" align="center"><textarea id="boardWriteTextarea" name="tp_b_txt"
									style="resize: none;" maxlength="300" rows="10"></textarea></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right" id="boardWriteBtn">
					<button>작성</button>
			</form>
					<button onclick="boardGo()">취소</button>
				</td>
			</tr>
		</table>
</body>
</html>