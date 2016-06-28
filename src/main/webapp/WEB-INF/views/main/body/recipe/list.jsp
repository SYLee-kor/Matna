<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<link href="/matna/resource/css/recipe/list.css" rel="stylesheet">
<script type="text/javascript">
	var heart = false;
	$('.lv').click(function() {
		if (!heart) {
			$(this).addClass('fa-heart').removeClass('fa-heart-o');
			heart = true;
		} else {
			$(this).removeClass('fa-heart').addClass('fa-heart-o');
			heart = false;
		}
	});
	
	function openPage(no,action) {
		if (action != 'read')
			var url = '/matna/recipe/'+action;
		else 
			var url = '/matna/recipe/read?no='+no+'&page=${page}&pageType=recipe';
		window.open(url,'name','channelmode=yes,fullscreen=no,height=600pixels,width=1000pixels,left=150pixels,top=50pixels,menubar=no,status=no,titlebar=no');
	}
	
	function showPage_recipe(page) {
		document.location.href='/matna/recipe/list?page='+page+'&pageType=${pageType}';
	}
</script>
<!-- Content Start - Just for visualization -->
<div id="content">
  <c:forEach items="${recipeList }" var="recipe">
   <!-- Recipe Start -->
	<div class="recipe" onclick="openPage(${recipe.no},'read')"> 
		<div class="image">
	    	${recipe.photo }
	  		<div class="likes">
	    		<i class="fa fa-heart-o lv"></i>
			</div>
	 		<div class="name">
	 			<h3>${recipe.foodName }</h3>
	 		</div>
		</div>
  		<ul class="media">
		    <li><i class="fa fa-clock-o"></i> ${recipe.time } 분</li>
		    <li><i class="fa fa-cutlery"></i> ${recipe.per } 명</li>
		    <li><i class="fa fa-leaf"></i> 좋아요 ${recipe.likes }</li>
  		</ul>
	</div>
</c:forEach>
<br>
</div>
	<!-- ===================== paging 처리======================= -->
	<ul class="pagination modal-1" id="pagination">
	  <c:if test="${pageMaker.prev }">
	  	<li><a class="prev" onclick="showPage_recipe(${pageMaker.beforePage})">&laquo;</a></li>
	  </c:if>
	  <li><a class="prev" onclick="showPage_recipe(${pageMaker.prevPage})">이전</a></li>
	  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
	 	 <li><a class="pageIndex" onclick="showPage_recipe(${stat.index})">${stat.index }</a></li>
	  </c:forEach>
	  <li><a class="next" onclick="showPage_recipe(${pageMaker.nextPage})">다음</a></li>
	  <c:if test="${pageMaker.next }">
	  	<li><a class="next" onclick="showPage_recipe(${pageMaker.afterPage})">&raquo;</a></li>
	  </c:if>
	 </ul><br>
<center>
	<input type="button" value="레시피 등록" class="btn" style="max-width:100px;" 
	onclick="openPage(0,'regist')">
</center>
  <%@include file="/WEB-INF/views/footer.jsp" %>