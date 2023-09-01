<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate.jsp</title>
</head>
<body>
	<table id="boardTitleTbl">
		<tr>
			<td class="boardName themeColor">게시글 수정</td>
		</tr>
	</table>
	<table id="boardUpdateTbl">
		<c:forEach var="tki" items="${boards }">
			<tr>
				<td>
					<form action="board.update" method="post" name="updateForm" enctype="multipart/form-data"
						onsubmit="return boardUpdateCheck();">
						<input name="token" value="${token }" type="hidden">
						<input id="updateNoticeResult" name="tp_b_notice" value="0" type="hidden">
						<input id="updateImpResult" name="tp_b_imp" value="0" type="hidden">
						<table id="updateTbl" class="themeBackground-color themeColor">
							<tr>
								<td id="boardUpdateTitle" class="boardUpdateTitle" align="center">제목<input name="tp_b_no"
									value="${tki.tp_b_no }" type="hidden" readonly="readonly"></td>
								<td class="boardUpdateTitle"><input id="boardUpdateTitleContext" name="tp_b_title" autocomplete="off" maxlength="50"
									value="${tki.tp_b_title }"></td>
								<td  id="boardUpdateChk">
								<c:if test="${sessionScope.loginMember.tp_m_role eq 1 }">
									공지 <input type="checkbox" id="updateNotice">
									<input value="${tki.tp_b_notice }" id="isUpdateNotice" type="hidden">
									중요 <input type="checkbox" id="updateImp">
									<input value="${tki.tp_b_imp }" id="isUpdateImp" type="hidden">
								</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="3" id="boardUpdateText" class="themeBackground-colorGrey" align="center">
									<c:if test="${tki.tp_b_photo != null }">
										<input id="imgUpdateInput" value="${tki.tp_b_photo }" type="hidden">
										<img id="boardUpdateImg" src="resources/img/${tki.tp_b_photo }" style="max-height: 150px; max-width: 150px;">
										<input class="imgUpdate" id="imgUpdate" type="file" name="tp_b_photo">
										<span class="themeReplyWriter">(jpg, jpeg, png, gif 첨부 가능)</span>
									</c:if> 
									<c:if test="${empty tki.tp_b_photo }">
										<img id="photoPreview" class="photoPreview" src="resources/img/photoPreview.png">
										<input class="imgUpload" id="imgUpload" type="file" name="tp_b_photo">
										<span class="themeReplyWriter">(jpg, jpeg, png, gif 첨부 가능)</span>
									</c:if> 
									<textarea class="textarea" id="boardUpdateTextarea" name="tp_b_txt" style="resize: none;" maxlength="300" rows="10">${sessionScope.boardText }</textarea>
								</td>
							</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<button class="themeBtn">작성</button>
				</form>
					<button onclick="boardViewGo(${tki.tp_b_no});" class="themeBtn">취소</button>
					</td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">
	if ($('#isUpdateNotice').val() == 1) {
		$('#updateNotice').prop('checked', 'true');
	}
	if ($('#isUpdateImp').val() == 1) {
		$('#updateImp').prop('checked', 'true');
	}
	
const DEFAULT_HEIGHT = 180;
	

	const $textarea = document.querySelector('.textarea');
	
	$textarea.oninput = (event) => {
		const $target = event.target;

		$target.style.height = 0;
		$target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
	};
	
	</script>
</body>
</html>