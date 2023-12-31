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
	} else if (color == 'Green') {
		colorGreen();
	} else if (color == 'Silver') {
		colorSilver();
	} else if (color == 'Dark') {
		colorDark();
	} else {
		colorNormal();
	}
}

// select의 값을 변경했을 때 미리보기의 css가 임시로 변경되고, 닫기를 누르면 원래대로 복구되게하는 함수
function themePreview() {
	$('#settingThemeSelect').change(function() {
		let color = $('#settingThemeSelect').val();
		if (color == 'Red') {
			colorPreviewRed();
		} else if (color == 'Orange') {
			colorPreviewOrange();
		} else if (color == 'Green') {
			colorPreviewGreen();
		} else if (color == 'Silver') {
			colorPreviewSilver();
		} else if (color == 'Dark') {
			colorPreviewDark();
		} else if(color == 'Blue') {
			colorPreviewNormal();
		} else {
			colorChange();
		}
	});
	
	$('#settingThemeCancelBtn').click(function() {
		colorChange();
	});
}

/////////////// 테마 설정

function colorNormal() {
	$('body').css('background-color', '#00AAFF10');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#abd2ff');
	$('.themeBackground-color').css('background', '#abd2ff');
	$('.themeBackground-colorGrey').css('background-color', '#ddedff');
	$('.themeNotice').css('color', 'red');
	$('.themeReplyWriter').css('color', '#0000AA');
	$('.themeBorderColor').css('border-color', 'black');
	$('.themeBtn').css('border-color', 'black');
	$('.themeBtn').css('background-color', '#ddedff');
	$('.themeBtn').css('color', 'black');
	$('.riotDodge').css('color', '#00000050');

}

function colorRed() {
	$('body').css('background-color', '#FF000020');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#ffa9a9');
	$('.themeBackground-color').css('background', '#ffa9a9');
	$('.themeBackground-colorGrey').css('background-color', '#ffd1d1');
	$('.themeNotice').css('color', '#008888');
	$('.themeReplyWriter').css('color', '#AA0000');
	$('.themeBorderColor').css('border-color', 'black');
	$('.themeBtn').css('border-color', 'black');
	$('.themeBtn').css('background-color', '#ffcccc');
	$('.themeBtn').css('color', 'black');
	$('.riotDodge').css('color', '#00000050');
}

function colorOrange() {
	$('body').css('background-color', '#FF6A0020');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#ffc1a9');
	$('.themeBackground-color').css('background', '#ffc1a9');
	$('.themeBackground-colorGrey').css('background-color', '#ffe6db');
	$('.themeNotice').css('color', '#0066AA');
	$('.themeReplyWriter').css('color', '#e17122');
	$('.themeBorderColor').css('border-color', 'black');
	$('.themeBtn').css('border-color', 'black');
	$('.themeBtn').css('background-color', '#ffe6db');
	$('.themeBtn').css('color', 'black');
	$('.riotDodge').css('color', '#00000050');
}

function colorGreen() {
	$('body').css('background-color', '#00FF0015');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background-color', '#8ceb94');
	$('.themeBackground-color').css('background', '#8ceb94');
	$('.themeBackground-colorGrey').css('background-color', '#e5ffe1');
	$('.themeNotice').css('color', '#FF3300');
	$('.themeReplyWriter').css('color', '#386450');
	$('.themeBorderColor').css('border-color', 'black');
	$('.themeBtn').css('border-color', 'black');
	$('.themeBtn').css('background-color', '#d3f9cd');
	$('.themeBtn').css('color', 'black');
	$('.riotDodge').css('color', '#00000050');
}

function colorSilver() {
	$('body').css('background', '#f8f8f8');
	$('.themeColor').css('color', 'black');
	$('.themeBackground-color').css('background', 'linear-gradient(to left, #dcdcdc, #fafafa)');
	$('.themeBackground-colorGrey').css('background-color', '#f5f5f5');
	$('.themeNotice').css('color', 'red');
	$('.themeReplyWriter').css('color', '#0000AA');
	$('.themeBorderColor').css('border-color', 'black');
	$('.themeBtn').css('border-color', 'black');
	$('.themeBtn').css('background-color', '#efefef');
	$('.themeBtn').css('color', 'black');
	$('.riotDodge').css('color', '#00000050');
}

