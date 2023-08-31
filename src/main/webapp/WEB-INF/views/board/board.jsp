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
<div id="imagePreview" style="display: none; position: absolute; background-color: white; border: 1px solid gray; padding: 5px;">
    <img id="previewImage" style="max-width: 300px; max-height: 300px;">
</div>
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
						<td align="center" class="boardMsgTitle themeBorderColor" colspan="2">제목</td>
						<td align="center" class="boardMsgTitle themeBorderColor">작성자</td>
						<td align="center" class="boardMsgTitle themeBorderColor">작성일</td>
						<td align="center" class="boardMsgTitle themeBorderColor">조회수</td>
						<td align="center" class="boardMsgTitle themeBorderColor">좋아요</td>
					</tr>
					<c:forEach var="tm" items="${boardMsg }">
						<tr onclick="boardViewGo(${tm.tp_b_no })"
							class="boardMsgHover themeBackground-colorGrey">
							<td align="left" class="boardMsg boardNo themeBorderColor">&nbsp;${tm.tp_b_no }</td>
							<td id ="boardTitle" class="boardTitle themeBorderColor" data-image="${tm.tp_b_photo}">&nbsp; 
								<c:if test="${tm.tp_b_like >= 10 }">
									<span class="titleNotice themeBorderColor">★</span>
								</c:if> ${tm.tp_b_title } 
							</td>
							<td id="boardReplyCount" class="themeNotice themeBorderColor" align="center">
								<c:if test="${tm.tp_b_rCount > 0}">
									[${tm.tp_b_rCount }]
								</c:if>
							</td>
							<c:choose>
								<c:when test="${tm.tp_b_writer eq '관리자' }">
									<td align="left" class="boardMsg boardWriter themeBorderColor">♛${tm.tp_b_writer }</td>
								</c:when>
								<c:otherwise>
									<td align="left" class="boardMsg boardWriter themeBorderColor">${tm.tp_b_writer }</td>
								</c:otherwise>
							</c:choose>
							<td align="center" class="boardMsg boardDate themeBorderColor">
							<c:choose>
								<c:when test="${sessionScope.sysdate > tm.tp_b_when }">
								<fmt:formatDate value="${tm.tp_b_when }"
									pattern="MM-dd" />
								</c:when>
								<c:otherwise>
								<fmt:formatDate value="${tm.tp_b_when }"
									pattern="HH:mm" />
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
					</select> <input name="search" placeholder="검색어를 입력하세요" value="${sessionScope.search }">
					<button id="boardSearchBtn" class="themeBtn">검색</button>
				</form></td>
			<td align="right" id="writeButton" class="boardSoild"><form
					action="board.write.go">
					<c:if test="${sessionScope.loginMember ne null }">
						<button class="themeBtn">글쓰기</button>
					</c:if>
				</form></td>
		</tr>
	</table>
		
		<%-- 페이지 넘기는 부분 --%>
	<table class="themeColor">
		<tr>
			<c:if test="${startPage != 1 }">
				<td>
					<a href="board.page?p=1
					&b=${sessionScope.boardPerPage }
					&searchNum=${searchNum }
					&search=${param.search }">[1] 
					</a>
				</td>
				<td class="pageNum">...</td>
			</c:if>
			<td align="center">
				<c:forEach var="p" begin="${startPage }" end="${endPage }">
					<c:if test="${p == param.p }" >
						<span class="themeNotice" style="font-weight: 900;">
					</c:if>
						<a href="board.page?p=${p }
						&b=${sessionScope.boardPerPage }
						&searchNum=${searchNum }
						&search=${param.search }">[${p }] 
						</a>
					<c:if test="${p == param.p }" >
						</span>
					</c:if>
				</c:forEach>
			</td>
			<c:if test="${endPage != allPageCount && endPage != allPageCount - 1 }">
				<td class="pageNum">...</td>
				<td>
					<a href="board.page?p=${allPageCount }
					&b=${sessionScope.boardPerPage }
					&searchNum=${searchNum }
					&search=${param.search }">[${allPageCount }] 
					</a>
				</td>
			</c:if>
		</tr>
	</table>
	
	
</body>
</html>