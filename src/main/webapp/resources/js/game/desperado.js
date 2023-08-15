// desperado

function test() {
	$(document).keydown((e) => {
		let gunFireSwitch = $('#dGunFireStmt').val();
		let gunBullet = $('#dGunBullet').val();
		if((e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 69 || e.keyCode == 82 || e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 70) && gunFireSwitch == 0 && gunBullet > 0) {
			gunBullet --;
			$('#dGunBullet').val(gunBullet);
			$('#dGunFireStmt').val(1);
			hitBottle(Number($('#dBottleShot').val()), Number(e.keyCode));
			let bulletNum = Math.round(Math.random()*5) + 1;
			gunFire(bulletNum);
		}
	});
	
	$(document).keyup((e) => {
		let gunFireSwitch = $('#dGunFireStmt').val();
		let gunBullet = $('#dGunBullet').val();
		if((e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 69 || e.keyCode == 82 || e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 70) && gunFireSwitch == 1 && gunBullet > 0 && $('#dBottleShot').val() < 6) {
			$('#dGunFireStmt').val(0);
		} else if (((e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 69 || e.keyCode == 82 || e.keyCode == 65 || e.keyCode == 83 || e.keyCode == 68 || e.keyCode == 70) && gunFireSwitch == 1) && (gunBullet == 0 || $('#dBottleShot').val() == 6)) {
			$('#dGunFireStmt').val(2);
			setTimeout(() => {
			gunReload();
				setTimeout(() => {
					setBottle();
					$('#dBottleShot').val(1);
					$('#dGunBullet').val(6);
					$('#dGunFireStmt').val(0);
				}, 1200);
			}, 150);
		}
	});
}

function gunFire(i) {
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

function gunReload() {
	let gunReloadSound = new Audio('resources/audio/desperado/dGunReload.MP3');
	gunReloadSound.play();
	$('#dGun').attr('src', 'resources/img/game/desperado/dGunReload.gif');
}

function setBottle() {
	let bottleShape = 0;
	$('.dBottle').css('display', 'block');
	for (var i = 1; i <6; i++) {
		bottleShape = Math.round(Math.random()*2)+1;
		bottleKey(i);
		$('#dBottle' + i).attr('src', 'resources/img/game/desperado/dBottle' + bottleShape + '.png');
		$('#dBottle'+i+'Shape').val(bottleShape);
	}
}

function bottleKey(i) {
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

function shotBottle() {
	let bottleSound = Math.round(Math.random()*2)+1;
	const bottleBreak = new Audio('resources/audio/desperado/dBottleBreak' + bottleSound + '.mp3');
	let bottleNum = $('#dBottleShot').val();
	let bottleShape = $('#dBottle'+ bottleNum + 'Shape').val();
		$('#dBottle'+bottleNum).attr('src', 'resources/img/game/desperado/dBottle' + bottleShape + bottleNum + '.gif');
		bottleBreak.play();
		bottleNum ++;
		$('#dBottleShot').val(bottleNum);
}

function hitBottle(i, e) {
	let bottleKey = Number($('#dBottle' + i + 'KeyNum').val());
	if (e == bottleKey) {
		shotBottle();
	}
}




$(function() {
	test();
	setBottle();
});