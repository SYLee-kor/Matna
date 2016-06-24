<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<!-- services 라이브러리 불러오기 -->
<link rel="stylesheet" href="/matna/resource/jqplot/jquery.jqplot.min.css">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d57f90536554e1d1025bdf0836b0ed4f&libraries=services"></script>
<script type="text/javascript" src="/matna/resource/js/daumMap.js"></script>
<script src="/matna/resource/jqplot/jquery.jqplot.min.js"/></script>
<script type="text/javascript" src="/matna/resource/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		if(!('${preview.gu}'=='구' || '${preview.dong}'=='동')){
			showMap('${preview.gu} ${preview.dong} ${preview.addr}');
		}
		listReply('${review.no}');
		
		var man=${mcount};
		var woman=${wcount};
		
		$.jqplot ('graph', [[['남자', man], ['여자', woman]]], 
		        { 
		          seriesDefaults: {
		            //원형으로 렌더링
		            renderer: $.jqplot.PieRenderer,
		            //원형상단에 값보여주기(알아서 %형으로 변환)
		            rendererOptions: {
		              showDataLabels: true
		            }
		          },
		          //우측 색상별 타이틀 출력
		          legend: { show:true, location: 'e' }
		        }
		);
	}
	
	function gbCheck(gbType,rNo,userNo) {
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
		<table>
			<tr>
				<td>
				 <p id ='one' style="margin-left: 50px">
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
				</td>
				<td>
				  	<c:if test="${isCount==true }">
     					<div id="graph" style="width:300px; height:300px; margin-left: 120px"></div>
     				</c:if>
     				<c:if test="${isCount==false }">
     					<div><img alt="" src="/matna/resource/img/chart.jpg" style="width:290px; height:290px; margin-left: 120px"> </div>
     				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
    				 <p id="map"></p>
				</td>
			</tr>
		</table> 
   
   
     
  </div> <%--preview,map --%>
		  
	  <div id="content_title"><font size="3"><b>${review.title }</b></font></div>
	  <div id="content" >${review.content }</div>
			
			<%--버튼으로 바꿀예정!! --%>
	  <div id="like_hate">
	  LIKE &nbsp;<a href='javascript:gbCheck("good",${review.no },${userNo })'><i class="fa fa-thumbs-o-up fa-3x"></i></a> :  
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