function colorDark() {
	$('body').css('background-color', '#101010');
	$('.themeColor').css('color', 'white');
	$('.themeBackground-color').css('background-color', 'black');
	$('.themeBackground-color').css('background', 'black');
	$('.themeBackground-colorGrey').css('background-color', '#202020');
	$('.themeNotice').css('color', 'yellow');
	$('.themeReplyWriter').css('color', 'yellow');
	$('.themeBorderColor').css('border-color', 'white');
	$('.themeBtn').css('border-color', 'white');
	$('.themeBtn').css('background-color', '#202020');
	$('.themeBtn').css('color', 'white');
	$('.riotDodge').css('color', '#ffffff50');
}

//////////////// 미리보기 설정

function colorPreviewNormal() {
	$('.themePreviewColor').css('color', 'black');
	$('.themePreviewBackground-color').css('background-color', '#abd2ff');
	$('.themePreviewBackground-color').css('background', '#abd2ff');
	$('.themePreviewBackground-colorGrey').css('background-color', '#ddedff');
	$('.themePreviewNotice').css('color', 'red');
	$('.themePreviewReplyWriter').css('color', '#0000AA');
	$('.themePreviewBorderColor').css('border-color', 'black');
	$('.themePreviewBtn').css('border-color', 'black');
	$('.themePreviewBtn').css('background-color', '#ddedff');
	$('.themePreviewBtn').css('color', 'black');
}

function colorPreviewRed() {
	$('.themePreviewColor').css('color', 'black');
	$('.themePreviewBackground-color').css('background-color', '#ffa9a9');
	$('.themePreviewBackground-color').css('background', '#ffa9a9');
	$('.themePreviewBackground-colorGrey').css('background-color', '#ffd1d1');
	$('.themePreviewNotice').css('color', '#008888');
	$('.themePreviewReplyWriter').css('color', '#AA0000');
	$('.themePreviewBorderColor').css('border-color', 'black');
	$('.themePreviewBtn').css('border-color', 'black');
	$('.themePreviewBtn').css('background-color', '#ffcccc');
	$('.themePreviewBtn').css('color', 'black');
}

function colorPreviewOrange() {
	$('.themePreviewColor').css('color', 'black');
	$('.themePreviewBackground-color').css('background-color', '#ffc1a9');
	$('.themePreviewBackground-color').css('background', '#ffc1a9');
	$('.themePreviewBackground-colorGrey').css('background-color', '#ffe6db');
	$('.themePreviewNotice').css('color', '#0066AA');
	$('.themePreviewReplyWriter').css('color', '#e17122');
	$('.themePreviewBorderColor').css('border-color', 'black');
	$('.themePreviewBtn').css('border-color', 'black');
	$('.themePreviewBtn').css('background-color', '#ffe6db');
	$('.themePreviewBtn').css('color', 'black');
}

function colorPreviewGreen() {
	$('.themePreviewColor').css('color', 'black');
	$('.themePreviewBackground-color').css('background-color', '#8ceb94');
	$('.themePreviewBackground-color').css('background', '#8ceb94');
	$('.themePreviewBackground-colorGrey').css('background-color', '#e5ffe1');
	$('.themePreviewNotice').css('color', '#FF3300');
	$('.themePreviewReplyWriter').css('color', '#386450');
	$('.themePreviewBorderColor').css('border-color', 'black');
	$('.themePreviewBtn').css('border-color', 'black');
	$('.themePreviewBtn').css('background-color', '#d3f9cd');
	$('.themePreviewBtn').css('color', 'black');
	
}

function colorPreviewSilver() {
	$('.themePreviewColor').css('color', 'black');
	$('.themePreviewBackground-color').css('background', 'linear-gradient(to left, #dcdcdc, #fafafa)');
	$('.themePreviewBackground-colorGrey').css('background-color', '#f5f5f5');
	$('.themePreviewNotice').css('color', 'red');
	$('.themePreviewReplyWriter').css('color', '#0000AA');
	$('.themePreviewBorderColor').css('border-color', 'black');
	$('.themePreviewBtn').css('border-color', 'black');
	$('.themePreviewBtn').css('background-color', '#efefef');
	$('.themePreviewBtn').css('color', 'black');
}

function colorPreviewDark() {
	$('.themePreviewColor').css('color', 'white');
	$('.themePreviewBackground-color').css('background-color', 'black');
	$('.themePreviewBackground-color').css('background', 'black');
	$('.themePreviewBackground-colorGrey').css('background-color', '#202020');
	$('.themePreviewNotice').css('color', 'yellow');
	$('.themePreviewReplyWriter').css('color', 'yellow');
	$('.themePreviewBorderColor').css('border-color', 'white');
	$('.themePreviewBtn').css('border-color', 'white');
	$('.themePreviewBtn').css('background-color', '#202020');
	$('.themePreviewBtn').css('color', 'white');
}



$(function() {
	themeChange();
	themeChangeAppear();
	themePreview();
});