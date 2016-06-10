<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css"
	href="/Matna/css/body/community/all/content.css"> -->
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	window.onload = function() {
		selectAllReply();
	}
	function selectAllReply(){
		$.ajax({
			url:'/matna/review/replyList',
			type:"POST",
			data:{
				rNo:'${review.no}'
			},
			success:function (result) {
				$('#replyList').html(result);
			},
			error:function (xhr,result,error){
				alert(error);
				alert(result);
			}
			
		})
	}
	
	function insertReply() { // # 댓글 추가
		if('${login}'!='success'){
			alert('댓글을 달기 위해선 로그인을 해야합니다.');
			return;
		}
		
		var params = "writer=" + document.addForm.writer.value + "&content="
				+ document.addForm.content.value +"&reNo="+<%=request.getAttribute("reNo")%> +"&action=insertReply";
		hideForm();
		new ajax.xhr.Request('/Matna/review/review.do', params, printReply,
				'POST');

		//@ addForm의 텍스트필드 리셋.
		document.addForm.name.value = "";
		document.addForm.content.value = "";
	}
	
	var upNo = 0;
	function upForm(no, name) { //# 수정폼 보이기, 위치변경 및 기존 데이터 출력
		upNo = no;
		// # 업데이트 폼의 위치 변경
		var upDiv = document.getElementById("replyUpdate");
		upDiv.parentNode.removeChild(upDiv);
		var oneReply = document.getElementById("r" + upNo);
		oneReply.appendChild(upDiv);
		upDiv.style.display = "";

		// # 업데이트 폼에 기존 데이터를 출력
		document.updateForm.name.value = name;
		var content = document.getElementById("c" + upNo).firstChild.nodeValue;
		document.updateForm.content.value = content;
	}

	function updateReply() { // # 댓글 수정 작업..
		var params = "no=" + upNo + "&name=" + document.updateForm.name.value
				+ "&content=" + document.updateForm.content.value
				+ "&action=updateReply";
		hideForm();
		new ajax.xhr.Request('/Matna/review/review.do', params, printReply,
				'POST');
	}
	
	var gbFlag ='';
	function findGB(gbType,no,name) {
		if('${login}'!='success'){
			alert('먼저 로그인 해주세요~'); return;
		}
		$.ajax({
			url:'/Matna/review/findGB',
			data:{
				userNo:'${userNo}',
				reviewNo:'${review.no}'
			},
			type:"post",
			success:function(result){
				gbFlag = result;
				good_bad(gbType,no,name);
			},
			error:function(xhr,status,error){
				alert(status.text);
				alert(error);
				alert(xhr);
			}
		})
	}
	function good_bad(gbType,no,name) {
		if(gbFlag =='true'){ // # 이미 좋아요를 눌렀을 경우
			alert('좋아요 / 싫어요 기능은 각 리뷰마다 한번 선택 가능합니다.'); return;
		}else{
			$.ajax({
				url:'/Matna/review/review.do',
				data:{
					action:"good_bad",
					no:no,
					gbType:gbType,
					name:name
				},
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.gbType=='good')$("#good").html(result.cnt);
					else if(result.gbType=='bad') $("#bad").html(result.cnt);
				},
				error:function(xhr,status,error){
					alert(status.text);
					alert(error);
					alert(xhr);
				}
			})
		}
	}
	
	
	function deleteReply(delNo) { // # 삭제
		var params = "no=" + delNo + "&action=deleteReply";
		hideForm();
		new ajax.xhr.Request('/Matna/review/review.do', params, printReply,
				'POST');
	}

	function printReply(xhr) { // # 페이지 출력..
		if (xhr.readyState == 4 && xhr.status == 200) {
			var replyList = document.getElementById("replyList");
			replyList.innerHTML = xhr.responseText;
		}
		selectAllReply();
	}

	function hideForm() { // # 폼 숨기기 및 위치 변경
		var upDiv = document.getElementById("replyUpdate");
		upDiv.parentNode.removeChild(upDiv);
		var body = document.documentElement;
		body.appendChild(upDiv);
		upDiv.style.display = "none";
	}
	
	function deleteReview() {
		var f = document.reviewForm;
		f.action.value = "/matna/review/remove";
	}
	
	function updateReview() {
		var f = document.reviewForm;
		f.action.value = "/matna/review/modify";
		f.submit();
	}
