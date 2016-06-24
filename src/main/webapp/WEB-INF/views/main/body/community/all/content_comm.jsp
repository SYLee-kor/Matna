<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d57f90536554e1d1025bdf0836b0ed4f&libraries=services"></script>
<script type="text/javascript" src="/matna/resource/js/daumMap.js"></script>
<script src="/matna/resource/jqplot/jquery.jqplot.min.js"/></script>
<script type="text/javascript" src="/matna/resource/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript">
	
	/* function gbCheck(gbType,rNo,userNo) {
		$.ajax({
			url:'/matna/review/gbCheck',
			data:{
				rNo:rNo,
				gbType:gbType,
				userNo:userNo
			},
			type:"post",
			dataType:"json",
			success:function(result){
				if(result.result){ // # 좋아요를 누르지 않은 경우
					$('#'+result.gbType).html(result.gbNum);
				}else{ // # 이미 좋아요를 누른 경우
					alert('좋아요 / 싫어요 는 한 리뷰당 한번만 가능합니다.');
				}
			},
			error:function(xhr,status,error){
				alert(status.text);
				alert(error);
				alert(xhr);
			}
		})
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
	} */
</script>
</head>

<body>
	<form name="reviewForm" id="reviewForm" class="reviewF">
		<input type="hidden" name="no" value="${review.no }"/>
		<input type="hidden" name="page" value="${page }"/>
		<input type="hidden" name="pageType" value="${pageType }"/>
		<input type="hidden" name="tabType" value="${tabType }"/>
	
		  
	  <div id="content_title"><font size="3"><b>${review.title }</b></font></div>
	  <div id="content" >${review.content }</div>
			
			<%--버튼으로 바꿀예정!! --%>
	  <div id="like_hate">
	  LIKE &nbsp;<a href='javascript:gbCheck("good",${review.no },${userNo })'><img alt="good" src="/matna/resource/images/good.PNG"></a> :  
	   &nbsp;&nbsp;<span id="good">${review.good }</span>  &nbsp;&nbsp;&nbsp;
	  HATE &nbsp;<a href='javascript:gbCheck("bad",${review.no },${userNo })' ><i class="fa fa-thumbs-o-down fa-3x"></i></a> :
	   &nbsp;&nbsp;<span id="bad">${review.bad }</span>  &nbsp;&nbsp;&nbsp;
        <c:if test="${ userNo == review.writer }">
		<input type="button" value="수정" onclick="updateReview('${review.no}');">
		<input type="button" value="삭제" onclick="deleteReview(${review.no},'${pageType }')"> 
		</c:if>
		<input type="button" value="  목록으로  " 
		onclick='javascript:document.location.href="/matna/review/list?tabType=${tabType}&pageType=${pageType }&page=${page }"'>
					
  </div>	
 </form>
	<%@include file="/WEB-INF/views/main/body/review/replyPage.jsp" %>
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>