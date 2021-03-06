<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %> 
   <meta name="description" content="">
   <meta name="keywords" content="" />
   <meta name="viewport" content="initial-scale=1">
<style type="text/css">

#review_photo{
   width :100px;
   height: 70px;
} 
.prev,.next,.pageIndex,.reviewPhoto,.reviewTitle{
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    
	$(document).mousedown(function(e){
         $('.pop').each(function(){
                 if( $(this).css('display') == 'block'){
                     var l_position = $(this).offset();
                     l_position.right = parseInt(l_position.left) + ($(this).width());
                     l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());

                     if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
                         && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
                     {
                        // alert( 'popup in click' );
                     }
                     else
                     {
                         //alert( 'popup out click' );
                         $(this).hide();
                     }
                 }
             });
         }); 
 });
 
/* $("#searchWriter").on("click", function(event) {
	$("#dataForm").prop({action:"/matna/main/review/list"}); 
$("#dataForm").submit();
}); */


function show_pop(no){
	var bno = '#'+no;
   $(bno).show();
}

function message(nick){
window.open("/matna/message/listAll?toNickname="+nick+"#tab-3","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=50,left=200, width=1000,height=600");
}

function searchWriter(writerR){
	$("#writerR2").val(writerR);
	$('#page').val('1');
	$("#dataForm").prop({action:'/matna/main/review/list'});
	$("#dataForm").submit();
}

// ================= 페이지 이동 함수 =================	
function movePage(page) {
	$('#page').val(page);
	$("#dataForm").prop({action:'/matna/main/review/list'});
	$('#dataForm').submit();
}
// ================== 글 읽기 함수 ===================
function showContents(no) {
	$("#dataForm").prop({action:'/matna/review/read?no='+no+'&pageType=search&page=${pageMaker.cri.page}'});
	$('#dataForm').submit();
/* 	var moveUrl = "/matna/review/read?no="+no
			+"&pageType=search&page=${pageMaker.cri.page}";
	document.location.href=moveUrl; */
}
</script>
 <form id="dataForm" method="post">
 <input type="hidden" name="rb" id="rb" value="${cri.rb }"/>
 <input type="hidden" name="gu" id="gu" value="${cri.gu }"/>
 <input type="hidden" name="dong" id="dong" value="${cri.dong }"/>
 <input type="hidden" name="money" id="money" value="${cri.money }"/>
 <input type="hidden" name="parking" id="parking" value="${cri.parking }"/>
 <input type="hidden" name="date" id="date" value="${cri.date }"/>
 <input type="hidden" name="search" id="search" value="${cri.search }"/>
 <input type="hidden" name="reviewType" id="reviewType" value="${cri.reviewType }"/>
 <input type="hidden" name="writerR" id="writerR2" value="${cri.writerR }"/>
 <input type="hidden" name="page" id="page" value=""/>
 </form>
 <div class="col-md-1 col-sm-1"></div>
<div class="col-md-10 col-sm-10">
 <div id="reviewList">
  <h1>Review - 검색 결과</h1><br>
  <figure class="tabBlock">
  <div class="tabBlock-content">
	  <table class="review_List" cellspacing="0" cellpadding="0">
	    <thead>
	      <tr>
	        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
	        <th style="text-align: center;width: 110px;"><span>image</span></th>
	        <th style="text-align: center;width: 600px;"><span>title</span></th>
	        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
	        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
	        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
	        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
	        <th style="text-align: center;width: 40px;"><span>date</span></th>
	        
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${review }" var="review">
	      <tr class="list_lists">
	         <td style="width: 50px;padding: 0px;">${review.no }</td>
	         <td style="cursor: pointer;" onclick="showContents(${review.no})">${review.photo }</td>
	         <td><a href=# style="font-size:13px;" onclick="showContents(${review.no})">${review.title }</a>
	           <input type="button" readonly="readonly" class="reply_num"  value="${review.replyCnt }" style="cursor: default;" >
	         </td> 
	         <td>
	         	<img src="/matna/resource/img/lv${review.mGrade }.jpg"/>
	         	<a href="javascript:show_pop(${review.no });" style="font-size:13px;">
         	${review.nickName }</a>
         	<div align="center" class="pop" id="${review.no }" style="position:absolute; background-color:white; z-index:1; display:none;
         		 width:150px; height:150px; border:3px solid #ff7359; border-radius:20px;">
         		 <table style="margin-top: 3px;" align="center">
         		 	<tr><td><a href="javascript:message('${review.nickName }')" style="font-size:13px;">쪽지보내기</a></td></tr>
         		 	<tr><td><a href="/matna/item/itemdetail?ino=1&&toNickname=${review.nickName }" style="font-size:13px;">포인트선물</a></td></tr>
         		 	<tr><td><a href="javascript:searchWriter('${review.nickName }')" id="searchWriter" style="font-size:13px;">게시글보기</a></td></tr>
         		 </table>
         	</div>
	         </td>
	         <td>${review.viewCnt }</td> 
	         <td><img alt="like" src="/matna/resource/images/good.PNG">${review.good }</td> 
	         <td><img alt="bad" src="/matna/resource/images/sad.PNG">${review.bad }</td>  
	         <td>${review.regdate }</td>
	      </tr>
	    </c:forEach>
	    </tbody>
	  </table> 
	  <!-- ------ paging 처리--------- -->
	  <center>
	  <table>
	    <tr>
	      <td  style="width: 500px;">
	         <div class="page" align="center">
			  <ul class="pagination modal-1" id="pagination">
			  <c:if test="${pageMaker.prev }">
			  	<li><a class="prev" 
			  	onclick="movePage(${pageMaker.beforePage})">&laquo;</a></li>
			  </c:if>
			  <li><a class="prev"
			  	onclick="movePage(${pageMaker.prevPage})">prev</a></li>
			  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
				  <li><a style="cursor: pointer;" id="pIndex${stat.index }"
				  	onclick="movePage(${stat.index})">${stat.index }</a></li>
			  </c:forEach>
			  <li><a class="next"
			 	 onclick="movePage(${pageMaker.nextPage})">next</a></li>
			  <c:if test="${pageMaker.next }">
			 	 <li><a class="next"
			 	 	onclick="movePage(${pageMaker.afterPage})">&raquo;</a></li>
			  </c:if>
			</ul>
			</div>
	      </td>
	      
	      <td class="comm_list_td">
			  <div class="list_write_bt" id="reviewlist_write_bt">
			       <a id="goRegist" style="cursor: pointer;padding-top:5px;"><span><b>글 쓰기</b></span></a>  
			  </div> 
	      </td>
	    </tr>
	  </table>
	</center>
  </div>
  </figure>
</div>
</div>

<script type="text/javascript">
	if('${pageType}'=='review') showPage_review('${tabType}','${page}'); // # 
	else if('${pageType}'=='ranking') showPage_ranking('${tabType}','${page}'); // # 
	
	// # 삽입 , 수정, 삭제 후 결과 출력.
	/* if('${result}'=='success') alert('처리되었습니다.'); */
	// # 글등록 버튼을 누르면 이동
	$('#goRegist').click(function() {
		document.location.href=
			"/matna/review/regist?page=${page}&tabType=${tabType}&pageType=${pageType}";
	})
</script>
<%@include file="/WEB-INF/views/footer.jsp" %>