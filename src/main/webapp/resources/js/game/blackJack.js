//blackJack.js

//	정상적으로 게임시작 버튼을 클릭함
function bJStart() {
	$('.bJStartBtn').click(function() {
		if ($('#bJStmt').val() == 0 && $('#bJSwitch').val() == 0) {
			$('#bJSwitch').val(10);
			$('.bJBetBtn').css('display', 'none');
			bjStart();
		}
	});
}

//	블랙잭 게임 시작
function bjStart() {
		let bjs = $('#bJStmt').val(); // 게임의 상태를 나타내는 수, 숫자에 따라서 행동이 달라짐
		let mn = $('#bJMyCard').val(); // 내 카드가 몇 장인지
		let on = $('#bJOpCard').val(); // 상대 카드가 몇 장인지
		let cn = $('#bJCardNum').val(); // 총 카드가 몇 장인지
		if (bjs == 0) { //시작, 규칙 버튼 사라짐
			$('#bJStmt').val(1);
			$('.bJBtn').css('opacity', '0%');
			$('#bJMySum').css('opacity', '100%');
			setTimeout(() => {
				$('.bJBtn').css('display', 'none');
				$('#bJMySum').css('display', 'block');
				$('#bJCardDeck').css('display', 'flex');
				setTimeout(() => {
					$('#bJCardDeck').css('opacity', '100%');
					setTimeout(() => {	 //나와 상대에게 번갈아가면서 1장씩 카드를 줌
						giveMeCard(mn, cn);
						mn ++;
						cn ++;
						$('#bJCardNum').val(cn);
						$('#bJMyCard').val(mn);
						setTimeout(() => {
							giveOpCardBack(on, cn);		// 상대의 첫 카드는 뒷면으로
							on ++;
							cn ++;
							$('#bJCardNum').val(cn);
							$('#bJOpCard').val(on);
							setTimeout(() => {
								giveMeCard(mn, cn);
								mn ++;
								cn ++;
								$('#bJCardNum').val(cn);
								$('#bJMyCard').val(mn);
								setTimeout(() => {
									giveOpCard(on, cn);
									on ++;
									cn ++;
									$('#bJCardNum').val(cn);
									$('#bJOpCard').val(on);
									setTimeout(() => {
										$('#bJTurn').val(1);
										$('#bJSwitch').val(0);
										$('#bJStandBtn').css('display', 'block');
										setTimeout(() => {
											$('#bJStandBtn').css('opacity', '100%');
											if ($('#bJMySum').val() == 21 && $('#bJOpSum').val() != 21) {	// 상대가 블랙잭이 아닐때, 내가 블랙잭이면 나의 승리
												standBtnDisappear();
												$('#bJTurn').val(5);
												setTimeout(() => {
													bJMyBlackJack();
												}, 500);
											}
											if ($('#bJOpSum').val() == 21) {	//	상대가 블랙잭이면 상대의 승리
												standBtnDisappear();
												$('#bJTurn').val(5);
												setTimeout(() => {
													$('#oc1').css('width', '0px');
													setTimeout(() => {
														$('#oc1').removeClass('bJCardBack');
														$('#oc1').css('width', '75px');
														setTimeout(() => {
															$('#oc1').append($('#cn2').val());
															setTimeout(() => {
																bJOpBlackJack();
															}, 1000);
														}, 250);
													}, 500);
												}, 500);
											}
										}, 100);
									}, 500);
								}, 500);
							}, 500);
						}, 500);
					}, 500);
				}, 100);
			}, 500);
		}
}

