// projectjQuery


// 알림 내용이 alert으로 나오게
function notice() {
		let R = $('#result').val();
		if (R != "") {
			alert(R);
			$('#result').val("");
		}
}

// 회원가입/정보수정 할 때 주소 입력하게
function searchAddr() {
	$('#joinAddr1, #joinAddr2').click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('#joinAddr1').val(data.zonecode);
				$('#joinAddr2').val(data.roadAddress)
			}
		}).open();
	});
}

// 이미 있는 아이디로 회원가입 하는것 방지
function idCheck() {
	$('#joinId').keyup(function() {
		let tp_m_id = $('#joinId').val();
		$.getJSON("member.id.check?tp_m_id=" + tp_m_id, function(idChk) {
			if (idChk.member[0] == null) {
				$('#joinIdChk').css('opacity', '0');
			} else {
				$('#joinIdChk').css('opacity', '1');
			}
		});
	});
}

// 이미 있는 닉네임으로 회원가입 하는것 방지
function nicknameCheck() {
	$('#joinNick').keyup(function() {
		let tp_m_nickname = $('#joinNick').val();
		$.getJSON("member.nickname.check?tp_m_nick=" + tp_m_nickname, function(nicknameChk) {
			if (nicknameChk.member[0] == null) {
				$('#joinNicknameChk').css('opacity', '0');
			} else {
				$('#joinNicknameChk').css('opacity', '1');
			}
		});
	});
	
	$('#updateNick').keyup(function() {
		let tp_m_nickname = $('#updateNick').val();
		let tp_m_nicknameNow = $('#updateNicknameNow').val();
		$.getJSON("member.nickname.check?tp_m_nick=" + tp_m_nickname, function(updateNicknameChk) {
			if (updateNicknameChk.member[0] == null || tp_m_nickname == tp_m_nicknameNow) {
				$('#updateNicknameChk').css('opacity', '0');
			} else if(updateNicknameChk.member[0] != null) {
				$('#updateNicknameChk').css('opacity', '1');
			}
		});
	});
}

// 공지 체크 시 input 벨류값 0에서 1로 변경
// 해당 게시글이 공지사항인지 아닌지 확인
function noticeChk() {
	$('#noticeChk').change(function() {
		if ($('#noticeChk').is(':checked')) {
			$('#isNotice').val(1);
		} else {
			$('#isNotice').val(0);
		}
	});
}

function noticeUpdateChk() {
	$('#updateNotice').change(function() {
		if ($('#updateNotice').is(':checked')) {
			$('#updateNoticeResult').val(1);
		} else {
			$('#updateNoticeResult').val(0);
		}
	});
}

function importantChk() {
	$('#importantChk').change(function() {
		if ($('#importantChk').is(':checked')) {
			$('#isImportant').val(1);
		} else {
			$('#isImportant').val(0);
		}
	});
}

function importantUpdateChk() {
	$('#updateImp').change(function() {
		if ($('#updateImp').is(':checked')) {
			$('#updateImpResult').val(1);
		} else {
			$('#updateImpResult').val(0);
		}
	});
}

// 회원정보 창에서 PW보기에 마우스를 올리면 PW의 input type을 변경
function showPW() {
	$('#seePW').mouseenter(() => {
		$('#infoPW').removeAttr("type");
	});
	
	$('#seePW').mouseleave(() => {
		$('#infoPW').attr("type", "password");
	});
}


// 뒤로가기 막기
function stopBack() {
	// 스택 추가
	history.pushState(null, null, 'game.go'); 
	

	// 뒤로가기 이벤트감지 -> 게임게시판으로 이동
	window.onpopstate = function() { 
		history.go(1); 
	}
}

// 로그인/비로그인 상태일 때 왼쪽 배너의 높이 조절
function leftBannerTop() {
	let login = $('#loginMember').val();
	if (login == "") {
		$('#indexLeftBannerTbl').css('top', "100px");
	} else {
		$('#indexLeftBannerTbl').css('top', "350px");
	}
}

// 게시글의 작성자 닉네임을 클릭하면 해당 작성자의 사진이 나오고, 닫기를 클릭하면 창이 사라지도록
function writerImgAppear() {
	$('#boardViewWriter').click(() => {
		if ($('#boardViewWriterImg').css('opacity') == 0) {
			$('#boardViewWriterImg').css('display', 'block');
			setTimeout(() => {
				$('#boardViewWriterImg').css('opacity', '100%');
			}, 10);
		}
	});
	
	$('#boardViewWriterImgClose').click(() => {
		if ($('#boardViewWriterImg').css('opacity') == 1) {
			$('#boardViewWriterImg').css('opacity', '0%');
			setTimeout(() => {
				$('#boardViewWriterImg').css('display', 'none');
			}, 300);
		}
	});
}

