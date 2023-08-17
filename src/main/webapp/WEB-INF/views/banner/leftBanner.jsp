<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="todayHot" class="bannerHotTbl">
	<tr>
		<td colspan="2" class="bannerHotTitle">오늘의 인기 게시글</td>
	</tr>
	<tr>
		<td class="bannerHotIndex bannerHotIndexTitle">제목</td>
		<td class="bannerHotIndex">조회수</td>
	</tr>
	<c:forEach var="dh" items="${todayHot }" end="4">
		<tr onclick="boardViewGo(${dh.tp_b_no });" class="bannerHotTr">
			<td class="bannerHotMsgTitle">${dh.tp_b_title }</td>
			<td class="bannerHotMsgLike">${dh.tp_b_view }</td>
		</tr>
	</c:forEach>
	</table>
	<table id="thisWeekHot" class="bannerHotTbl">
	<tr>
		<td colspan="2" class="bannerHotTitle">이번주 인기 게시글</td>
	</tr>
	<tr>
		<td class="bannerHotIndex bannerHotIndexTitle">제목</td>
		<td class="bannerHotIndex">좋아요</td>
	</tr>
	<c:forEach var="wh" items="${thisWeekHot }" end="4">
		<tr onclick="boardViewGo(${wh.tp_b_no });" class="bannerHotTr">
			<td class="bannerHotMsgTitle">${wh.tp_b_title }</td>
			<td class="bannerHotMsgLike">${wh.tp_b_like }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>