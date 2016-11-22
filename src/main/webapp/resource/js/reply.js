
// 기본 URL
var url = "/matna/reviewReply";
	function insertReply(rNo,userNo){
		if(userNo==''){
			alert('댓글을 달기 위해선 로그인을 해야합니다.');
			return;
		}else if($('#replyContent').val() == ''){
			alert('댓글을 입력해주세요.');
			return;
		}
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
				listReply(rNo);
				$('#replyContent').val('')
			},
			error:function(xhr,status,error){
				alert('error : '+error);
				alert('status : '+status);
			}
		})
	}
	
	function listReply(no,replyPage) {
		// # 먼저 수정 폼을 숨겨준 후에 리스트 호출..!
		hideReplyForm();
		
		$.ajax({
			url:url+"/listReply",
			data:{
				rNo:no,		// # 게시글 번호
				page:replyPage
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
	var replyPage=0;
	var upContent = '';
	function upReplyForm(no , page) { // # 업데이트 폼 형성
		replyPage=page;
		upNo=no;
		upContent = $('#repCont'+no).html();
		// # 업데이트 폼 이동
		var upDiv = $("#replyUpDiv");
		upDiv.remove();
		var upSpan = $('#reply'+no);
		upSpan.append(upDiv);
		upDiv.show();
		// # 업데이트 폼 데이터 세팅
		$('#replyContent_up').html(upContent);
	}
	
	function hideReplyForm() {
		var upDiv = $("#replyUpDiv");
		//upDiv.hide();
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
				content: $('#replyContent_up').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(rNo,replyPage)
			}
		})
	}

	function deleteReply(no,rNo,replyPage){
		$.ajax({
			url:url+"/removeReply",
			data:{
				no:no			// # 댓글 번호 --> primary key
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(rNo,replyPage);
			}
		})
	}