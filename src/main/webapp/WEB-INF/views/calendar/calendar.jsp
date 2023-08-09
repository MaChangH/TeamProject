<%@page import="com.teamproject.teamproject.calendar.MyCalender"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
</head>
<body>
	<%
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;

		try {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));

			if (month >= 13) {
				year++;
				month = 1;
			} else if (month <= 0) {
				year--;
				month = 12;
			}
		} catch (Exception e) {

		}
	%>
	<form action="calendar.write">
		<button>글쓰기</button>
	</form>
	<table border="1">
		<tr>
			<td>
				<%-- <a href="?year=<%=year%>&month=<%month-1%>"></a> --%> <input
				type="button" value="이전 달"
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'">
			</td>
			<th colspan="5"><%=year%>년<%=month%>월</th>
			<td><input type="button" value="다음 달"
				onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'"></td>
		</tr>
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		<tr>
			<%
				// 1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
				int first = MyCalender.weekDay(year, month, 1);

				// 1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
				int start = 0;
				start = month == 1 ? MyCalender.lastDay(year - 1, 12) - first : MyCalender.lastDay(year, month - 1) - first;

				// 1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
				for (int i = 1; i <= first; i++) {
					if (i == 1) {
						/* 일요일(빨간색)과 다른날들의 색을 구별주기  */
						out.println("<td class = 'redbefore'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
					} else {
						out.println("<td class = 'before'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");

					}
				}
				for (int i = 1; i <= MyCalender.lastDay(year, month); i++) {
					/*요일별로 색깔 다르게 해주기 위해 td와 class 태그 걸어주기*/
					switch (MyCalender.weekDay(year, month, i)) {
					case 0:
						out.println("<td class ='sun'>" + i + "</td>");
						break;
					case 6:
						out.println("<td class ='sat'>" + i + "</td>");
						break;
					default:
						out.println("<td class ='ect'>" + i + "</td>");
						break;
					}
					if (MyCalender.weekDay(year, month, i) == 6 && i != MyCalender.lastDay(year, month)) {
						out.println("</tr><tr>");
					}
				}
				if (MyCalender.weekDay(year, month, MyCalender.lastDay(year, month)) != 6) {
					for (int i = MyCalender.weekDay(year, month, MyCalender.lastDay(year, month)) + 1; i < 7; i++) {
						out.println("<td></td>");
					}
				}
			%>
		</tr>
	</table>
</body>
</html>