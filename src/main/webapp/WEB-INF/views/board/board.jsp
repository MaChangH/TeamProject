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
$(document).ready(function() {
    // [...] 클릭 시 페이지 이동 처리
    $("td.pageNum").click(function() {
      var inputPageNum = prompt("이동할 페이지 번호를 입력하세요:", "");
      
    // 페이지 넘버가 정해진 값을 넘어가면 없음 처리 근데 정상작동아 안됨
      if (inputPageNum > ${sessionScope.APCSession }) {
     	 alert("페이지가 없습니다");
 	  }
      // 입력된 페이지 번호가 유효한 숫자라면 페이지 이동
      else if (inputPageNum !== null && !isNaN(inputPageNum)) {
        var targetUrl = "board.page?p=" + inputPageNum;
        
        // 검색 조건이 있다면 URL에 추가합니다.
        var searchNum = "${sessionScope.searchNum }";
        if (searchNum !== '1') {
          targetUrl += "&searchNum=" + searchNum;
        }
        
        // 검색 조건이 있다면 URL에 추가합니다.
        var search = "${empty sessionScope.search ? '1' : sessionScope.search }";
        if (search !== '1') {
          targetUrl += "&search=" + search;
        }
        
        window.location.href = targetUrl;
      } else {
          // 숫자가 아닌 경우에 대한 처리를 여기에 추가하세요.
          alert("유효한 숫자를 입력해주세요.");
      }
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
					<select name="searchNum">
						<option value="1" <c:if test="${sessionScope.searchNum == 1 }">selected="selected"</c:if>> 제목</option>
						<option value="2" <c:if test="${sessionScope.searchNum == 2 }">selected="selected"</c:if>> 내용</option>
						<option value="3" <c:if test="${sessionScope.searchNum == 3 }">selected="selected"</c:if>> 닉네임</option>
					</select> <input name="search" placeholder="제목 검색" value=${param.search }>
					<button class="themeBtn">검색</button>
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
			<c:if test="${startPage != 1 }">
				<td><a class="themeColor" href="board.page?p=1
					<c:choose>
						<c:when test="${empty sessionScope.searchNum }">1</c:when>
						<c:otherwise>&searchNum=${sessionScope.searchNum }</c:otherwise>
					</c:choose>">[1] </a></td>
				<td class="pageNum">...</td>
			</c:if>
			<td colspan="2" align="center">
				<c:forEach var="p" begin="${startPage }" end="${endPage }">
					<a class="themeColor" href="board.page?p=${p }
					<c:choose>
						<c:when test="${empty sessionScope.searchNum }">1</c:when>
						<c:otherwise>&searchNum=${sessionScope.searchNum }</c:otherwise>
					</c:choose>">[${p }] </a>
				</c:forEach>
			</td>
			<c:if test="${endPage != allPageCount && endPage != allPageCount - 1 }">
				<td class="pageNum">...</td>
				<td><a class="themeColor" href="board.page?p=${allPageCount }
					<c:choose>
						<c:when test="${empty sessionScope.searchNum }">1</c:when>
						<c:otherwise>&searchNum=${sessionScope.searchNum }</c:otherwise>
					</c:choose>">[${allPageCount }] </a></td>
			</c:if>
		</tr>
	</table>
</body>
</html>