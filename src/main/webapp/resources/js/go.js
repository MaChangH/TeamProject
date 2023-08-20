
// 홈으로 이동하기
function homeGo () {
	location.href = "home.go";
}

//BOARD로 이동하기
function boardGo () {
	location.href = "board.go";
}


// 게시글 클릭시 전체 페이지 보여주기
function boardViewGo(tp_b_no) {
	location.href = "board.view?tp_b_no=" + tp_b_no;
}

// 게시글 삭제하기
function boardDeleteGo(tp_b_no, tp_b_writer) {
	if (confirm("진짜 삭제 하시겠습니까?")) {
		pageGoPost({
			url: "board.delete",	//이동할 페이지
			   target: "_self",
			   vals: [				//전달할 인수들
			    ["tp_b_no", tp_b_no],
			    ["tp_b_writer", tp_b_writer]
			]
		});
	}
}

// 게시글 수정하기
function boardUpdateGo(tp_b_no, tp_b_writer) {
	pageGoPost({
		url: "board.update.go",	//이동할 페이지
		   target: "_self",
		   vals: [				//전달할 인수들
		    ["tp_b_no", tp_b_no],
		    ["tp_b_writer", tp_b_writer]
		]
	});
}

// 게시글에 추천하기
function likeGo() {
	location.href = "board.like.go";
}

// 댓글 삭제하기
function replyDeleteGo(tp_r_no) {
	if (confirm("진짜 삭제 하시겠습니까?")) {
		pageGoPost({
			url: "reply.delete",	//이동할 페이지
			   target: "_self",
			   vals: [				//전달할 인수들
			    ["tp_r_no", tp_r_no],
			]
		});
	}
}

// 로그인 및 회원가입 하러하기
function loginGo() {
	location.href = "member.login.go";
}

// 회원 가입하기
function goJoin() {
	location.href = "member.join.go";
}

// 로그아웃하기
function logout() {
	var ok = confirm("로그아웃 하시겠습니까?");
	if (ok) {
		location.href = "member.logout";
	}
}

//설정 보러가기
function settingGo() {
	location.href = "member.setting";
}

// 회원 정보 보러가기
function infoGo() {
	location.href = "member.infoCheck.go";
}

// 회원 탈퇴하기
function byeGo() {
	if (confirm("정말 탈퇴하시겠습니까?")) {
		location.href = "member.bye";
	}
}


// js로 post요청 보내는 함수
function pageGoPost(d){
	var insdoc = "";
    
	for (var i = 0; i < d.vals.length; i++) {
	  insdoc+= "<input type='hidden' name='"+ d.vals[i][0] +"' value='"+ d.vals[i][1] +"'>";
	}
    
	var goform = $("<form>", {
	  method: "post",
	  action: d.url,
	  target: d.target,
	  html: insdoc
	}).appendTo("body");
    
	goform.submit();
}



///////////////// 게임 ///////////////////////

// 블랙잭 하러가기
function blackJackGo() {
	pageGoPost({
		url: "blackJack.go",	//이동할 페이지
		   target: "_self",
		   vals: [				//전달할 인수들
		]
	});
}

// 데스페라도 하러가기
function desperadoGo() {
	pageGoPost({
		url: "desperado.go",	//이동할 페이지
		   target: "_self",
		   vals: [				//전달할 인수들
		]
	});
}