//	카드 분배(나)
function giveMeCard(num1, num2) {
	const cardDraw = new Audio('resources/audio/blackJack/bjCardDraw.mp3');
	let numMark = $('#cn'+num2).val();
	let mySum = Number($('#bJMySum').val());
	let myAce = Number($('#bJMyAce').val());
	$('#bJSpace').append('<div id="mc' + num1 + '" class="bJCard" style="position: absolute; top: 230px; left: 10%;">' + numMark + '</div>');
	$('#mc' + num1).css('transition', 'all 0.5s ease');
	let thisMark = numMark.substr(0, 1); //카드의 마크
	if (thisMark == '◆' || thisMark == '♥') {
		$('#mc' + num1).css('color', 'red');
	}
	cardDraw.play();
	setTimeout(() => {
		$('#mc' + num1).css('top', '400px');
		$('#mc' + num1).css('left', num1*10 + '%');
		let thisNum = numMark.substr(1); //카드의 숫자
		if (thisNum == 'J' || thisNum == 'Q' || thisNum == 'K') {
			thisNum = 10;
		}
		if (thisNum == 'A') {	//카드가 A였을 때
			if (mySum <= 10) {	// 현재 내 숫자의 합이 10이하면 A를 11로
				myAce ++;
				$('#bJMyAce').val(myAce);
				thisNum = 11;
			} else {		// 현재 내 숫자의 합이 10보다 크면 A를 1로
				thisNum = 1;
			}
		}
		mySum += Number(thisNum);
		if (mySum > 21 && myAce > 0) {	// 11점인 A가 이미 있는 상태에서, 다른 카드로 인해 21점을 넘어간 경우 그 A를 1점짜리로 변경
			myAce --;
			$('#bJMyAce').val(myAce);
			mySum -= 10;
		}
		setTimeout(() => {
			$('#bJMySum').val(mySum);
			setTimeout(() => {
				if ($('#bJMySum').val() > 21) {
					setTimeout(() => {
						standBtnDisappear();
						bJLose();
					}, 500);
				}
			}, 100);
		}, 100);
	}, 100);
}

//카드 분배(딜러)
function giveOpCard(num1, num2) {
	const cardDraw = new Audio('resources/audio/blackJack/bjCardDraw.mp3');
	let numMark = $('#cn'+num2).val();
	let opSum = Number($('#bJOpSum').val());
	let opAce = Number($('#bJOpAce').val());
	$('#bJSpace').append('<div id="oc' + num1 + '" class="bJCard" style="position: absolute; top: 230px; left: 10%;">' + numMark + '</div>');
	$('#oc' + num1).css('transition', 'all 0.5s ease');
	let thisMark = numMark.substr(0, 1);
	if (thisMark == '◆' || thisMark == '♥') {
		$('#oc' + num1).css('color', 'red');
	}
	cardDraw.play();
	setTimeout(() => {
		$('#oc' + num1).css('top', '100px');
		$('#oc' + num1).css('left', 100 - (num1*10) + '%');
		let thisNum = numMark.substr(1);
		if (thisNum == 'J' || thisNum == 'Q' || thisNum == 'K') {
			thisNum = 10;
		}
		if (thisNum == 'A') {
			if (opSum <= 10) {
				opAce ++;
				$('#bJOpAce').val(opAce);
				thisNum = 11;
			} else {
				thisNum = 1;
			}
		}
		opSum += Number(thisNum);
		if (opSum > 21 && opAce > 0) {
			opAce --;
			$('#bJOpAce').val(opAce);
			opSum -= 10;
		}
		setTimeout(() => {
			$('#bJOpSum').val(opSum);
		}, 100);
	}, 100);
}

//카드 분배(딜러 - 첫카드 뒷면)
function giveOpCardBack(num1, num2) {
	const cardDraw = new Audio('resources/audio/blackJack/bjCardDraw.mp3');
	let numMark = $('#cn'+num2).val();
	let opSum = Number($('#bJOpSum').val());
	let opAce = Number($('#bJOpAce').val());
	$('#bJSpace').append('<div id="oc' + num1 + '" class="bJCard bJCardBack" style="position: absolute; top: 230px; left: 10%;"></div>');
	$('#oc' + num1).css('transition', 'all 0.5s ease');
	let thisMark = numMark.substr(0, 1);
	if (thisMark == '◆' || thisMark == '♥') {
		$('#oc' + num1).css('color', 'red');
	}
	cardDraw.play();
	setTimeout(() => {
		$('#oc' + num1).css('top', '100px');
		$('#oc' + num1).css('left', 100 - (num1*10) + '%');
		let thisNum = numMark.substr(1);
		if (thisNum == 'J' || thisNum == 'Q' || thisNum == 'K') {
			thisNum = 10;
		}
		if (thisNum == 'A') {
			if (opSum <= 10) {
				opAce ++;
				$('#bJOpAce').val(opAce);
				thisNum = 11;
			} else {
				thisNum = 1;
			}
		}
		opSum += Number(thisNum);
		if (opSum > 21 && opAce > 0) {
			opAce --;
			$('#bJOpAce').val(opAce);
			opSum -= 10;
		}
		$('#bJOpSum').val(opSum);
	}, 100);
}

