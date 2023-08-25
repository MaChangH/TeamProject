// 회원가입 체크

function joinCheck() {
	let j_id = document.joinForm.tp_m_id;
	let j_pw = document.joinForm.tp_m_pw;
	let j_pwChk = document.joinForm.tp_m_pwChk;
	let j_nickname = document.joinForm.tp_m_nick;
	let j_name = document.joinForm.tp_m_name;
	let j_addr1 = document.joinForm.tp_m_addr1;
	let j_addr2 = document.joinForm.tp_m_addr2;
	let j_addr3 = document.joinForm.tp_m_addr3;
	let j_photo = document.joinForm.tp_m_photo;
	
	if (isEmpty(j_id)) {
		alert('아이디를 입력해주세요');
		j_id.focus();
		return false;
	} else if (atLeastLetter(j_id, 4)) {
		alert('아이디는 최소 4자입니다');
		j_id.value = "";
		j_id.focus();
		return false;
	} else if (containsAnotherID(j_id)) {
		alert('아이디는 영어 및 숫자만 사용 가능합니다');
		j_id.value = "";
		j_id.focus();
		return false;
	} else if ($('#joinIdChk').css('opacity') == 1) {
		alert('이미 가입된 아이디입니다');
		j_id.value = "";
		j_id.focus();
		return false;
	} else if (isEmpty(j_pw)) {
		alert('비밀번호를 입력해주세요');
		j_pw.focus();
		return false;
	} else if (atLeastLetter(j_pw, 4)) {
		alert('비밀번호는 최소 4자입니다');
		j_pw.value = "";
		j_pw.focus();
		return false;
	} else if (containsAnotherPW(j_pw)) {
		alert('비밀번호는 영어 및 숫자만 사용 가능합니다');
		j_pw.value = "";
		j_pw.focus();
		return false;
	} else if (notEqualPW(j_pw, j_pwChk)) {
		alert('비밀번호가 일치하지 않습니다');
		j_pwChk.value = "";
		j_pwChk.focus();
		return false;
	} else if (isEmpty(j_nickname)) {
		alert('닉네임을 입력해주세요');
		j_nickname.focus();
		return false;
	} else if (atLeastLetter(j_nickname, 2)) {
		alert('닉네임은 최소 2자입니다');
		j_nickname.value = "";
		j_nickname.focus();
		return false;
	} else if ($('#joinNicknameChk').css('opacity') == 1) {
		alert('이미 가입된 닉네임입니다');
		j_nickname.value = "";
		j_nickname.focus();
		return false;
	} else if (isEmpty(j_name)) {
		alert('이름을 입력해주세요');
		j_name.focus();
		return false;
	} else if (atLeastLetter(j_name, 2)) {
		alert('이름은 최소 2자입니다');
		j_name.value = "";
		j_name.focus();
		return false;
	} else if (isEmpty(j_addr1) || isEmpty(j_addr2) || isEmpty(j_addr3)) {
		alert('주소를 입력해주세요');
		j_addr1.value = "";
		j_addr2.value = "";
		j_addr3.value = "";
		return false;
	} else if (isEmpty(j_photo)) {
		alert('사진을 등록해주세요');
		return false;
	} else if (isNotType(j_photo, "png") && isNotType(j_photo, "jpg") && isNotType(j_photo, "jpeg") && isNotType(j_photo, "gif") && isNotType(j_photo, "PNG") && isNotType(j_photo, "JPG") && isNotType(j_photo, "JPEG") && isNotType(j_photo, "GIF")) {
		alert('확장자는 png, jpg, jpeg, gif만 등록 가능합니다');
		j_photo.value = "";
		return false;
	}
	let t = confirm('회원가입을 하시겠습니까?');
	if (t) {
		return true;
	} else {
		return false;
	}
}

