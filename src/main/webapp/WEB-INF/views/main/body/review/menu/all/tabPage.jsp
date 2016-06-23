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
  <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th><span>글 번호</span></th>
        <th><span>사진</span></th>
        <th><span>제목</span></th>
        <th><span>작성자</span></th>
        <th><span>조회수</span></th>
        <c:if test="${listType ==null}">
        <th><span>좋아요!</span></th>
        <th><span>싫어요!</span></th>
        <th><span>등록일</span></th>
        </c:if>
        
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
         <c:if test="${listType == null }"><!-- listType (null or mini) mini일땐 굿 배드 출력 X-->
         <td>${review.good }</td>  <!-- 좋아요 -->
         <td>${review.bad }</td>  <!-- 싫어요 -->
         <td>${review.regdate }</td>
         </c:if>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <table class="review_List" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th style="width: 50px; padding: 0px; text-align: center"><span>${review.no }</span></th>
							<th style="text-align: center;"><span>${review.photo }</span></th>
							<th style="text-align: center;"><span>title</span></th>
							<th style="text-align: center; width: 150px;"><span>작성자</span></th>
							<th style="width: 70px; padding: 0px; text-align: center;">조회수</th>
							<th style="width: 75px; padding: 0px; text-align: center;">좋아요!</th>
							<th style="width: 75px; padding: 0px; text-align: center;">싫어요!</th>
							<th style="text-align: center;"><span>date</span></th>

						</tr>
					</thead>
					<tbody>
						<tr class="list_lists">
							<td style="width: 50px; padding: 0px;">10</td>
							<td><img src="/matna/resource/images/쉑쉑.png" class="image" /></td>
							<td><a href=# style="font-size: 13px;">첫번째탭입니다^-^ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</a>
								<input type="button" readonly="readonly" class="reply_num"
								value="53" style="cursor: default;"></td>
							<td>배고푸다배고프다다다</td>
							<td>2</td>
							<td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
							<td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
							<td>2016-06-09 12:25</td>
						</tr>
					</tbody>
				</table>

				<!-- ------ paging 처리--------- -->
				<center>
					<ul class="pagination modal-1" id="pagination">
						<li><a href="#" class="prev">&laquo;</a></li>
						<li><a href="#" class="prev">prev</a></li>
						<li><a href="#" class="active">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#" class="next">next</a></li>
						<li><a href="#" class="next">&raquo;</a></li>
					</ul>
					<br>
					<div class="list_write_bt" id="reviewlist_write_bt">
						<a href="#"><span><b>글 쓰기</b></span></a>
					</div>
				</center>
<c:if test="${listType != 'mini' }">
	<!-- ===================== paging 처리======================= -->
	<ul class="pagination modal-1" id="pagination">
	  <c:if test="${pageMaker.prev }">
	  	<li><a class="prev" onclick="showPage_${pageType }('${tabType}',${pageMaker.beforePage})">&laquo;</a></li>
	  </c:if>
	  <li><a class="prev" onclick="showPage_${pageType }('${tabType}',${pageMaker.prevPage})">이전</a></li>
	  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
	 	 <li><a class="pageIndex" onclick="showPage_${pageType }('${tabType}',${stat.index})">${stat.index }</a></li>
	  </c:forEach>
	  <li><a class="next" onclick="showPage_${pageType }('${tabType}',${pageMaker.nextPage})">다음</a></li>
	  <c:if test="${pageMaker.next }">
	  	<li><a class="next" onclick="showPage_${pageType }('${tabType}',${pageMaker.afterPage})">&raquo;</a></li>
	  </c:if>
	 </ul><br>
</c:if>