//	블랙잭 규칙판 보이기/숨기기
function bJRule() {
	$('#bJRuleBtn').click(function() {
		let bjs = $('#bJStmt').val();
		if (bjs == 0) {
			bjs = 100;
			$('#bJStmt').val(bjs);
			$('#bJRuleTbl').css('display', 'block');
			setTimeout(() => {
				$('#bJRuleTbl').css('opacity', '100%');
			}, 100);
		}
	});
	$('#bJRuleCloseBtn').click(function() {
		let bjs = $('#bJStmt').val();
		if (bjs == 100) {
			bjs = 0;
			$('#bJStmt').val(bjs);
			$('#bJRuleTbl').css('opacity', '0%');
			setTimeout(() => {
				$('#bJRuleTbl').css('display', 'none');
			}, 500);
		}
	});
}

//	카드뭉치 눌렀을 때 카드 뽑고 높이 낮아지게
function bJCardDeck() {
	let i = 25;		// 처음 카드덱 높이
	let h = 240;
	$('#bJCardDeck').click(function() {
		let turn = $('#bJTurn').val();
		if (i > 1 && turn == 1) {
			let mn = $('#bJMyCard').val();
			let cn = $('#bJCardNum').val();
			i --;
			h += 0.5;
			$('#bJCardDeck').css("border-bottom", i+"px solid black");
			$('#bJCardDeck').css("top", h+"px");
			giveMeCard(mn, cn);
			mn ++;
			cn ++;
			$('#bJCardNum').val(cn);
			$('#bJMyCard').val(mn);
		}
		if (i == 1 && turn == 1) {
			i --;
			$('#bJCardDeck').css("display", "none");
		}
	});
}

//	딜러가 숫자가 17이상이 될때까지 드로우
function bJOpDraw() {
	setInterval(() => {
		if ($('#bJSwitch').val() == 1) {	// 스위치는 버그 발생을 막기 위해 넣은 값, 정해진 수에 따라 함수가 작동하거나 멈춤
			let on = $('#bJOpCard').val();
			let cn = $('#bJCardNum').val();
			if ($('#bJSwitch').val() == 1 && $('#bJOpSum').val() < 17) {	// 스위치가 1이고, 카드 합계가 17보다 작으면 카드를 드로우함
				$('#bJSwitch').val(2);	// 스위치를 2로 변경하면서 Interval로 인한 반복을 방지함
				giveOpCard(on, cn);
				on ++;
				cn ++;
				$('#bJOpCard').val(on);
				$('#bJCardNum').val(cn);
				setTimeout(() => {
					$('#bJSwitch').val(1);	// 카드 드로우가 끝나면 다시 스위치를 1로 변경함
				}, 700);
			} else {
				$('#bJTurn').val(4);	// bJTurn은 게임의 진행상황을 통제하기 위한 변수, 스위치가 1이고 딜러의 카드의 합이 17 이상이면 4로 값 변경
				$('#bJSwitch').val(0);	
			}
		} if ($('#bJTurn').val() == 4) {	// bJTurn이 4가 되면 결과를 출력
			if (Number($('#bJMySum').val()) > Number($('#bJOpSum').val()) || Number($('#bJOpSum').val()) > 21) {
				bJWin();
			} else if (Number($('#bJMySum').val()) <= Number($('#bJOpSum').val()) && Number($('#bJOpSum').val()) <= 21) {
				bJLose();
			}
		}
	}, 50);
}

//	스탠드 버튼 누르면 딜러의 턴으로 넘어가게
function bJStand() {
	$('#bJStandBtn').click(function() {
		let turn = $('#bJTurn').val();
		if (turn == 1) {	// bJTurn이 1일 때(나의 차례) 클릭하면 발동
			$('#bJTurn').val(10);	// bJTurn을 10으로 변경하면서, 버튼을 연속으로 클릭했을 때 발생할 버그를 방지함
			$('#bJStandBtn').css('opacity', '0%');
			setTimeout(() => {
				$('#bJStandBtn').css('display', 'none');
				$('#oc1').css('width', '0px');	// 뒷면이었던 딜러의 카드를 뒤집음
				setTimeout(() => {
					$('#oc1').removeClass('bJCardBack');	// 카드가 앞면이 되기 때문에 체크무늬를 없애야함
					$('#oc1').css('width', '75px');		// 카드가 앞면이 됨
					$('#bJOpSum').css('display', 'block');
					setTimeout(() => {
						$('#oc1').append($('#cn2').val());	// 앞면이 된 카드에 부여된 마크와 숫자가 출력되게 함
						$('#bJOpSum').css('opacity', '100%');
						setTimeout(() => {
							$('#bJTurn').val(2);
							$('#bJSwitch').val(1);
						}, 1000);
					}, 250);
				}, 500);
			}, 500);
		}
	});
}

