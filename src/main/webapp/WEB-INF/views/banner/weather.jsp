<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>banner/weather.jsp</title>
<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url: "banner.weather.get",
			success: function(asd) {
				$(asd).find('item').each(function(i, w) {
					let w_category = $(w).find('category').text();
					let w_temp = "-";
					let w_wfKor = "-";
					let td_te = "";
					let td_wf = "";
					if (w_category == 'T1H') {
						w_temp = $(w).find('obsrValue').text() + ' ℃';
						td_te = $('<td></td>').text(w_temp);
						td_te.attr('id', 'weatherTemp');
					} else if (w_category == 'PTY') {
						w_wfKor = $(w).find('obsrValue').text();
						if (w_wfKor == '0') {
							w_wfKor = '맑음';
							$('#weatherImg').attr('src','resources/img/weatherIcon/shine.gif');
						} else if (w_wfKor == '1') {
							w_wfKor = '비';
							$('#weatherImg').attr('src','resources/img/weatherIcon/rain.gif');
						} else if (w_wfKor == '2') {
							w_wfKor = '비/눈';
							$('#weatherImg').attr('src','resources/img/weatherIcon/rain.gif');
						} else if (w_wfKor == '3') {
							w_wfKor = '눈';
							$('#weatherImg').attr('src','resources/img/weatherIcon/snow.gif');
						} else if (w_wfKor == '5') {
							w_wfKor = '빗방울';
							$('#weatherImg').attr('src','resources/img/weatherIcon/rain.gif');
						} else if (w_wfKor == '6') {
							w_wfKor = '빗방울눈날림';
							$('#weatherImg').attr('src','resources/img/weatherIcon/rain.gif');
						} else if (w_wfKor == '7') {
							w_wfKor = '눈날림';
							$('#weatherImg').attr('src','resources/img/weatherIcon/snow.gif');
						}
						td_wf = $('<td></td>').text(w_wfKor);
						td_wf.attr('id', 'weatherFore');
					} else {
						w_temp = "";
						w_wfKor = "";
					}
					
					
					
					let tr1 = $('<tr></tr>');
					let tr2 = $('<tr></tr>');
					
					$(tr1).append(td_wf);
					$(tr2).append(td_te);
					$('#weatherResultTbl').append(tr1, tr2);
					
					
				});
			}
			
			
		});
		
	});
</script>
</head>
<body>
	<table id="weatherTbl">
		<tr>
			<th id="weatherTitle">현재 날씨</th>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td id="weatherCity">${city1 }</td>
					</tr>
					<tr>
						<td id="weatherCity">${city2 } ${city3 }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table id="weatherResultTbl">
					<img id="weatherImg">
				</table>
			</td>
		</tr>
	</table>
</body>
</html>