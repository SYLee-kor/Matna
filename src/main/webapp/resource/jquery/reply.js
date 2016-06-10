	function insertReply(rNo,page){
		alert('rNo : '+rNo);
		alert('page : '+page);
		var writer = '${userNo}';
		var content = $('#reply_content').val();
		
		$.ajax({
			url:"/matna/review_reply/add",
			data:{
				rNo:rNo,
				writer:writer,
				content:content,
				page:page
			},
			type:"POST",
			success:function(result){
				listReply(rNo);
				$('#repContent').val('');
			}
		})
	}
	
	function listReply(rNo,page) {
		$.ajax({
			url:"/matna/review_reply/list",
			data:{
				rNo:rNo,		// # 게시글 번호
				page:page
			},
			type:"POST",
			success:function(result){
				$('#replyListDiv').html(result);
			},
			error:function(xhr,status,error){
				alert("listAll error : "+error);
			}
		})
	}
	
	var upNo=0;
	function showReplyUpDiv(no) { // # 업데이트 폼 형성
		upNo=no; // @ no = reply 테이블의 no 
		var upContent = $("#upContent_"+no).val();
		
		// # 업데이트 폼 이동
		var upDiv = $("#replyUpdateDiv");
		upDiv.remove();
		var upSpan = $('#replySpan_'+no);
		upSpan.append(upDiv);
		upDiv.show();
		
		// # 업데이트 폼 데이터 세팅
		$('#reply_upContent').val(upContent);
	}
	
	function hideReplyUpDiv() {
		var upDiv = $("#replyUpdateDiv");
		upDiv.remove();
		var body = $("body");
		body.append(upDiv);
		upDiv.hide();
	}
	
	function modifyReply(rNo,page){
		$.ajax({
			url:"/matna/review_reply/modify",
			data:{
				no:upNo,			// # upNo --> 댓글 번호
				content: $('#reply_upContent').val(),
				page:page
			},
			type:"POST",
			success:function(result){
				hideReplyForm();
				listReply(rNo)
			}
		})
	}

	function deleteReply(no,rNo,page){
		$.ajax({
			url:"/matna/review_reply/remove",
			data:{
				no:no,	// # 댓글 번호 --> primary key
				page:page
			},
			type:"POST",
			success:function(result){
				listReply(rNo)
			}
		})
	}