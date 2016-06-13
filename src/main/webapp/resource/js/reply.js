
// 기본 URL
var url = "/matna/reviewReply";
	function insertReply(rNo,page){
		/*if(login!='success'){
			alert('댓글을 달기 위해선 로그인을 해야합니다.');
			return;
		}*/
		$.ajax({
			url:"/matna/reviewReply/addReply",
			data:{
				rNo:rNo,
				writer:$('#replyWriter').val(),
				content:$('#replyContent').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(rNo,page);
				$('#repContent').val('')
			},
			error:function(xhr,status,error){
				alert('error : '+error);
				alert('status : '+status);
			}
		})
	}
	
	function listReply(no,page) {
		$.ajax({
			url:url+"/listReply",
			data:{
				rNo:no,		// # 게시글 번호
				page:page
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
	var upPage=0;
	var upContent = '';
	function upReplyForm(no, content, page) { // # 업데이트 폼 형성
		alert(no+"/"+content+'/'+page);
		upPage=page;
		upNo=no;
		upContent = content;
		// # 업데이트 폼 이동
		var upDiv = $("#replyUpDiv");
		upDiv.remove();
		var upSpan = $('#upSpan'+no);
		upSpan.append(upDiv);
		upDiv.show();
		// # 업데이트 폼 데이터 세팅
		$('#replyContent_up').val(content);
	}
	
	function hideReplyForm() {
		$('#replyUpDiv').hide();
		var upDiv = $("#replyUpDiv");
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
				content: $('#replyContent_up').val(),
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				hideReplyForm();
				listReply(rNo,upPage)
			}
		})
	}

	function deleteReply(no,rNo,page){
		$.ajax({
			url:url+"/removeReply",
			data:{
				no:no			// # 댓글 번호 --> primary key
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				hideReplyForm();
				listReply(rNo,page);
			}
		})
	}