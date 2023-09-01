// desperado

var openingBGM = new Audio('resources/audio/desperado/dOpening.mp3');
var gameBGM = new Audio('resources/audio/desperado/dBGM.mp3');

// Press Any Key 상황에서 키보드나 마우스 사용시 게임 시작되도록 하는 함수
function dStart() {
		$(document).keydown(() => {
			if ($('#dStmt').val() == 0) {
				dOpening();
			}
		});
		
		$('#dOpening').mousedown(() => {
			if ($('#dStmt').val() == 0) {
				dOpening();
			}
		});
		
}

// 게임 배경음악 관련된 동작을 하는 함수
function dBGMs() {
	if ($('#dStmt').val() == 0) {
		openingBGM.play();
	}
	
	else if ($('#dStmt').val() == 4) {
		let volume = 1;
		setInterval(() => {
			if (volume > 0) {
				volume = (volume - 0.1).toFixed(1);
				openingBGM.volume = volume;
			}
			if (volume == 0) {
				openingBGM.pause();
			}
		}, 300);
	}
	
		
	
	else if ($('#dStmt').val() == 5) {
		gameBGM.loop = true;
		gameBGM.play();
	}
	
	else if ($('#dStmt').val() == 9) {
		let volume = 1;
		setInterval(() => {
			if (volume > 0) {
				volume = (volume - 0.1).toFixed(1);
				gameBGM.volume = volume;
			}
			if (volume == 0) {
				gameBGM.pause();
			}
		}, 300);
	}
	
}

// Press Any Key 이후 진행
function dOpening() {
	dBGMs();
	$('#dOpening').css('opacity', '0%');
	$('#dStmt').val(1);
	setTimeout(() => {
		$('#dOpening').css('display', 'none');
		$('#Desperado').css('opacity', '100%');
		$('#dStartBtn').css('opacity', '100%');
		setTimeout(() => {
			$('#dStmt').val(2);
		}, 1000);
	}, 1500);
	
}

// Start Game 버튼을 눌렀을 때 동작하는 함수, 처음 누르면 게임 설명 / 두 번째 누르면 본 게임 시작
function dClickStart() {
	$('#dStartBtn').click(() => {
		if ($('#dStmt').val() == 2) {
			$('#dStmt').val(3);
			$('#Desperado').css('opacity', '0%');
			$('#dStartBtn').css('opacity', '0%');
			setTimeout(() => {
				dSetBottle();
				$('#dGun').css('opacity', '100%');
				$('#Desperado').css('display', 'none');
				$('#dGunBullet').css('opacity', '100%');
				$('#dGunBullet6').css('opacity', '100%');
				$('.dInstruction').css('opacity', '100%');
				setTimeout(() => {
					$('#dStmt').val(4);
					$('#dStartBtn').css('top', '50%');
					$('#dStartBtn').css('left', '50%');
					$('#dStartBtn').css('opacity', '100%');
				}, 2500);
			}, 2500);
		}
		
		else if ($('#dStmt').val() == 4) {
			dBGMs();
			$('#dStmt').val(5);
			$('.dInstruction').css('display', 'none');
			$('#dStartBtn').css('opacity', '0%');
			setTimeout(() => {
				$('#dStartBtn').css('display', 'none');
				dBGMs();
				setTimeout(() => {
					$('#dStmt').val(6);
					$('#dScore').css('opacity', '100%');
				}, 2000);
			}, 2000);
		}
	});
}

// 키보드를 눌렀을 때 총알이 발사되고, 뗐을 때 다음 총알을 발사할 수 있도록 dGunFireStmt의 값을 조절하는 함수
function dGunShot() {
	$(document).keydown((e) => {
		let gunFireSwitch = $('#dGunFireStmt').val();
		let gunBullet = $('#dGunBullet').val();
		if((e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 69 || e.keyCode == 82 || e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 70) && gunFireSwitch == 0 && gunBullet > 0 && $('#dSwitch').val() == 1) {
			gunBullet --;
			$('#dGunBullet').val(gunBullet);
			$('#dGunFireStmt').val(1);
			dHitBottle(Number($('#dBottleShot').val()), Number(e.keyCode));
			dGunFire();
		}
	});
	
	$(document).keyup((e) => {
		let gunFireSwitch = $('#dGunFireStmt').val();
		let gunBullet = $('#dGunBullet').val();
		if((e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 69 || e.keyCode == 82 || e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 70) && gunFireSwitch == 1 && gunBullet > 0 && $('#dBottleShot').val() < 6) {
			$('#dGunFireStmt').val(0);
		}
	});
}

