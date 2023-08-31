<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<table>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td align="center" valign="top">
							<table id="todayHot"
								class="bannerHotTbl themeBackground-color themeColor themeBorderColor">
								<tr>
									<td colspan="2" class="bannerHotTitle themeBorderColor">오늘의
										인기 게시글</td>
								</tr>
								<tr>
									<td class="bannerHotIndex bannerHotIndexTitle themeBorderColor">제목</td>
									<td class="bannerHotIndex themeBorderColor">조회수</td>
								</tr>
								<c:forEach var="dh" items="${todayHot }" end="4">
									<tr onclick="boardViewGo(${dh.tp_b_no });" class="bannerHotTr">
										<td
											class="bannerHotMsgTitle themeBackground-colorGrey themeBorderColor">${dh.tp_b_title }</td>
										<td
											class="bannerHotMsgLike themeBackground-colorGrey themeBorderColor">${dh.tp_b_view }</td>
									</tr>
								</c:forEach>
							</table>
						</td>
						<td align="center" valign="top">
							<table id="thisWeekHot"
								class="bannerHotTbl themeBackground-color themeColor themeBorderColor">
								<tr>
									<td colspan="2" class="bannerHotTitle themeBorderColor">이번주
										인기 게시글</td>
								</tr>
								<tr>
									<td class="bannerHotIndex bannerHotIndexTitle themeBorderColor">제목</td>
									<td class="bannerHotIndex themeBorderColor">좋아요</td>
								</tr>
								<c:forEach var="wh" items="${thisWeekHot }" end="4">
									<tr onclick="boardViewGo(${wh.tp_b_no });" class="bannerHotTr">
										<td
											class="bannerHotMsgTitle themeBackground-colorGrey themeBorderColor">${wh.tp_b_title }</td>
										<td
											class="bannerHotMsgLike themeBackground-colorGrey themeBorderColor">${wh.tp_b_like }</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<%-- 뉴스 나오는 배너 --%>
							<table id="newsBannerTbl"
								class="themeBackground-color themeBorderColor themeColor">
								<tr>
									<td align="center" class="themeBorderColor"
										style="font-size: 16pt; font-weight: 900; border-bottom: 2px dashed black">
										뉴스</td>
								</tr>
								<tr>
									<td class="themeBackground-colorGrey">
										<c:forEach var="n" begin="0" end="9">
											<a href="${nLink[n] }" target="_blank">
												<table class="newsTbl themeBorderColor">
												<tr>
													<td class="newsTitle" rowspan="2">${nTitle[n] }</td>
													<td class="newsEmpty"></td>
												</tr>
												<tr>
													<td align="right" class="newsInfo">${nInfo[n] }</td>
												</tr>
												</table>
											</a>
										</c:forEach>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>