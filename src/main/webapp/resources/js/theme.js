//theme.js

// 사이트 테마 변경 후 home으로 이동하는 함수
function themeChange() {
	$('#indexThemeBtn').click(() => {
		let color = $('#indexTheme').val();
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

// input값에 기록된 값을 토대로 css를 변경하는 함수
function colorChange() {
	let color = $('#indexThemeInput').val();
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
	$('body').css('background-color', '#00FFFF10');
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
	$('.themeBorderColor').css('border-color', 'white');
}



$(function() {
	themeChange();
});