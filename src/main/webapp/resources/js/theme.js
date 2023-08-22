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
			}, 10);
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
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#abd2ff');
	$('.themeBackground-colorGrey').css('background-color', '#ddedff');
	$('.themeNotice').css('color', 'red');
	$('.themeReplyWriter').css('color', '#0000AA');
	$('.themeBorderColor').css('border-color', 'black');
}

function colorRed() {
	$('body').css('background-color', '#FF000020');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#ffa9a9');
	$('.themeBackground-colorGrey').css('background-color', '#ffdfdf');
	$('.themeNotice').css('color', '#008888');
	$('.themeReplyWriter').css('color', '#AA0000');
	$('.themeBorderColor').css('border-color', 'black');
}

function colorOrange() {
	$('body').css('background-color', '#FF6A0020');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#ffc1a9');
	$('.themeBackground-colorGrey').css('background-color', '#ffe6db');
	$('.themeNotice').css('color', '#0066AA');
	$('.themeReplyWriter').css('color', '#e17122');
	$('.themeBorderColor').css('border-color', 'black');
}

function colorSilver() {
	$('body').css('background-color', '#00000010');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#dddddd');
	$('.themeBackground-colorGrey').css('background-color', '#ebebeb');
	$('.themeNotice').css('color', 'red');
	$('.themeReplyWriter').css('color', '#0000AA');
	$('.themeBorderColor').css('border-color', 'black');
}

function colorDark() {
	$('body').css('background-color', '#101010');
	$('.themeColor').css('color', 'white');
	$('.themeBackground-color').css('background-color', 'black');
	$('.themeBackground-colorGrey').css('background-color', '#202020');
	$('.themeNotice').css('color', 'yellow');
	$('.themeReplyWriter').css('color', 'yellow');
	$('.themeBorderColor').css('border-color', 'white');
	$('.themeBtn').css('border-color', 'white');
	$('.themeBtn').css('background-color', '#202020');
	$('.themeBtn').css('color', 'white');
}



$(function() {
	themeChange();
	themeChangeAppear();
});