<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
<!-- 
.image{
   width :150px;
   height: 100px;
} -->
.prev,.next,.pageIndex,.reviewPhoto,.reviewTitle{
	cursor: pointer;
}
</style>
<script type="text/javascript">
function showContents(no) {
	var moveUrl = "/matna/review/read?no="+no
			+"&pageType=${pageType}&tabType=${tabType}&page=${pageMaker.cri.page}";
	document.location.href=moveUrl;
}
</script>
  <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
        <th style="text-align: center;"><span>image</span></th>
        <th style="text-align: center;"><span>title</span></th>
        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
        <th style="text-align: center;"><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list }" var="review">
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">10</td>
         <td style="cursor: pointer;" onclick="showContents(${review.no})">${review.photo }</td>
         <td><a href=# style="font-size:13px;" onclick="showContents(${review.no})">${review.title }</a>
           <input type="button" readonly="readonly" class="reply_num"  value="${review.replyCnt }" style="cursor: default;" >
         </td> 
         <td>
         	<img src="/matna/resource/img/lv${review.mGrade }.jpg"/>
         	${review.nickName }
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
   <div class="page">
  <ul class="pagination modal-1" id="pagination">
  <c:if test="${pageMaker.prev }">
  	<li><a class="prev" 
  	onclick="showPage_${pageType }('${tabType}',${pageMaker.beforePage})">&laquo;</a></li>
  </c:if>
  <li><a class="prev"
  	onclick="showPage_${pageType }('${tabType}',${pageMaker.prevPage})">prev</a></li>
  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
	<c:if test="${pageMaker.cri.page == stat.index }">
	<li><a style="cursor: pointer;" id="pIndex${stat.index }" class="active"
	  	onclick="showPage_${pageType }('${tabType}',${stat.index})">${stat.index }</a></li>
	</c:if> 
	<c:if test="${pageMaker.cri.page != stat.index }">
	<li><a style="cursor: pointer;" id="pIndex${stat.index }"
	  	onclick="showPage_${pageType }('${tabType}',${stat.index})">${stat.index }</a></li>
	</c:if> 
  </c:forEach>
  <li><a class="next"
 	 onclick="showPage_${pageType }('${tabType}',${pageMaker.nextPage})">next</a></li>
  <c:if test="${pageMaker.next }">
 	 <li><a class="next"
 	 	onclick="showPage_${pageType }('${tabType}',${pageMaker.afterPage})">&raquo;</a></li>
  </c:if>
</ul><br>
</div>
  </center>