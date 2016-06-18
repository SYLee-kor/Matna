<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${listType == null }">
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
</c:if>
<script type="text/javascript">
// ======================================== Review 함수 =======================================
	// # 보여 줄 탭을 띄우고 나머지는 안보이게 해주는 함수
	function showTab_review(type,page) {
		var types = ['food','desert','drink'];
		for (i= 0; i < 3; i++) {
			var tb = document.getElementById('tab_'+types[i]+"_review");
			if(type != types[i]){
				tb.style.display = "none";
				$('#'+types[i]+"T").css("color","orange");
			}else {
				tb.style.display = 'block';
				$('#'+types[i]+"T").css("color","lime");
				showPage_review(type,page);
			}
		}
	}
	
		
	// # 지정 탭에 할당된 span 태그에 Ajax를 통해 출력할 페이지 가져오는 함수 ( tabPage.jsp )
	function showPage_review(type,page) {
		var perPageNum = ('${listType}'=='mini') ? 3 : 10;
		$("#tab_"+type+"_review").load('/matna/review/tabPage?&tabType='+type
				+'&pageType=review&listType=${listType}&page='+page+'&perPageNum='+perPageNum);
	}
// ======================================== Ranking 함수 =====================================	
	// # 보여 줄 탭을 띄우고 나머지는 안보이게 해주는 함수
	function showTab_ranking(type,page) {
		var types = ['food','desert','drink'];
		for (i= 0; i < 3; i++) {
			var tb = document.getElementById('tab_'+types[i]+"_${pageType }");
			if(type != types[i]){
				tb.style.display = "none";
				$('#'+types[i]+"T").css("color","orange");
			}else {
				tb.style.display = 'block';
				$('#'+types[i]+"T").css("color","lime");
				showPage_ranking(type,page);
			}
		}
	}

	// # 지정 탭에 할당된 span 태그에 Ajax를 통해 출력할 페이지 가져오는 함수 ( tabPage.jsp )
	function showPage_ranking(type,page) {
		var perPageNum = ('${listType}'=='mini') ? 3 : 10;
		$("#tab_"+type+"_${pageType }").load('/matna/review/tabPage?&tabType='+type
				+'&pageType=${pageType}&listType=${listType}&page='+page+'&perPageNum='+perPageNum);
	}
</script>
<div id="listPage">
<a id="aList"></a>
	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
  	<c:if test="${pageType == 'review'}">
   		<li class="tabBlock-tab is-active">
   			<a href="/matna/review/list?pageType=review">최신 리뷰</a>
   		</li>
  	</c:if>
  	<c:if test="${pageType == 'ranking'}">
   		<li class="tabBlock-tab is-active">
   			<a href="/matna/review/list?pageType=ranking">랭킹 리뷰</a>
   		</li>
  	</c:if>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
	<div style="text-align: left;">
		<div style="border: 1px solid rgb(204, 204, 204);">
			<span onclick="showTab_${pageType}('food',1)" id="food_${pageType }" 
				style="padding: 0pt 5px; cursor: pointer;">식사</span> 
			<span onclick="showTab_${pageType}('desert',1)" id="desert_${pageType }"
				style="padding: 0pt 5px; cursor: pointer;">디저트</span>
			<span onclick="showTab_${pageType}('drink',1)" id="drink_${pageType }"
				style="padding: 0pt 5px; cursor: pointer;">주류</span>
		<%-- 	<c:if test="${type != null }">
			<span onclick="showTab('search')" id="searchT"
				style="padding: 0pt 5px; cursor: pointer; ">검색</span>
			</c:if> --%>
		</div>
	</div>
	<div style="text-align: center;">
		<div id="tab_food_${pageType }" style="display: block;"></div>
		<div id="tab_desert_${pageType }" style="display: none;"></div>
		<div id="tab_drink_${pageType }" style="display: none;"></div>
		<!-- <div id="tab_search" style="display: none;"></div> -->
	</div>
	<br>
	<div align="right" style="width: 90%;">
		<button id="goRegist">글등록</button>
	</div>
	
	</div></div></figure>
</div>
<script type="text/javascript">
	// if : # 미니 페이지 - Action을 안거쳐서 옴(home.jsp에서 include!!)
	// else : # Controller 거쳐서 오는 리뷰 페이지		
	if('${pageType}'=='review'){
		if('${listType}' == 'mini') showTab_review('food',1); 
		else showTab_review('${tabType}','${page}'); // # 
	}
	if('${pageType}'=='ranking'){
		if('${listType}' == 'mini') showTab_ranking('food',1); 
		else showTab_ranking('${tabType}','${page}'); // # 
	}
	
	// # 삽입 , 수정, 삭제 후 결과 출력.
	if('${result}'=='success') alert('처리되었습니다.');
	
	// # 글등록 버튼을 누르면 이동
	$('#goRegist').click(function() {
		document.location.href=
			"/matna/review/regist?page=${page}&tabType=${tabType}&pageType=${pageType}";
	})
</script>
<c:if test="${listType == null }">
<%@include file="/WEB-INF/views/footer.jsp" %>
</c:if>