</script>
</head>
<c:forEach begin="1" end="5" varStatus="stat">
	<c:if test="${preview.parking==1 }">
			<c:set var="parking" value="있음" />
		</c:if>
		<c:if test="${preview.parking==0 }">
			<c:set var="parking" value="없음" />
		</c:if>
	<%-- 평점 체크 --%>
	<c:if test="${preview.score==stat.index }">
		<c:forEach begin="1" end="${stat.index}">
			<c:set var="score" value='${score += "★"}' />
		</c:forEach>
		<c:forEach begin="1" end="${5-stat.index }">
			<c:set var="score" value='${score += "☆"}' />
		</c:forEach>
	</c:if>

</c:forEach>
<body>
	<form name="reviewForm" id="reviewForm" class="reviewF" method="post">
		<input type="hidden" name="no" value="${review.no }"/>
		<input type="hidden" name="writer" value="${review.writer }"/>
		<input type="hidden" name="tabType" value="${tabType }"/>
		<input type="hidden" name="pageType" value="${pageType }"/>
		
		<table id="contentTable" cellpadding="5" bordercolor="#00bbdd" border="1">
			<tr>
				<td><font size="2">작성자</font></td>
				<td><font size="2"><b>${review.nickName }</b></font></td>
				<td><font size="2">조회수</font></td>
				<td><font size="2"><b>${review.viewCnt }</b></font></td>
			</tr>
			<tr>
				<td><font size="2">주차장 여부</font></td>
				<td><font size="2"><b>${parking}</b></font></td>
				<td><font size="2">연락처</font>
				<td><font size="2"><b>${preview.phone }</b></font>
			</tr>
			<tr>
				<td><font size="2">평점</font></td>
				<td id="savor"><font color="orange">${score }</font></td>
				<td><font size="2">1인비용</font></td>
				<td><font size="2"><b>${preview.price }</b></font></td>
			</tr>
			<tr>
				<td colspan="4">
				<div>
					<font size="2"><b>${preview.gu } ${preview.dong } ${preview.addr }</b></font>
				</div>
				<div>${preview.map}</div>
			</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="4"><font size="3"><b>${review.title }</b></font></td>
			</tr>
			<tr>
				<td colspan="4"><div id="content"
						style="width: 1047px; height: 500px; overflow: scroll;">${review.content }</div></td>
			</tr>
			<tr>
				<td>
				<a href='javascript:findGB("good",${reNo },"${userId }")' style="color: teal;">
				좋아요:</a> <font color="red"><span id="good">${review.good }</span> </font>| 
				<a href='javascript:findGB("bad",${reNo },"${userId }")' style="color: teal;">
				싫어요:</a> <font color="red"><span id="bad">${review.bad }</span> </font></td>
				<td colspan="4" align="right">
					<c:if test="${userNo != 0 && userNo == review.writer}">
					<input type="button" value="수정" onclick="updateReview();">
					<input type="button" value="삭제" onclick="deleteReview()"> 
					</c:if>
					<input type="button" value="  목록으로  " 
					onclick='javascript:document.location.href="/matna/review/list?page=${page }&tabType=${tabType }&pageType=${pageType}"'>
					</td>
			</tr>
		</table>
	</form>
	<div id="replyAdd">
		<form name="addForm" style="border: thin; background-color: #f1f1f1;">
			<!-- 입력폼 -->
			<h4 style="font: fantasy;">댓글쓰기</h4>
			<input type="hidden" name="writer" size="10" value="${userNo }">
			<textarea rows="3" cols="50" name="content" tabindex="0"
				style="width: 500px; height: 80px;"></textarea>
			<input type="button" value="등록" onclick="insertReply()" tabindex="1"
				style="width: 50px; height: 80px;"><br>
		</form>
	</div>
	<div id="replyList"></div>
	<div id="replyUpdate" style="display: none">
		<form name="updateForm">
			<!-- 수정폼 -->
			<h4>댓글 수정</h4>
			<input type="hidden" name="name" size="10" value="id">
			<textarea rows="3" cols="50" name="content"></textarea>
			<input type="button" value="등록" onclick="updateReply(0,'no')">
			<input type="button" value="취소" onclick="hideForm()">
		</form>
	</div>
</body>
</html>