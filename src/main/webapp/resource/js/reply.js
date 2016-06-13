
// 기본 URL
var url = "/matna/reviewReply";
	function insertReply(rNo){
		/*if(login!='success'){
			alert('댓글을 달기 위해선 로그인을 해야합니다.');
			return;
		}*/
		$.ajax({
			url:"/matna/reviewReply/addReply",
			data:{
				rNo:rNo,
				writer:$('#repWriter').val(),
				content:$('#repContent').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(rNo);
				$('#repContent').val('')
			},
			error:function(xhr,status,error){
				alert('error : '+error);
				alert('status : '+status);
			}
		})
	}
	
	function listReply(no) {
		$.ajax({
			url:url+"/listReply",
			data:{
				rNo:no		// # 게시글 번호
			},
			type:"POST",
			success:function(result){
				$('#replyList').html(result);
			},
			error:function(xhr,status,error){
				alert("listAll error : "+error);
			}
		})
	}
	var upNo=0;
	var upContent = '';
	function upReplyForm(no, content) { // # 업데이트 폼 형성
		upNo=no;
		upContent = content;
		// # 업데이트 폼 이동
		var upDiv = $("#replyUpdate");
		upDiv.remove();
		var upSpan = $('#r'+no);
		upSpan.append(upDiv);
		upDiv.show();
		// # 업데이트 폼 데이터 세팅
		$('#repContent_up').val(content);
	}
	
	function hideReplyForm() {
		$('#replyUpdate').hide();
		var upDiv = $("#replyUpdate");
		upDiv.remove();
		var body = $("body");
		body.append(upDiv);
		upDiv.hide();
	}
	
	function updateReply(rNo){
		$.ajax({
			url:url+"/modifyReply",
			data:{
				no:upNo,			// # upNo --> 댓글 번호
				rNo:rNo,
				content: $('#repContent_up').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				hideReplyForm();
				listReply(rNo)
			}
		})
	}

	function deleteReply(no,rNo){
		$.ajax({
			url:url+"/removeReply",
			data:{
				no:no			// # 댓글 번호 --> primary key
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				hideReplyForm();
				listReply(rNo);
			}
		})
	}