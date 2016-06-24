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
	
	window.onload = function() {
		listReply('${board.no }');
	}

	function page_move(url) {
		var f = document.frm;
		$('#frm').prop("action",url)
		f.submit();
	}
</script>
</head>

<body>
    <br>
    <h1 style="width: 80%;margin-left: 10%;">자유게시판</h1>

	<form name="frm" id="frm" method="post">
		<input type="hidden" name="type" id="type" value="free" />
			<input type="hidden" name="no" id="no" value="${board.no }" />
			<input type='hidden' name='page' id='page' value ="${cri.page}">
   		    <input type='hidden' name='perPageNum' id='perPageNum' value ="${cri.perPageNum}">
   		    <input type='hidden' name='searchType' id='searchType' value ="${cri.searchType}">
   		    <input type='hidden' name='keyword' id='keyword' value ="${cri.keyword}">
		  
		 <!--  <div class="community_info" style="margin-top: 2%;color: gray;">
		  <div class="row" style="margin-left: 50px; font-size: 15px;font-weight:300;">
		    <div class="col-md-offset-2 col-md-2">
		       no: 23
		    </div>
		    <div class="col-md-3">
		               작성자: 황은지지지지은지
		    </div>
		    <div class="col-md-2">
			      작성일: 2016.06.25
		    </div>
		  </div>
		  <div class="row" style="padding: 1%;font-size: 16px;font-weight:500; margin-left: 35px;margin-bottom:20px;">
		    <div class="col-md-offset-2 col-md-8">글제목: 안녕하세요여러분안녕하세요안녕하세요하이루루루루!!!!</div>
		  </div>
		 </div>  -->
		 <div class="row"></div>
		 <table style="margin-left: 20%;">
		   <tr>
		      <td colspan="4" style="padding: 1%;font-size: 16px;font-weight:500; margin-left: 35px;margin-bottom:20px;">
		                   글제목: 안녕하세요여러분안녕하세요안녕하세요하이루루루루!!!!
		      </td>
		   </tr>
		   <tr style="font-size: 15px;font-weight:300;">
		     <td>no: 123</td>
		     <td>작성자: 황은지은지지지은지</td>
		     <td>작성일: 2016.06.24</td>
		     <td>조회수: 140</td>
		   </tr>
		 </table>
		  
		  <div class="row">
					<div class="col-md-offset-2 col-md-8" 
					style="width: 850px; height: 500px;background-color:lightgray; overflow: scroll;">
						ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
						ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ${board.content }</div>
				</div>
				
				
		  
		  
		  <%-- <table id="contentTable">
				<tr align="center">
					<td align="center" width="200">글번호</td>
					<td width="800">${board.no }20</td>
				</tr>
				<tr align="center">
					<td align="center">작성자</td>
					<td>황은지은지은지${board.writer }</td>
				</tr>
				<tr align="center">
					<td align="center">작성일</td>
					<td>2016.06.24${board.regdate }</td>
				</tr>
				<tr align="center">
					<td align="center">제목</td>
					<td>자유 게시판입니다${board.title }</td>
				</tr>
				<tr> --%>
				<%-- <div class="row">
					<div class="col-md-offset-2 col-md-8" 
					style="width: 850px; height: 500px;background-color:lightgray; overflow: scroll;">
						ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
						ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ${board.content }</div>
				</div> --%>
				<!-- </tr>
			</table> -->
		  
		  <%--  <div id="content_title"><font size="3"><b>${review.title }</b></font></div>
	            <div id="content" >${review.content }</div> --%>
			
			<%--버튼으로 바꿀예정!! --%>
	  <div id="like_hate">
	    
		<input type=button value="수정" 
		       onclick="javascript:page_move('/matna/community/update');">
		<input type=button value="삭제" 
		       onclick="javascript:page_move('/matna/community/delete');">
		<input type=button value="목록으로" 
		       onclick="javascript:page_move('/matna/community/listPage');"> 		
      </div>	
 </form>

	<%@include file="/WEB-INF/views/main/body/community/all/replyPage.jsp" %>
    <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>