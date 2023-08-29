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
	<table class="themeColor" style="width: 60%">
		<tr>
			<td align="right">
				<div class="themeNotice">
					페이지 당 게시글 수
					<select id="noticePerPageSelect">
						<option value="10" <c:if test ="${sessionScope.boardPerPage == 10}"> selected="selected"</c:if>>10</option>
						<option value="15" <c:if test ="${sessionScope.boardPerPage == 15}"> selected="selected"</c:if>>15</option>
						<option value="20" <c:if test ="${sessionScope.boardPerPage == 20}"> selected="selected"</c:if>>20</option>
						<option value="30" <c:if test ="${sessionScope.boardPerPage == 30}"> selected="selected"</c:if>>30</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	<%-- 공지사항 보이는 부분(최근 공지 5개까지만) --%>
	<table id="boardNoticeTbl"
		class="themeBackground-color themeColor themeBorderColor">
		<tr>
			<td align="center" class="boardMsgTitle themeBorderColor"></td>
			<td align="center" class="boardMsgTitle themeBorderColor">제목</td>
			<td align="center" class="boardMsgTitle themeBorderColor">작성자</td>
			<td align="center" class="boardMsgTitle themeBorderColor">작성일</td>
			<td align="center" class="boardMsgTitle themeBorderColor">조회수</td>
			<td align="center" class="boardMsgTitle themeBorderColor">좋아요</td>
		</tr>
		<c:forEach var="n" items="${notice }">
			<tr onclick="boardViewGo(${n.tp_b_no })" class="boardMsgHover">
				<td align="center"
					class="boardMsg noticeNo themeBackground-colorGrey themeBorderColor themeNotice">[공지]</td>
				<td
					class="boardMsg boardTitle themeBackground-colorGrey themeBorderColor">&nbsp;${n.tp_b_title }</td>
				<td align="left"
					class="boardMsg boardWriter themeBackground-colorGrey themeBorderColor">♛${n.tp_b_writer }</td>
				<td align="right"
					class="boardMsg boardDate themeBackground-colorGrey themeBorderColor"
					class="notice4">
					<c:choose>
								<c:when test="${sessionScope.sysdate > n.tp_b_when }">
								<fmt:formatDate value="${n.tp_b_when }"
									pattern="yyyy-MM-dd" />
								</c:when>
								<c:otherwise>
								<fmt:formatDate value="${n.tp_b_when }"
									pattern="yyyy-MM-dd HH:mm" />
								</c:otherwise>
							</c:choose>
						</td>
				<td align="center"
					class="boardMsg boardView themeBackground-colorGrey themeBorderColor">${n.tp_b_view }</td>
				<td align="center"
					class="boardMsg boardLike themeBackground-colorGrey themeBorderColor">${n.tp_b_like }</td>
			</tr>
		</c:forEach>
	</table>
	<table>
		<tr>

			<%-- 검색 기능 부분 --%>

				<td align="center"><form action="notice.search" name="searchForm"
					onsubmit="return searchboard();">
					<input value="1" name="p" type="hidden">
					<input id="noticePerPageSearch" value="${param.b }" name="b" type="hidden">
					<select name="searchNum">
						<option value="1" <c:if test="${sessionScope.searchNum == 1 }">selected="selected"</c:if>> 제목</option>
						<option value="2" <c:if test="${sessionScope.searchNum == 2 }">selected="selected"</c:if>> 내용</option>
						<option value="3" <c:if test="${sessionScope.searchNum == 3 }">selected="selected"</c:if>> 닉네임</option>
					</select> <input name="search" placeholder="제목 검색" value=${param.search }>
					<button id="noticeSearchBtn" class="themeBtn">검색</button>
				</form></td>
			<c:if test="${sessionScope.loginMember.tp_m_role eq 1 }">
				<td align="right" id="writeButton" class="boardSoild">
					<form action="board.write.go">
						<button class="themeBtn">글쓰기</button>
					</form>
				</td>
			</c:if>
		</tr>
	</table>
		<%-- 페이지 넘기는 부분 --%>
	<table class="themeColor">
		<tr>
			<c:if test="${startPage != 1 }">
				<td>
					<a href="notice.page?p=1
					&b=${sessionScope.boardPerPage }
					&searchNum=${searchNum }
					&search=${param.search }">[1] 
					</a>
				</td>
				<c:if test="${endPage > 4 }">
				<td>...</td>
				</c:if>
			</c:if>
			<td align="center">
				<c:forEach var="p" begin="${startPage }" end="${endPage }">
					<c:if test="${p == param.p }" >
						<span class="themeNotice" style="font-weight: 900;">
					</c:if>
						<a href="notice.page?p=${p }
						&b=${sessionScope.boardPerPage }
						&searchNum=${searchNum }
						&search=${param.search }">[${p }] 
					</a>
					<c:if test="${p == param.p }" >
						</span>
					</c:if>
				</c:forEach>
			</td>
			<c:if test="${endPage != APCN && endPage != APCN - 1 }">
				<td>...</td>
				<td>
					<a href="notice.page?p=${APCN }
					&b=${sessionScope.boardPerPage }
					&searchNum=${searchNum }
					&search=${param.search }">[${APCN }] 
					</a>
				</td>
			</c:if>
		</tr>
	</table>
</body>
</html>