// 총알 발사 시 사격음, 총구화염 동작하게 하는 함수
function dGunFire() {
	let gunFireNum = Math.round(Math.random()*2) + 1;
	let gunFireAngle = Math.random()*360;
	let gunFireFlash = Math.round(Math.random()*3) + 1;
	let gunFireSound = new Audio('resources/audio/desperado/dGunFire' + gunFireNum + '.mp3');
	gunFireSound.play();
	$('#dGun').attr('src', 'resources/img/game/desperado/dGunFire.gif');
	if (gunFireFlash >= 3) {
		$('#dFire').attr('src', 'resources/img/game/desperado/dFire.gif');
		$('#dFire').css('transform', 'translate(-50%, -50%) rotate( ' + gunFireAngle + 'deg )');
	}
}

// 총알을 재장전 하는 함수
function dGunReload() {
	let gunReloadSound = new Audio('resources/audio/desperado/dGunReload.MP3');
	gunReloadSound.play();
	$('#dGun').attr('src', 'resources/img/game/desperado/dGunReload.gif');
	setTimeout(() => {
		$('#dBottleShot').val(1);
		$('#dGunBullet').val(6);
		$('#dGunFireStmt').val(0);
	}, 1200);
}

// 울타리 위에 술병을 셋팅하고, 각각 술병에 부여된 알파벳을 보이게 하는 함수
function dSetBottle() {
	let bottleShape = 0;
	$('.dBottle').css('display', 'block');
	$('.dBottleKey').css('opacity', '100%');
	for (var i = 1; i <6; i++) {
		bottleShape = Math.round(Math.random()*2)+1;
		dBottleKey(i);
		$('#dBottle' + i).attr('src', 'resources/img/game/desperado/dBottle' + bottleShape + '.png');
		$('#dBottle'+i+'Shape').val(bottleShape);
	}
}

// 술병에 알파벳을 부여하는 함수
function dBottleKey(i) {
	let bKey = Math.round(Math.random() * 7) + 1;
	if (bKey == 1) {
		$('#dBottle' + i + 'Key').val('Q');
		$('#dBottle' + i + 'KeyNum').val(81);
	} else if (bKey == 2) {
		$('#dBottle' + i + 'Key').val('W');
		$('#dBottle' + i + 'KeyNum').val(87);
	} else if (bKey == 3) {
		$('#dBottle' + i + 'Key').val('E');
		$('#dBottle' + i + 'KeyNum').val(69);
	} else if (bKey == 4) {
		$('#dBottle' + i + 'Key').val('R');
		$('#dBottle' + i + 'KeyNum').val(82);
	} else if (bKey == 5) {
		$('#dBottle' + i + 'Key').val('A');
		$('#dBottle' + i + 'KeyNum').val(65);
	} else if (bKey == 6) {
		$('#dBottle' + i + 'Key').val('S');
		$('#dBottle' + i + 'KeyNum').val(83);
	} else if (bKey == 7) {
		$('#dBottle' + i + 'Key').val('D');
		$('#dBottle' + i + 'KeyNum').val(68);
	} else if (bKey == 8) {
		$('#dBottle' + i + 'Key').val('F');
		$('#dBottle' + i + 'KeyNum').val(70);
	}
} 

// 술병이 깨지는 애니메이션과 효과음이 출력되게 하고, dBottleShot의 값을 바꾸는 함수
function dShotBottle() {
	let bottleSound = Math.round(Math.random()*2)+1;
	const bottleBreak = new Audio('resources/audio/desperado/dBottleBreak' + bottleSound + '.mp3');
	let bottleNum = $('#dBottleShot').val();
	let bottleShape = $('#dBottle'+ bottleNum + 'Shape').val();
		$('#dBottle'+bottleNum).attr('src', 'resources/img/game/desperado/dBottle' + bottleShape + bottleNum + '.gif');
		$('#dBottle' + bottleNum + 'Key').css('opacity', '0%');
		bottleBreak.play();
		bottleNum ++;
		$('#dBottleShot').val(bottleNum);
}

// 술병에 알맞은 키를 눌렀을 때의 효과를 출력하는 함수
function dHitBottle(i, e) {
	let bottleKey = Number($('#dBottle' + i + 'KeyNum').val());
	let score = "";
	if (e == bottleKey) {
		dShotBottle();
		score = Number($('#dScore').val());
		score ++;
		$('#dScore').val(score);
	}
}

