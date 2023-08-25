<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/board.jsp</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
// 공지사항 숨기기, 펼치기
$(function() {
	$('.notice').hide(); 
	$('#unfold').click(function() {
        $('.notice').show();
        $(this).hide();
    });
	$('#folding').click(function() {
        $('.notice').hide(); 
        $('#unfold').show(); 
    });
});


</script>
</head>
<body>
	<%-- 공지사항 보이는 부분(최근 공지 5개까지만) --%>
	<table id="boardNoticeTbl"
		class="themeBackground-color themeColor themeBorderColor">
		<tr>
			<td colspan="6" align="center" id="boardNoticeTitle">공지사항</td>
		</tr>
		<tr>
			<td align="center" class="boardMsgTitle themeBorderColor"></td>
			<td align="center" class="boardMsgTitle themeBorderColor">제목</td>
			<td align="center" class="boardMsgTitle themeBorderColor">작성자</td>
			<td align="center" class="boardMsgTitle themeBorderColor">작성일</td>
			<td align="center" class="boardMsgTitle themeBorderColor">조회수</td>
			<td align="center" class="boardMsgTitle themeBorderColor">좋아요</td>
		</tr>
		<c:forEach var="i" items="${imp }">
			<tr onclick="boardViewGo(${i.tp_b_no })"
				class="boardMsgHover themeBackground-colorGrey">
				<td align="center"
					class="boardMsg boardNo themeNotice themeBorderColor"
					style="font-weight: bold; color: red;">[중요]</td>
				<td class="boardMsg boardTitle themeBorderColor">&nbsp;${i.tp_b_title }</td>
				<td align="left" class="boardMsg boardWriter themeBorderColor">♛${i.tp_b_writer }</td>
				<td align="right" class="boardMsg boardDate themeBorderColor"
					class="notice4">
					<c:choose>
								<c:when test="${sessionScope.sysdate > i.tp_b_when }">
								<fmt:formatDate value="${i.tp_b_when }"
									pattern="yyyy-MM-dd" />
								</c:when>
								<c:otherwise>
								<fmt:formatDate value="${i.tp_b_when }"
									pattern="yyyy-MM-dd HH:mm" />
								</c:otherwise>
							</c:choose>
				</td>
				<td align="center" class="boardMsg boardView themeBorderColor">${i.tp_b_view }</td>
				<td align="center" class="boardMsg boardLike themeBorderColor">${i.tp_b_like }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center" id="unfold" class="boardFold themeBorderColor">최근 공지사항 펼치기▼</td>
		</tr>
		<c:forEach var="n" items="${notice }" end="2">
			<tr onclick="boardViewGo(${n.tp_b_no })"
				class="boardMsgHover themeBackground-colorGrey notice">
				<td align="center"
					class="boardMsg boardNo themeNotice themeBorderColor">[공지]</td>
				<td class="boardMsg boardTitle themeBorderColor">&nbsp;${n.tp_b_title }</td>
				<td align="left" class="boardMsg boardWriter themeBorderColor">♛${n.tp_b_writer }</td>
				<td align="right" class="boardMsg boardDate themeBorderColor"
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
				<td align="center" class="boardMsg boardView themeBorderColor">${n.tp_b_view }</td>
				<td align="center" class="boardMsg boardLike themeBorderColor">${n.tp_b_like }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center" class="notice boardFold themeBorderColor" id="folding">접기▲</td>
		</tr>
	</table>
	<table class="themeColor" style="width: 60%">
		<tr>
			<td align="right">
				<div class="themeNotice">
					페이지 당 게시글 수
					<select id="boardPerPageSelect">
						<option value="10" <c:if test ="${sessionScope.boardPerPage == 10}"> selected="selected"</c:if>>10</option>
						<option value="15" <c:if test ="${sessionScope.boardPerPage == 15}"> selected="selected"</c:if>>15</option>
						<option value="20" <c:if test ="${sessionScope.boardPerPage == 20}"> selected="selected"</c:if>>20</option>
						<option value="30" <c:if test ="${sessionScope.boardPerPage == 30}"> selected="selected"</c:if>>30</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	<table id="boardTbl">
		<%-- 글 제목 보이는 부분 --%>
		<tr>
			<td colspan="2" id="noSoild">
				<table id="boardMsgTbl"
					class="themeBackground-color themeColor themeBorderColor">
					<tr>
						<td align="center" class="boardMsgTitle themeBorderColor">번호</td>
						<td align="center" class="boardMsgTitle themeBorderColor">제목</td>
						<td align="center" class="boardMsgTitle themeBorderColor">작성자</td>
						<td align="center" class="boardMsgTitle themeBorderColor">작성일</td>
						<td align="center" class="boardMsgTitle themeBorderColor">조회수</td>
						<td align="center" class="boardMsgTitle themeBorderColor">좋아요</td>
					</tr>
					<c:forEach var="tm" items="${boardMsg }">
						<tr onclick="boardViewGo(${tm.tp_b_no })"
							class="boardMsgHover themeBackground-colorGrey">
							<td align="left" class="boardMsg boardNo themeBorderColor">&nbsp;${tm.tp_b_no }</td>
							<td class="boardMsg boardTitle themeBorderColor">&nbsp; <c:if test="${tm.tp_b_like >= 10 }">
									<span class="titleNotice themeBorderColor">★</span>
								</c:if> ${tm.tp_b_title }
							</td>
							<c:choose>
								<c:when test="${tm.tp_b_writer eq '관리자' }">
									<td align="left" class="boardMsg boardWriter themeBorderColor">♛${tm.tp_b_writer }</td>
								</c:when>
								<c:otherwise>
									<td align="left" class="boardMsg boardWriter themeBorderColor">${tm.tp_b_writer }</td>
								</c:otherwise>
							</c:choose>
							<td align="right" class="boardMsg boardDate themeBorderColor">
							<c:choose>
								<c:when test="${sessionScope.sysdate > tm.tp_b_when }">
								<fmt:formatDate value="${tm.tp_b_when }"
									pattern="yyyy-MM-dd" />
								</c:when>
								<c:otherwise>
								<fmt:formatDate value="${tm.tp_b_when }"
									pattern="yyyy-MM-dd HH:mm" />
								</c:otherwise>
							</c:choose>
							</td>
							<td align="center" class="boardMsg boardView themeBorderColor">${tm.tp_b_view }</td>
							<td align="center" class="boardMsg boardLike themeBorderColor">${tm.tp_b_like }</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>

		<tr>

			<%-- 검색 기능 부분 --%>

			<td align="center"><form action="board.search" name="searchForm"
					onsubmit="return searchboard();">
					<input value="1" name="p" type="hidden">
					<input id="boardPerPageSearch" value="${param.b }" name="b" type="hidden">
					<select name="searchNum">
						<option value="1" <c:if test="${sessionScope.searchNum == 1 }">selected="selected"</c:if>> 제목</option>
						<option value="2" <c:if test="${sessionScope.searchNum == 2 }">selected="selected"</c:if>> 내용</option>
						<option value="3" <c:if test="${sessionScope.searchNum == 3 }">selected="selected"</c:if>> 닉네임</option>
					</select> <input name="search" placeholder="제목 검색" value="${sessionScope.search }">
					<button id="boardSearchBtn" class="themeBtn">검색</button>
				</form></td>
			<td align="right" id="writeButton" class="boardSoild"><form
					action="board.write.go">
					<c:if test="${sessionScope.loginMember ne null }">
						<button class="themeBtn">글쓰기</button>
					</c:if>
				</form></td>
		</tr>



		<%-- 페이지 넘기는 부분 --%>

		<tr>
			<td colspan="2" align="center">
			<a class="themeReplyWriter themeBorderColor themeBackground-colorGrey boardFirstLast" href="board.page?p=1&b=${sessionScope.boardPerPage }&searchNum=${searchNum }&search=${param.search }">첫페이지</a>&nbsp;&nbsp;&nbsp;
			<c:if test="${param.p >10 }">
				<a class="themeColor" href="board.page?p=${sessionScope.pageNum - 10 }&b=${sessionScope.boardPerPage }&searchNum=${searchNum }&search=${param.search }">◀&nbsp;&nbsp;</a>
			</c:if>
				<c:forEach var="p" begin="${sessionScope.pageNum - 9 }" end="${sessionScope.pageNum }">
					<c:if test="${p <= allPageCount }">
					<a class="themeColor" href="board.page?p=${p }&b=${sessionScope.boardPerPage }&searchNum=${searchNum }&search=${param.search }">
					<c:if test="${p == param.p or (param.p == null and p%10 == 1)}" >
						<span class="themeNotice" style="font-weight: 900;">
					</c:if>
					[${p }]</a>&nbsp;&nbsp;
					<c:if test="${p == param.p }" >
						</span>
					</c:if>
					</c:if>
				</c:forEach>
			<c:if test="${allPageCount > sessionScope.pageNum }">
				<a class="themeColor" href="board.page?p=
				<c:choose>
					<c:when test="${param.p eq null }">
						11
					</c:when>
					<c:otherwise>
					<fmt:formatNumber groupingUsed="false" pattern="#" value="${1 + sessionScope.pageNum }" />
					</c:otherwise>
				</c:choose>
				&searchNum=${searchNum }&search=${param.search }&b=${sessionScope.boardPerPage }">▶</a>
			</c:if>
			&nbsp;&nbsp;&nbsp;<a class="themeReplyWriter themeBorderColor themeBackground-colorGrey boardFirstLast" href="board.page?p=${allPageCount }&b=${sessionScope.boardPerPage }&searchNum=${searchNum }&search=${param.search }">끝페이지</a>
			</td>
		</tr>
	</table>
</body>
</html>