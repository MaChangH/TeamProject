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
		<table id="boardViewTbl" class="themeColor themeBackground-color">
			<tr>
				<td id="boardViewTitle" name="tp_b_title" colspan="2">
				<c:if test="${tki.tp_b_notice eq 1 }">
					<span class="titleNotice themeNotice">[공지]</span>
				</c:if>
					${tki.tp_b_title }
					<c:if test="${tki.tp_b_rCount > 0}">
						<span class="themeNotice">[${tki.tp_b_rCount }]</span>
					</c:if>
				</td>
				<td align="center" id="boardViewUD">
					<c:if test="${sessionScope.loginMember.tp_m_nick == tki.tp_b_writer }">
						<button onclick="boardUpdateGo(${tki.tp_b_no }, '${tki.tp_b_writer}');" class="themeBtn">수정</button>&nbsp;&nbsp;
						<button onclick="boardDeleteGo(${tki.tp_b_no }, '${tki.tp_b_writer}' );" class="themeBtn">삭제</button>&nbsp;&nbsp;
					</c:if>
					<button onclick="boardBack(${sessionScope.nowPage},  ${sessionScope.boardPerPage }, '${sessionScope.searchNum }', '${sessionScope.search }');" class="themeBtn">목록</button>
				</td>
			</tr>
			<tr>
			<td id="boardViewWriter">
			<c:choose>
				<c:when test="${tki.tp_b_writer eq '관리자' }">
					♛<span style="cursor: pointer;">${tki.tp_b_writer }</span>
				</c:when>
				<c:otherwise>
					<span style="cursor: pointer;">${tki.tp_b_writer }</span>
				</c:otherwise>
			</c:choose>
					<table id="boardViewWriterImg" class="themeColor themeBackground-color themeBorderColor">
						<tr>
							<td align="center">
								<img class="themeBorderColor" src="resources/img/${sessionScope.writerImg }">
							</td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${tki.tp_b_writer eq '관리자' }">
									<td align="center" class="themeReplyWriter">♛${tki.tp_b_writer }</td>
								</c:when>
								<c:otherwise>
									<td align="center" class="themeReplyWriter">${tki.tp_b_writer }</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td align="center">
								<span id="boardViewWriterImgClose" style="font-weight: 900; cursor: pointer;">X 닫기</span>
							</td>
						</tr>
					</table>
				</td>
				<td id="boardViewDate" class="themeBackground-color"><fmt:formatDate value="${tki.tp_b_when }"
						pattern="yyyy-MM-dd E HH:mm:ss" /></td>
				<td align="center" id="boardViewLike">
					조회수 : ${tki.tp_b_view }
					추천수 : ${tki.tp_b_like }
				</td>
			</tr>
			<tr>
				<td colspan="3" id="boardViewText" class="themeBackground-colorGrey"><c:if test="${tki.tp_b_photo != null }">
				<img id="boardViewImg" src="resources/img/${tki.tp_b_photo }" style="max-width: 50%;"><br></c:if>
				${tki.tp_b_txt }
				</td>
			</tr>
					<c:if test="${sessionScope.loginMember ne null}">
			<tr>
				<td align="center" colspan="3" id="boardViewLikeBtn" class="">
						<button onclick="likeGo();" class="themeBtn">게시글 추천</button>
				</td>
			</tr>
					</c:if>
		</table>
	</c:forEach>
	
	<!-- 댓글 불러오는 곳 -->
	<c:forEach var="r" items="${Reply }">
	<table id="replyTextTbl" class="themeBackground-color themeColor">
		<tr>
			<td id="replyTextWriter">
				${r.tp_r_writer }
				<c:if test="${sessionScope.boardWriter eq r.tp_r_writer }"><span class="themeReplyWriter">(작성자)</span></c:if>
			</td>
			<td align="right"  id="replyTextDate">
				<fmt:formatDate value="${r.tp_r_date }" pattern="yyyy-MM-dd E HH:mm:ss"/>
			</td>
			<c:if test="${sessionScope.loginMember.tp_m_nick == r.tp_r_writer }">
			<td align="center" id="replyTextBtn">
				<button id="replyUpdateBtn${r.tp_r_no }" class="replyUpdateBtn themeBtn" onclick="replyUpdate(${r.tp_r_no });">수정</button>
				<button id="replyDeleteBtn${r.tp_r_no }" class="replyDeleteBtn themeBtn" onclick="replyDeleteGo(${r.tp_r_no });">삭제</button>
				<button id="replyUpdateDoneBtn${r.tp_r_no }" onclick="replyUpdateDone(${r.tp_r_no });" class="replyUpdateDoneBtn themeBtn">작성</button>
				<button id="replyUpdateCancelBtn${r.tp_r_no }" onclick="replyUpdateCancel(${r.tp_r_no });" class="replyUpdateCancelBtn themeBtn">취소</button>
			</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="3" id="replyTextTd" class="themeBackground-colorGrey">
				<span id="replyEdited${r.tp_r_no }" class="themeNotice">${r.tp_r_edit }</span>
				<span id="replyText${r.tp_r_no }">${r.tp_r_text }</span>
				<textarea id="replyTextarea${r.tp_r_no }" class="replyTextarea" readonly="readonly">${r.tp_r_text }</textarea>
				<textarea id="replyHiddenText${r.tp_r_no }" class="replyHiddenText">${r.tp_r_text }</textarea>
			</td>
		</tr>
	</table><p>
	</c:forEach>
	
	<!-- 공지사항은 관리자만 댓글 작성 가능, 그 외에는 로그인 상태에서만 댓글 작성 가능 -->
	<c:if test="${(sessionScope.loginMember ne null and sessionScope.boardManager.tp_b_notice ne 1) or sessionScope.loginMember.tp_m_role eq 1}">
	<form action="reply.write" method="post">
	<input name="token" value="${token }" type="hidden">
	<table id="replyWriteTbl" class="themeBackground-color themeColor">
		<tr>
			<td id="replyWriteWriter" colspan="2" class="themeReplyWriter">
				${sessionScope.loginMember.tp_m_nick }
				<input name="tp_r_writer" value="${sessionScope.loginMember.tp_m_nick }" type="hidden">
			</td>
			
		</tr>
		<tr>
			<td id="replyWriteText">
				<textarea id="replyWriteTextarea" class="replyarea" name="tp_r_text"></textarea>
			</td>
			<td align="center" id="replyWriteBtn">
				<button class="themeBtn">작성</button>
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