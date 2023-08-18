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
	setInterval(() => {
		if ($('#noticeChk').is(':checked')) {
			$('#isNotice').val(1);
		} else {
			$('#isNotice').val(0);
		}
		
		if ($('#updateNotice').is(':checked')) {
			$('#updateNoticeResult').val(1);
		} else {
			$('#updateNoticeResult').val(0);
		}
		
	}, 1);
}


function importantChk() {
	setInterval(() => {
		if ($('#importantChk').is(':checked')) {
			$('#isImportant').val(1);
		} else {
			$('#isImportant').val(0);
		}
		
		if ($('#updateImp').is(':checked')) {
			$('#updateImpResult').val(1);
		} else {
			$('#updateImpResult').val(0);
		}
	}, 1);
}


// 텍스트 에어리어의 height가 엔터키를 입력하면 자동으로 늘어나게

function textareaScroll() {
	const DEFAULT_HEIGHT = 180;
	

	const $textarea = document.querySelector('.textarea');
	
	$textarea.oninput = (event) => {
		const $target = event.target;

		$target.style.height = 0;
		$target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
	};
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

// 인터넷 창의 크기를 조절했을 때, 요소들의 위치를 조절하기 => 조절하지 않으면 창을 작게 했을 때 ContentPage와 겹치는 문제 발생
function movePosition () {
	$(window).resize(function () {
		let wWidth = $(window).width();
		if (wWidth < 1200) {
			$('#indexRightBannerTbl').css('left', '1020px');
			$('.indexTitleMenu').css('left', '600px');
		} else {
			$('#indexRightBannerTbl').css('left', '85%');
			$('.indexTitleMenu').css('left', '50%');
		}
	});
}

// 처음 인터넷 창을 켰을 때 요소들의 위치
function position () {
	let wWidth = $(window).width();
	if (wWidth < 1200) {
		$('#indexRightBannerTbl').css('left', '1020px');
		$('.indexTitleMenu').css('left', '600px');
	} else {
		$('#indexRightBannerTbl').css('left', '85%');
		$('.indexTitleMenu').css('left', '50%');
	}
}


$(function () {
	notice();
	position();
	movePosition();
	searchAddr();
	idCheck();
	nicknameCheck();
	noticeChk();
	importantChk();
	textareaScroll();
	replyareaScroll();
});