// 정보수정 체크
function updateCheck() {
	let u_pw = document.updateForm.tp_m_pw;
	let u_pwChk = document.updateForm.tp_m_pwChk;
	let u_nickname = document.updateForm.tp_m_nick;
	let u_name = document.updateForm.tp_m_name;
	let u_addr1 = document.updateForm.tp_m_addr1;
	let u_addr2 = document.updateForm.tp_m_addr2;
	let u_addr3 = document.updateForm.tp_m_addr3;
	let u_photo = document.updateForm.tp_m_photo;
	
	if (isEmpty(u_pw)) {
		alert('비밀번호를 입력해주세요');
		u_pw.focus();
		return false;
	} else if (atLeastLetter(u_pw, 4)) {
		alert('비밀번호는 최소 4자입니다');
		u_pw.value = "";
		u_pw.focus();
		return false;
	} else if (containsAnotherPW(u_pw)) {
		alert('비밀번호는 영어 및 숫자만 사용 가능합니다');
		u_pw.value = "";
		u_pw.focus();
		return false;
	} else if (notEqualPW(u_pw, u_pwChk)) {
		alert('비밀번호가 일치하지 않습니다');
		u_pwChk.value = "";
		u_pwChk.focus();
		return false;
	} else if (isEmpty(u_nickname)) {
		alert('닉네임을 입력해주세요');
		u_nickname.focus();
		return false;
	} else if (atLeastLetter(u_nickname, 4)) {
		alert('닉네임은 최소 4자입니다');
		u_nickname.value = "";
		u_nickname.focus();
		return false;
	} else if (containsAnotherID(u_nickname)) {
		alert('닉네임은 영어 및 숫자만 사용 가능합니다');
		u_nickname.value = "";
		u_nickname.focus();
		return false;
	} else if ($('#updateNicknameChk').css('opacity') == 1) {
		alert('이미 가입된 닉네임입니다');
		u_nickname.value = "";
		u_nickname.focus();
		return false;
	} else if (isEmpty(u_name)) {
		alert('이름을 입력해주세요');
		u_name.focus();
		return false;
	} else if (atLeastLetter(u_name, 2)) {
		alert('이름은 최소 2자입니다');
		u_name.value = "";
		u_name.focus();
		return false;
	} else if (isEmpty(u_addr1) || isEmpty(u_addr2) || isEmpty(u_addr3)) {
		alert('주소를 입력해주세요');
		u_addr1.value = "";
		u_addr2.value = "";
		u_addr3.value = "";
		return false;
	}
	let t = confirm('회원가입을 하시겠습니까?');
	if (t) {
		return true;
	} else {
		return false;
	}
}

// 소환사명 빈칸방지
function riotSearchCheck(){
	let SNinput = $('#SN').val();
	if (SNinput == "") {
		alert('소환사명을 입력해주세요');
		SN.focus();
		return false;
	}}


//게시글 작성 체크
function boardWriteCheck(){
	let w_title = document.writeForm.tp_b_title;
	let w_txt = document.writeForm.tp_b_txt;
	
	if (isEmpty(w_title)) {
		alert('제목을 입력하세요');
		w_title.focus();
		return false;
	} else if (isEmpty(w_txt)) {
		alert('내용을 입력하세요');
		w_txt.focus();
		return false;
	}
}

//게시글 수정 체크
function boardUpdateCheck(){
	let u_title = document.updateForm.tp_b_title;
	let u_txt = document.updateForm.tp_b_txt;
	
	if (isEmpty(u_title)) {
		alert('제목을 입력하세요');
		u_title.focus();
		return false;
	} else if (isEmpty(u_txt)) {
		alert('내용을 입력하세요');
		u_txt.focus();
		return false;
	}
}

//////////////////////////////////////////////////////////////////

function pointCheck(myPoint) {
	let betPoint = $('#pointBet').val();
	if (betPoint > myPoint) {
		$('#bJStmt').val(404);
		alert('보유 포인트보다 많이 베팅할 수 없습니다');
		$('#pointBet').val(0);
		return false;
	} else if(betPoint != 0) {
		$('#isBet').val(1);
		$('#bJStmt').val(0);
	} else {
		$('#bJStmt').val(0);
	}
}



