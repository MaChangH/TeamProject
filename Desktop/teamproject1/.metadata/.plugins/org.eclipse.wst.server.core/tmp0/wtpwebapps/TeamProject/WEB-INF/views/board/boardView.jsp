<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardView.jsp</title>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
	<input name="token" value="${token }" type="hidden">
	<c:forEach var="tki" items="${boards }">
		<table id="boardViewTbl" border="1">
			<tr>
				<td id="boardViewTitle" name="tp_b_title" colspan="2">
				<c:if test="${tki.tp_b_notice eq 1 }">
					<span class="titleNotice">[공지]</span>
				</c:if>
					${tki.tp_b_title }
				</td>
				<td align="center" id="boardViewUD">
					<c:if test="${sessionScope.loginMember.tp_m_nick == tki.tp_b_writer }">
						<button onclick="boardUpdateGo(${tki.tp_b_no }, '${tki.tp_b_writer}');">수정</button>&nbsp;&nbsp;
						<button onclick="boardDeleteGo(${tki.tp_b_no }, '${tki.tp_b_writer}' );">삭제</button>&nbsp;&nbsp;
					</c:if>
					<button onclick="boardGo();">목록</button>
				</td>
			</tr>
			<tr>
				<td id="boardViewWriter">${tki.tp_b_writer }</td>
				<td id="boardViewDate"><fmt:formatDate value="${tki.tp_b_when }"
						pattern="yyyy-MM-dd E HH:mm:ss" /></td>
				<td align="center">
					조회수 : ${tki.tp_b_view }
					추천수 : ${tki.tp_b_like }
				</td>
			</tr>
			<tr>
				<td colspan="3" id="boardViewText"><c:if test="${tki.tp_b_photo != null }">
				<img id="boardViewImg" src="resources/img/${tki.tp_b_photo }" style="max-width: 50%;"><br></c:if>
				${tki.tp_b_txt }
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<c:if test="${sessionScope.loginMember ne null}">
						<button onclick="likeGo();">게시글 추천</button>
					</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
	<c:forEach var="r" items="${Reply }">
	<table border="1"  id="replyTextTbl">
		<tr>
			<td id="replyTextWriter">
				${r.tp_r_writer }
			</td>
			<td align="right"  id="replyTextDate">
				<fmt:formatDate value="${r.tp_r_date }" pattern="yyyy-MM-dd E HH:mm:ss"/>
			</td>
			<td align="center" id="replyTextBtn">
			<c:if test="${sessionScope.loginMember.tp_m_nick == r.tp_r_writer }">
				<button id="replyUpdateBtn${r.tp_r_no }" class="replyUpdateBtn" onclick="replyUpdate(${r.tp_r_no });">수정</button>
			</c:if>
			<c:if test="${sessionScope.loginMember.tp_m_nick == r.tp_r_writer }">
				<button id="replyDeleteBtn${r.tp_r_no }" class="replyDeleteBtn" onclick="replyDeleteGo(${r.tp_r_no });">삭제</button>
			</c:if>
				<button id="replyUpdateDoneBtn${r.tp_r_no }" onclick="replyUpdateDone(${r.tp_r_no });" class="replyUpdateDoneBtn">작성</button>
				<button id="replyUpdateCancelBtn${r.tp_r_no }" onclick="replyUpdateCancel(${r.tp_r_no });" class="replyUpdateCancelBtn">취소</button>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<span style="color: red;" id="replyEdited${r.tp_r_no }">${r.tp_r_edit }</span>
				<span id="replyText${r.tp_r_no }">&nbsp;${r.tp_r_text }</span>
				<textarea id="replyTextarea${r.tp_r_no }" class="replyTextarea" readonly="readonly">${r.tp_r_text }</textarea>
				<textarea id="replyHiddenText${r.tp_r_no }" class="replyHiddenText">${r.tp_r_text }</textarea>
			</td>
		</tr>
	</table><p>
	</c:forEach>
	<c:if test="${(sessionScope.loginMember ne null and sessionScope.boardManager.tp_b_notice ne 1) or sessionScope.loginMember.tp_m_role eq 1}">
	<form action="reply.write" method="post">
	<input name="token" value="${token }" type="hidden">
	<table border="1" id="replyWriteTbl">
		<tr>
			<td>
				<input id="replyWriteWriter" name="tp_r_writer" value="${sessionScope.loginMember.tp_m_nick }" readonly="readonly">
			</td>
			<td align="center">
				<button>작성</button>
			</td>
		</tr>
		<tr>
			<td id="replyWriteText" align="center" colspan="2">
				<textarea id="replyWriteTextarea" class="replyarea" name="tp_r_text"></textarea>
			</td>
		</tr>
	</table>
	</form>
	</c:if>
	<script type="text/javascript">
	const DEFAULT_HEIGHT2 = 20;
	const $replyarea = document.querySelector('.replyarea');
	
	$replyarea.oninput = (event) => {
		const $target = event.target;

		$target.style.height = 0;
		$target.style.height = DEFAULT_HEIGHT2 + $target.scrollHeight + 'px';
	};
	</script>
</body>
</html>