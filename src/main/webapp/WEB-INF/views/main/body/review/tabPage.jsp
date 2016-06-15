<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.image{
   width :150px;
   height: 100px;
} 
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
</head>
<body>
<br>
<div class="col-md-1 col-sm-1"></div>
<div class="col-md-10 col-sm-10">
<!--  <div id="reviewList">
  <h1>Review</h1>
  <input type="button" value="글쓰기"> -->
  <table class="review_List" cellspacing="0" cellpadding="0" ondragend="dragPage(${pageMaker.cri.page })">
    <thead>
      <tr>
        <th><span>글 번호</span></th>
        <th><span>사진</span></th>
        <th><span>제목</span></th>
        <th><span>작성자</span></th>
        <th><span>조회수</span></th>
        <th><span>좋아요!</span></th>
        <th><span>싫어요!</span></th>
        <th><span>등록일</span></th>
        
      </tr>
    </thead>
    <tbody>
      <c:forEach var="review" items="${list}">
      <tr>
         <td>${review.no }</td>
         <td onclick="showContents(${review.no})" class="reviewPhoto">${review.photo }</td>
         <td><a onclick="showContents(${review.no})" class="reviewTitle">${review.title }</a> [${review.replyCnt }]</td>  <!-- title,댓글수 -->
         <td>${review.nickName }</td>
         <td>${review.viewCnt }</td>   <!-- 조회수 -->
         <td>${review.good }</td>  <!-- 좋아요 -->
         <td>${review.bad }</td>  <!-- 싫어요 -->
         <td>${review.regdate }</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  <!-- ===================== paging 처리======================= -->
  <ul class="pagination modal-1" id="pagination">
  <c:if test="${pageMaker.prev }">
  <li><a class="prev" onclick="showPage('${tabType}',${pageMaker.beforePage})">&laquo</a></li>
  </c:if>
  <li><a class="prev" onclick="showPage('${tabType}',${pageMaker.prevPage})">이전</a></li>
  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
  <li><a class="pageIndex" onclick="showPage('${tabType}',${stat.index})">${stat.index }</a></li>
  </c:forEach>
  <li><a class="next" onclick="showPage('${tabType}',${pageMaker.nextPage})">다음</a></li>
  <c:if test="${pageMaker.next }">
  <li><a class="next" onclick="showPage('${tabType}',${pageMaker.afterPage})">&raquo;</a></li>
  </c:if>
</ul><br>
 </div> 
</div>