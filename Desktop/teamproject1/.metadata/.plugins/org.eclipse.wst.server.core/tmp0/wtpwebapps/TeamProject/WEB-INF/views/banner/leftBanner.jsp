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
	<table id="todayHot" border="1">
	<tr>
		<td colspan="2">오늘의 인기 게시글</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>조회수</td>
	</tr>
	<c:forEach var="dh" items="${todayHot }" end="4">
		<tr onclick="boardViewGo(${dh.tp_b_no });">
			<td>${dh.tp_b_title }</td>
			<td>${dh.tp_b_view }</td>
		</tr>
	</c:forEach>
	</table><p>
	<table id="thisWeekHot" border="1">
	<tr>
		<td colspan="2">이번주 인기 게시글</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>좋아요 수</td>
	</tr>
	<c:forEach var="wh" items="${thisWeekHot }" end="4">
		<tr onclick="boardViewGo(${wh.tp_b_no });">
			<td>${wh.tp_b_title }</td>
			<td>${wh.tp_b_like }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>