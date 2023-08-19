// replyUpdate.js

function replyUpdate(no) {
		let txt = $('#replyText'+no).val();
		$('#replyTextarea'+no).css('display', 'block');
		$('#replyTextarea'+no).removeAttr('readonly');
		$('#replyText'+no).css('display', 'none');
		$('#replyEdited'+no).css('display', 'none');
		$('#replyTextarea'+no).focus();
		$('.replyUpdateBtn').css('display', 'none');
		$('.replyDeleteBtn').css('display', 'none');
		$('#replyUpdateDoneBtn'+no).css('display', 'inline');
		$('#replyUpdateCancelBtn'+no).css('display', 'inline');
	
		const DEFAULT_HEIGHT = 20;
		const $replyarea = document.querySelector('#replyTextarea'+no);
		
		$replyarea.oninput = (event) => {
			const $target = event.target;

			$target.style.height = 0;
			$target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
		};
		
}

function replyUpdateCancel(no) {
		let txt = $('#replyHiddenText'+no).val();
		$('#replyTextarea'+no).val(txt);
		$('#replyTextarea'+no).css('display', 'none');
		$('#replyText'+no).css('display', 'inline');
		$('#replyEdited'+no).css('display', 'inline');
		$('.replyUpdateBtn').css('display', 'inline');
		$('.replyDeleteBtn').css('display', 'inline');
		$('#replyUpdateDoneBtn'+no).css('display', 'none');
		$('#replyUpdateCancelBtn'+no).css('display', 'none');
}

function replyUpdateDone(no) {
		let txt = $('#replyTextarea'+no).val();
		let c = confirm('댓글을 수정하시겠습니까?');
		if (c) {
			pageGoPost({
				url: "reply.update",	//이동할 페이지
			    target: "_self",
			    vals: [				//전달할 인수들
			    	["tp_r_no", no],
			        ["tp_r_text", txt],
				]
			});
		}
}