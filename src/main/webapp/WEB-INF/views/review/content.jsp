<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9f63f7a70411f9756f65fdec8b2face8&libraries=services"></script>
<script type="text/javascript" src="/matna/resource/js/jquery2.js"></script>
<script type="text/javascript" src="/matna/resource/js/daumMap.js"></script>
<script type="text/javascript">
	window.onload = function() {
		if(!('${preview.gu}'=='구' || '${preview.dong}'=='동')){
			showMap('${preview.gu} ${preview.dong} ${preview.addr}');
		}
		listReply('${review.no}');
	}
	var gbFlag ='';
	function findGB(gbType,no,name) {
		if('${login}'!='success'){
			alert('먼저 로그인 해주세요~'); return;
		}
		$.ajax({
			url:'/matna/review/findGB',
			data:{
				name:name,
				no:no
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
	
	function deleteReview() {
		var reviewForm = $('#reviewForm');
		reviewForm.attr("action",'/matna/review/remove');
		reviewForm.attr("method",'POST');
		reviewForm.submit();
	}
	
	function updateReview() {
		var reviewForm = $('#reviewForm');
		reviewForm.attr("method",'GET');
		reviewForm.attr("action",'/matna/review/modify');
		reviewForm.submit();
	}
</script>
</head>
<!-- 주차 여부 체크 -->
<c:if test="${preview.parking==1 }">
	<c:set var="parking" value="있음" />
</c:if>
<c:if test="${preview.parking==0 }">
	<c:set var="parking" value="없음" />
</c:if>

<%-- 평점 체크 --%>
<c:forEach begin="1" end="5" varStatus="stat">
	<c:if test="${preview.score==stat.index }">
		<c:forEach begin="1" end="${stat.index }">
			<c:set var="score" value='${score += "★"}' />
		</c:forEach>
		<c:forEach begin="1" end="${5-stat.index }">
			<c:set var="score" value='${score += "☆"}' />
		</c:forEach>
	</c:if>
</c:forEach>
<body>
	<form name="reviewForm" id="reviewForm" class="reviewF">
		<input type="hidden" name="no" value="${review.no }"/>
		<input type="hidden" name="pageType" value="${pageType }"/>
		<input type="hidden" name="tabType" value="${tabType }"/>
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
				<td><font size="2">1인비용</font></td>
				<td><font size="2"><b>${preview.price }</b></font></td>
			</tr>
			<tr>
				<td><font size="2">평점</font></td>
				<td id="score"><font color="orange">${score }</font></td>
				<td><font size="2">연락처</font>
				<td><font size="2"><b>${preview.phone }</b></font>
			</tr>
			<tr>
				<td colspan="4">
					<div><font size="2"><b>${preview.recommend }</b></font></div>
					<div id="map" style="width:500px;height:250px;"></div>
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
				<a href='javascript:findGB("good",${reNo },"${userNo }")' style="color: teal;">
				좋아요:</a> <font color="red"><span id="good">${review.good }</span> </font>| 
				<a href='javascript:findGB("bad",${reNo },"${userNo }")' style="color: teal;">
				싫어요:</a> <font color="red"><span id="bad">${review.bad }</span> </font></td>
				<td colspan="4" align="right">
					<c:if test="${ userNo == review.writer }">
					<input type="button" value="수정" onclick="updateReview('${review.no}');">
					<input type="button" value="삭제" onclick="deleteReview(${review.no},'${pageType }')"> 
					</c:if>
					<input type="button" value="  목록으로  " 
					onclick='javascript:document.location.href="/matna/review/list?tabType=${tabType}&pageType=${pageType }&page=${page }"'>
					</td>
			</tr>
		</table>
	</form>
	<%session.setAttribute("userNo", 01); %>
	<%@include file="/WEB-INF/views/review/replyPage.jsp" %>
</body>
</html>