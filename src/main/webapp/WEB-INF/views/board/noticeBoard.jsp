<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/noticeBoard.jsp</title>
</head>
<body>
	<table id="boardTitleTbl">
		<tr>
			<td class="boardName">공지사항</td>
		</tr>
	</table>
	<%-- 공지사항 보이는 부분(최근 공지 5개까지만) --%>
	<table id="boardNoticeTbl">
		<tr>
			<td align="center" class="boardMsgTitle"></td>
			<td align="center" class="boardMsgTitle">제목</td>
			<td align="center" class="boardMsgTitle">작성자</td>
			<td align="center" class="boardMsgTitle">작성일</td>
			<td align="center" class="boardMsgTitle">조회수</td>
			<td align="center" class="boardMsgTitle">좋아요</td>
		</tr>
			<c:forEach var="n" items="${notice }">
					<tr onclick="boardViewGo(${n.tp_b_no })" class="boardMsgHover">
						<td align="left" class="boardMsg boardNo">[공지]</td>
						<td class="boardMsg boardTitle">&nbsp;${n.tp_b_title }</td>
						<td align="left" class="boardMsg boardWriter">★${n.tp_b_writer }</td>
						<td align="right" class="boardMsg boardDate" class="notice4">
							<fmt:formatDate value="${n.tp_b_when }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td align="center" class="boardMsg boardView">${n.tp_b_view }</td>
						<td align="center" class="boardMsg boardLike">${n.tp_b_like }</td>
					</tr>
			</c:forEach>
		</table>
		<table>
		<tr>

			<%-- 검색 기능 부분 --%>

			<td align="center"><form action="board.search" name="searchForm"
					onsubmit="return searchboard();">
					<input name="search" placeholder="제목 검색">
					<button>검색</button>
				</form></td>
					<c:if test="${sessionScope.loginMember.tp_m_role eq 1 }">
						<td align="right" id="writeButton" class="boardSoild">
						<form action="board.write.go">
							<button>글쓰기</button>
						</form>
						</td>
					</c:if>
		</tr>

		

		<%-- 페이지 넘기는 부분 --%>

		<tr>
			<td colspan="2" align="center"><c:forEach var="p" begin="1"
					end="${APCN }">
					<a href="notice.page?p=${p }">[${p }] </a>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>