<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<link href="/matna/resource/css/recipe/list.css" rel="stylesheet">
<script type="text/javascript">
	/* $('.lv').click(function() {
		if (!heart) {
			$(this).addClass('fa-heart').removeClass('fa-heart-o');
			heart = true;
		} else {
			$(this).removeClass('fa-heart').addClass('fa-heart-o');
			heart = false;
		}
	}); */
	
	function likesUp(no) {
		if( '${userNo}' == null || '${userNo}'=='') {
			alert('로그인을 먼저 해주세요.');
			return false;
		}
		$.ajax({
			url:"/matna/recipe/likesUp",
			type:'post',
			data: {
				"no":no,
				"writer":'${userNo}'
			},
			success:function(result){
				if(result){
					var heart = $('#heart'+no);
					if(heart.val() == 'fa fa-heart'){
						heart.removeAttr('class');						
						heart.attr("class","fa fa-heart-o lv")
					}else{
						heart.removeAttr('class');						
						heart.attr("class","fa fa-heart")
					}
				}
			}
		})
	}
	
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
	
	$(document).ready(function() {
		$('#pageSel').val('${pageType}');
		// # 셀렉트 박스로 페이지 조회 방법 변경!!
		$('#pageSel').change(function() {
			document.location.href="/matna/recipe/list?pageType="+$(this).val()
					+'&page=${pageMaker.cri.page}';
		});
	})
</script>
<style>
a{
 cursor: pointer;
}
</style>
<!-- Content Start - Just for visualization -->
<div id="content">
  <c:forEach items="${recipeList }" var="recipe">
   <!-- Recipe Start -->
	<div class="recipe"> 
		<div class="image">
	    	${recipe.photo }
	  		<div class="likes" onclick="likesUp(${recipe.no})">
	    		<i class="fa fa-heart-o lv" id="heart${recipe.no }"></i>
			</div>
	 		<div class="name"  onclick="openPage(${recipe.no},'read')">
	 			<h3>${recipe.foodName }</h3>
	 		</div>
		</div>
  		<ul class="media"  onclick="openPage(${recipe.no},'read')">
		    <li><i class="fa fa-clock-o"></i> ${recipe.time } 분</li>
		    <li><i class="fa fa-cutlery"></i> ${recipe.per } 명</li>
		    <li><i class="fa fa-leaf"></i> 좋아요 ${recipe.likes }</li>
  		</ul>
	</div>
</c:forEach>
<br>
</div>
	<!-- ===================== paging 처리======================= -->
<center>
	<!-- 페이지 조회 방법 변경  -->
	<select id="pageSel">
		<option value="recipe">최신순</option>
		<option value="ranking">좋아요순</option>
		<option value="myRecipe">My레시피</option>
	</select>
	
	<ul class="pagination modal-1" id="pagination">
	  <c:if test="${pageMaker.prev }">
	  	<li><a class="prev" onclick="showPage_recipe(${pageMaker.beforePage})">&laquo;</a></li>
	  </c:if>
	  <li><a class="prev" onclick="showPage_recipe(${pageMaker.prevPage})">이전</a></li>
	  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
	 	 <c:if test="${stat.index == pageMaker.cri.page }">
	 	 <li><a class="pageIndex active" onclick="showPage_recipe(${stat.index})">${stat.index }</a></li>
	 	 </c:if>
	 	 <c:if test="${stat.index != pageMaker.cri.page }">
	 	 <li><a class="pageIndex" onclick="showPage_recipe(${stat.index})">${stat.index }</a></li>
	 	 </c:if>
	  </c:forEach>
	  <li><a class="next" onclick="showPage_recipe(${pageMaker.nextPage})">다음</a></li>
	  <c:if test="${pageMaker.next }">
	  	<li><a class="next" onclick="showPage_recipe(${pageMaker.afterPage})">&raquo;</a></li>
	  </c:if>
	 </ul><br>
	<input type="button" value="레시피 등록" class="btn" style="max-width:100px;" 
	onclick="openPage(0,'regist')">
</center>
  <%@include file="/WEB-INF/views/footer.jsp" %>