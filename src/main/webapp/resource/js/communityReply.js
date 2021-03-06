
// 기본 URL
var url = "/matna/communityReply";
	function insertReply(bNo,userNo){
		if(userNo==''){
			alert('댓글을 달기 위해선 로그인을 해야합니다.');
			return;
		}else if($('#replyContent').val() == ''){
			alert('댓글을 입력해주세요.');
			return;
		}
		$.ajax({
			url:"/matna/communityReply/addReply",
			data:{
				bNo:bNo,
				type:$('#type').val(),
				writer:$('#replyWriter').val(),
				content:$('#replyContent').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(bNo);
				$('#replyContent').val('')
			},
			error:function(xhr,status,error){
				alert('error : '+error);
				alert('status : '+status);
			}
		})
	}
	function listReply(no,replyPage) {
		// # 수정폼을 기본으로 돌려놓은뒤 리스트 재로딩 ... ! (도중에 함께 삭제 방지)
		hideReplyForm();
		
		$.ajax({
			url:url+"/listReply",
			data:{
				bNo:no,		// # 게시글 번호
				type:$('#type').val(),
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
	function upReplyForm(no, page) { // # 업데이트 폼 형성
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
	
	function updateReply(bNo){
		$.ajax({
			url:url+"/modifyReply",
			data:{
				no:upNo,			// # upNo --> 댓글 번호
				bNo:bNo,
				type:$('#type').val(),
				content: $('#replyContent_up').val()
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(bNo,replyPage)
			}
		})
	}

	function deleteReply(no,bNo,replyPage){
		$.ajax({
			url:url+"/removeReply",
			data:{
				type:$('#type').val(),
				bNo:bNo,
				no:no			// # 댓글 번호 --> primary key
			},
			type:"POST",
			dataType:"json",
			success:function(result){
				listReply(bNo,replyPage);
			}
		})
	}