// 배경으로 지나가는 회전초의 움직임을 조절하는 함수
function dTumbleweedSpinAndMove() {
	let angle = 0;
	let twX = 800;
	let twY = 370;
	let twSwitch = 0;
	let twReturn = -1000;
	
	setInterval(() => {
		angle -= 8;
		if (angle == -360) {
			angle = 0;
		}
		$('#dTumbleweed').css('transform', 'translate(-50%, -50%) rotate( ' + angle + 'deg )');
		
		twX -= 5;
		$('#dTumbleweed').css('left', twX + 'px');
		$('#dShadow').css('left', twX + 'px');
		
		if (twX < twReturn) {
			twX = 800;
			twReturn = -(Math.round(Math.random() * 9000) + 1000);
			$('#dTumbleweed').css('left', twX + 'px');
			$('#dShadow').css('left', twX + 'px');
		}
		if (twSwitch == 0) {
			if (twY > 350) {
				twY -= 4;
				$('#dTumbleweed').css('top', twY + 'px');
			} else if (twY > 330) {
				twY -= 3;
				$('#dTumbleweed').css('top', twY + 'px');
			}  else if (twY > 320) {
				twY -= 1;
				$('#dTumbleweed').css('top', twY + 'px');
			} else if (twY <= 320 && twSwitch == 0) {
				twSwitch = 1;
			}
		} else if (twSwitch == 1) {
			if (twY <= 330) {
				twY += 1;
				$('#dTumbleweed').css('top', twY + 'px');
			} else if (twY <= 350) {
				twY += 3;
				$('#dTumbleweed').css('top', twY + 'px');
			}  else if (twY < 370) {
				twY += 4;
				$('#dTumbleweed').css('top', twY + 'px');
			} else if (twY >= 370 && twSwitch == 1) {
				twSwitch = 0;
			}
		} 
		
	}, 25);
	
}

// 본 게임 진행에 관련된 함수
function dGamePlay() {
	setInterval(() => {
		if ($('#dStmt').val() == 6) {
			$('#dStmt').val(7);
			let time = Number($('#dTimer').val());
			$('#d321').text('3');
			setTimeout(() => {
				$('#d321').text('2');
				setTimeout(() => {
					$('#d321').text('1');
					setTimeout(() => {
						$('#d321').text('');
						$('#dTimeNum').text(time);
						$('#dSwitch').val(1);
						dTimer(time);
					}, 1000);
				}, 1000);
			}, 1000);
		}
	}, 100);
}

// 타이머 및 게임 승패 여부를 결정하는 함수
function dTimer(t) {
	let time = Number(t);
	$('#dTimeBar').css('opacity', '100%');
	$('#dTimeBar').css('transition', 'width ' + t + 's linear');
	$('#dTimeBar').css('width', '0px');
	setInterval(() => {
		if (time > 0) {
			time = (time - 0.1).toFixed(1);
			$('#dTimeNum').text(time);
		}
	}, 100);
	setTimeout(() => {
		$('#dSwitch').val(0);
		$('#dStmt').val(8);
		$('#dTimeBar').css('transition', 'all 0s linear');
		$('#dTimeBar').css('opacity', '0%');
		$('#dTimeBar').css('width', '500px');
		$('#dTimeNum').text('');
		if ($('#dBottleShot').val() == 6) {
			$('#d321').text('Clear!');
			dSuccess();
			setTimeout(() => {
				$('#d321').text('');
			}, 2000);
		} else if ($('#dBottleShot').val() != 6) {
			$('#dStmt').val(9);
			dBGMs();
			if ($('#dLoginChk').val() == 0) {
				dFailNotLogin();
			}
				
			else if ($('#dLoginChk').val() == 1) {
				dFailLogin();
			}
		}
	}, time*1000);
}

// 성공하였을 경우 게임 진행시간을 줄이고, 다시 진행시키는 함수
function dSuccess() {
	let timer = Number($('#dTimer').val());
	dGunReload();
	if (timer > 1.2) {
		timer = (timer - 0.2).toFixed(1);
		$('#dTimer').val(timer);
		setTimeout(() => {
			$('#dStmt').val(6);
			dSetBottle();
		}, 2000);
	} else if (timer > 0.8) {
		timer = (timer - 0.1).toFixed(1);
		$('#dTimer').val(timer);
		setTimeout(() => {
			$('#dStmt').val(6);
			dSetBottle();
		}, 2000);
	} else if (timer == 0.8) {
		setTimeout(() => {
			$('#dStmt').val(6);
			dSetBottle();
		}, 2000);
	}
}

// 로그인 상태가 아닐 때 다시시작 버튼을 나타나게 하는 함수
function dFailNotLogin() {
	$('#d321').text('Fail');
	setInterval(() => {
		$('#dRestartBtn').css('display', 'block');
	}, 3000);
}

// 로그인 상태일 때 획득한 포인트를 DB에 반영시키는 함수
function dFailLogin() {
	let score = Number($('#dScore').val());
	$('#d321').text('Fail');
	setTimeout(() => {
		$('#dResult').text(score + ' 포인트를 획득하였습니다');
		setTimeout(() => {
			dPointGet(score);
		}, 3000);
	}, 2000);
}


function dPointGet(myPoint) {
	pageGoPost({
		url: "desperado.go",	//이동할 페이지
		   target: "_self",
		   vals: [				//전달할 인수들
		    ["myPoint", myPoint],
		]
	});
}


$(function() {
	stopBack();
	dStart();
	dClickStart();
	dGunShot();
	dTumbleweedSpinAndMove();
	dGamePlay();
});