// 메뉴 눌러서 페이지로 이동하면, 해당 메뉴 버튼 색 바뀌게 하는 함수
function menuColorChange() {
	let menu = $('#currentPage').val();
	if (menu == 'board') {
		$('#menu1').attr('class', 'indexMenuA themeColor themeNotice');
		$('#menu1').css('font-weight', '900');
	} else if (menu == 'notice') {
		$('#menu2').attr('class', 'indexMenuA themeColor themeNotice');
		$('#menu2').css('font-weight', '900');
	} else if (menu == 'riot') {
		$('#menu3').attr('class', 'indexMenuA themeColor themeNotice');
		$('#menu3').css('font-weight', '900');
	} else if (menu == 'game') {
		$('#menu4').attr('class', 'indexMenuA themeColor themeNotice');
		$('#menu4').css('font-weight', '900');
	} else if (menu == 'member') {
		$('#menu5').attr('class', 'indexMenuA themeColor themeNotice');
		$('#menu5').css('font-weight', '900');
	}
	colorChange();
}

// 새로고침 될 때 마다 랜덤 광고가 출력되게, 닫기 누르면 광고 없어지고 보기 누르면 다시 나오게
function randomAd() {
	let num = Math.round(Math.random() * 5) + 1;
	$('#c').attr('src', 'resources/img/c/c' + num + '.webp');
	
	$('#cClose').click(function() {
		$('#c').removeAttr('src');
		$('#cClosd').css('display', 'none');
		$('#cOpen').css('display', 'block');
	});
	
	$('#cOpen').click(function() {
		$('#c').removeAttr('src');
		num = Math.round(Math.random() * 5) + 1;
		$('#c').attr('src', 'resources/img/c/c' + num + '.webp');
		$('#cClosd').css('display', 'block');
		$('#cOpen').css('display', 'none');
	});
}

// 검색 기준 변경하면 placeholder 변경되게
function changePlaceholder() {
	let search = $('.searchSelect').val();
	if (search == 1) {
		$('.searchInput').attr('placeholder', '제목 검색');
	} else if (search == 2) {
		$('.searchInput').attr('placeholder', '내용 검색');
	} else if (search == 3) {
		$('.searchInput').attr('placeholder', '닉네임 검색');
	}
	
	$('.searchSelect').change(function() {
		let searchChange = $('.searchSelect').val();
		if (searchChange == 1) {
			$('.searchInput').attr('placeholder', '제목 검색');
		} else if (searchChange == 2) {
			$('.searchInput').attr('placeholder', '내용 검색');
		} else if (searchChange == 3) {
			$('.searchInput').attr('placeholder', '닉네임 검색');
		}
	});
}


// 이미지 미리보기
function photoPreview() {
	$('.imgUpload').change(function() {
		
		var input = document.getElementById("imgUpload");

		var fReader = new FileReader();

		var img = document.getElementById("photoPreview");
		
			
			img.src = 'resources/img/photoPreview.png';
			
			
			fReader.readAsDataURL(input.files[0]);
			
			fReader.onloadend = function(event){
				
				img.src = event.target.result;
		}
	});
}

// 이미지 수정 미리보기
function photoUpdatePreview() {
	$('.imgUpdate').change(function() {
		
		var input = document.getElementById("imgUpdate");
		
		var fReader = new FileReader();
		
		var img = document.getElementById("boardUpdateImg");
		
		
		img.src = 'resources/img/' + $('#imgUpdateInput').val();
		
		
		fReader.readAsDataURL(input.files[0]);
		
		fReader.onloadend = function(event){
			
			img.src = event.target.result;
		}
	});
}

// 게시판 제목 마우스 올리면 이미지 보이게
function boardImgPreview() {
	$('.boardTr').mouseenter(function(e) {
		let id = $(this).attr('id');
		let photo = $('#'+id+'Img').val();
		let ix = e.pageX;
		let iy = e.pageY;
		
		if (photo != '') {
			$('#boardImgPreview').attr('src', 'resources/img/' + $('#'+id+'Img').val());
			$('#boardImgPreviewTbl').css('top', iy + "px");
			$('#boardImgPreviewTbl').css('left', ix + "px");
			$('#boardImgPreviewTbl').css('opacity', '100%');
		} else {
			$('#boardImgPreview').attr('src', 'resources/img/photoPreview.png');
		}
	});
	
	$('.boardTr').mouseleave(function() {
		$('#boardImgPreview').attr('src', 'resources/img/photoPreview.png');
		$('#boardImgPreviewTbl').css('opacity', '0%');
		$('#boardImgPreviewTbl').css('top', "-100px");
		$('#boardImgPreviewTbl').css('left',"-100px");
	})
}

$(function () {
	notice();
	leftBannerTop();
	searchAddr();
	idCheck();
	nicknameCheck();
	showPW();
	noticeChk();
	noticeUpdateChk();
	importantChk();
	importantUpdateChk();
	importantChk();
	writerImgAppear();
	menuColorChange();
	randomAd();
	changePlaceholder();
	photoPreview();
	photoUpdatePreview();
	boardImgPreview();
});