//	승리
function bJWin() {
	$('#bJTurn').val(5);
	$('#bJMyWin').css('display', 'block');
	$('#bJMyWin').css('opacity', '100%');
	let myPoint = Number($('#myPoint').val());
	if ($('#isBet').val() == 1) {
		$('#bJPointGet').css('display', 'block');
		$('#bJPointGet').css('opacity', '100%');
		$('#bJGet').val(Number($('#pointBet').val()));
		myPoint = Number($('#myPoint').val());
		myPoint += Number($('#pointBet').val());
		$('#myPoint').val(myPoint);
	}
	const win = new Audio('resources/audio/blackJack/bJWin.mp3');
	win.play();
	setTimeout(() => {
		bJPointGetLoss(myPoint);
	}, 2000);
}

//	패배
function bJLose() {
	$('#bJTurn').val(5);
	$('#bJOpWin').css('display', 'block');
	$('#bJOpWin').css('opacity', '100%');
	let myPoint = Number($('#myPoint').val());
	if ($('#isBet').val() == 1) {
		myPoint = Number($('#myPoint').val());
		myPoint -= Number($('#pointBet').val());
		$('#myPoint').val(myPoint);
	}
	const lose = new Audio('resources/audio/blackJack/bJLose.MP3');
	lose.play();
	setTimeout(() => {
		bJPointGetLoss(myPoint);
	}, 1500);
}

//	블랙잭 승리
function bJMyBlackJack() {
	$('#bJTurn').val(5);
	$('#bJMyBlackJack').css('display', 'block');
	$('#bJMyBlackJack').css('opacity', '100%');
	let myPoint = Number($('#myPoint').val());
	if ($('#isBet').val() == 1) {
		$('#bJPointGet').css('display', 'block');
		$('#bJPointGet').css('opacity', '100%');
		$('#bJGet').val(Number($('#pointBet').val()) * 1.5);
		myPoint = Number($('#myPoint').val());
		myPoint += Number($('#pointBet').val() * 1.5);
		$('#myPoint').val(myPoint);
	}
	const win = new Audio('resources/audio/blackJack/bJBJWin.mp3');
	win.play();
	setTimeout(() => {
		bJPointGetLoss(myPoint);
	}, 2000);
}

//	블랙잭 패배
function bJOpBlackJack() {
	$('#bJTurn').val(5);
	$('#bJOpBlackJack').css('display', 'block');
	$('#bJOpBlackJack').css('opacity', '100%');
	let myPoint = Number($('#myPoint').val());
	if ($('#isBet').val() == 1) {
		myPoint = Number($('#myPoint').val());
		myPoint -= Number($('#pointBet').val());
		$('#myPoint').val(myPoint);
	}
	const lose = new Audio('resources/audio/blackJack/bJLose.MP3');
	lose.play();
	setTimeout(() => {
		bJPointGetLoss(myPoint);
	}, 1500);
}

//	스탠드 버튼 사라짐
function standBtnDisappear() {
	$('#bJStandBtn').css('opacity', '0%');
	setTimeout(() => {
		$('#bJStandBtn').css('display', 'none');
	}, 500);
}


//	포인트 베팅하기
function bJPointBet() {
	// 10 포인트
	$('#bJBet10').click(() => {
		let point = Number($('#pointBet').val());
		point += 10;
		$('#pointBet').val(point);
	});
	
	// 50 포인트
	$('#bJBet50').click(() => {
		let point = Number($('#pointBet').val());
		point += 50;
		$('#pointBet').val(point);
	});
	
	// 100 포인트
	$('#bJBet100').click(() => {
		let point = Number($('#pointBet').val());
		point += 100;
		$('#pointBet').val(point);
	});
	
	// 초기화
	$('#bJBetReset').click(() => {
		let point = 0;
		$('#pointBet').val(point);
	});
}

//	베팅한 점수 반영
function bJPointGetLoss(myPoint) {
	pageGoPost({
		url: "blackJack.go",	//이동할 페이지
		   target: "_self",
		   vals: [				//전달할 인수들
		    ["myPoint", myPoint],
		]
	});
}



$(function() {
	stopBack();
	bJStart();
	bJRule();
	bJCardDeck();
	bJOpDraw();
	bJStand();
	bJPointBet();
});