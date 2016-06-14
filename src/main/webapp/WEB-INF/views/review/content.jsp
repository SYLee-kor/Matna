<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
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
		<input type="hidden" name="page" value="${page }"/>
		<input type="hidden" name="pageType" value="${pageType }"/>
		<input type="hidden" name="tabType" value="${tabType }"/>
		
		<div id="preview"> 
    <p id ='one'>
	    <label class="fa fa-user fa-2x"></label>
	    <label class="preview_la">&nbsp; 작성자:</label>
	                  &nbsp;&nbsp;<b>${review.nickName }</b></br>
	    <label class="fa fa-hand-o-up fa-2x" ></label>
	    <label class="preview_la">&nbsp; 조회수:</label>
	                  &nbsp;&nbsp;<b>${review.viewCnt }</b></br>
	    <label class="fa fa-truck fa-2x"></label>
	    <label class="preview_la">&nbsp; 주차장여부:</label>
	                  &nbsp;&nbsp;<b>${parking}</b></br> 
	    <label class="fa fa-money fa-2x"></label>
	    <label class="preview_la">&nbsp; 1인비용:</label>
	                  &nbsp;&nbsp;<b>${preview.price }</b></br> 
	    <label class="fa fa-cutlery fa-2x"></label>
	    <label class="preview_la">&nbsp; 추천메뉴:</label>
	                  &nbsp;&nbsp;<b>${preview.recommend }</b></br> 
	    <label class="fa fa-star fa-2x"></label>
	    <label class="preview_la">&nbsp; 평점:</label>
	                  &nbsp;&nbsp;<font color="orange">${score }</font></br> 
	    <label class="fa fa-phone fa-2x"></label>
	    <label class="preview_la">&nbsp; 연락처:</label>
	                  &nbsp;&nbsp;<b>${preview.phone }</b></br>
     </p>
     <p id="map" ></p>
  </div> <%--preview,map --%>
		  
	  <div id="content_title"><font size="3"><b>${review.title }</b></font></div>
	  <div id="content" >${review.content }</div>
			
			<%--버튼으로 바꿀예정!! --%>
	  <div id="like_hate">
	  LIKE <a href='javascript:findGB("good",${reNo },"${userNo }")'><i class="fa fa-thumbs-o-up fa-3x"></i></a> :  
	   &nbsp;&nbsp;<span id="good">${review.good }</span>  &nbsp;&nbsp;&nbsp;
	  HATE <a href='javascript:findGB("bad",${reNo },"${userNo }")' ><i class="fa fa-thumbs-o-down fa-3x"></i></a> :
	   &nbsp;&nbsp;<span id="bad">${review.bad }</span>  &nbsp;&nbsp;&nbsp;
        <c:if test="${ userNo == review.writer }">
		<input type="button" value="수정" onclick="updateReview('${review.no}');">
		<input type="button" value="삭제" onclick="deleteReview(${review.no},'${pageType }')"> 
		</c:if>
		<input type="button" value="  목록으로  " 
		onclick='javascript:document.location.href="/matna/review/list?tabType=${tabType}&pageType=${pageType }&page=${page }"'>
					
  </div>	
 </form>
>>>>>>> branch 'master' of https://github.com/SYLee-kor/Matna.git
	<%session.setAttribute("userNo", 01); %>
	<%@include file="/WEB-INF/views/review/replyPage.jsp" %>
	
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>