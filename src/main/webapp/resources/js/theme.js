//theme.js

// 사이트 테마 변경 후 home으로 이동하는 함수
function themeChange() {
	$('#settingThemeBtn').click(() => {
		let color = $('#settingThemeSelect').val();
		if (color != 'themeSelect') {
			if (confirm(color + "로 테마를 변경하시겠습니까?")) {
				pageGoPost({
					url: "themeChange.go",	//이동할 페이지
					target: "_self",
					vals: [				//전달할 인수들
						["color", color],
						]
				});
			}
		}
	});
}

// 테마 변경 버튼 누르면 변경창 나타나고, 닫기 버튼 누르면 사라지게
function themeChangeAppear() {
	$('#settingThemeChangeBtn').click(() => {
		if ($('#settingThemeTbl').css('opacity') == 0) {
			$('#settingThemeTbl').css('display', 'block');
			setTimeout(() => {
				$('#settingThemeTbl').css('opacity', '100%');
			}, 100);
		}
	});
	
	$('#settingThemeCancelBtn').click(() => {
		if ($('#settingThemeTbl').css('opacity') == 1) {
			$('#settingThemeTbl').css('opacity', '0%');
			setTimeout(() => {
				$('#settingThemeTbl').css('display', 'none');
			}, 300);
		}
	});
}

// input값에 기록된 값을 토대로 css를 변경하는 함수
function colorChange() {
	let color = $('#settingThemeInput').val();
	if (color == 'Red') {
		colorRed();
	} else if (color == 'Orange') {
		colorOrange();
	} else if (color == 'Silver') {
		colorSilver();
	} else if (color == 'Dark') {
		colorDark();
	} else {
		colorNormal();
	}
}

function colorNormal() {
	$('body').css('background-color', '#00AAFF10');
	$('.themeBackground-color').css('background-color', '#abd2ff');
	$('.themeBackground-colorGrey').css('background-color', '#ddedff');
	$('.themeReplyWriter').css('color', '#0000AA');
}

function colorRed() {
	$('body').css('background-color', '#FF000020');
}

function colorOrange() {
	$('body').css('background-color', '#FF6A0020');
}

function colorSilver() {
	$('body').css('background-color', '#00000020');
}

function colorDark() {
	$('body').css('background-color', '#202020');
	$('.themeColor').css('color', 'white');
	$('.themeBackground-color').css('background-color', 'black');
	$('.themeBackground-colorGrey').css('background-color', '#101010');
	$('.themeNotice').css('color', 'yellow');
	$('.themeReplyWriter').css('color', 'yellow');
	$('.themeBorderColor').css('border-color', 'white');
}



$(function() {
	themeChange();
	themeChangeAppear();
});