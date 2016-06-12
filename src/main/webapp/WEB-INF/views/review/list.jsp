<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>리뷰 목록 페이지</title>
<!-- <link rel="stylesheet" type="text/css"
	href="/Matna/css/body/review/menu/all/list.css"> -->
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		showTab('${tabType}','${page}');
		
		// # 삽입 , 수정, 삭제 후 결과 출력.
		if('${result}'=='success') alert('처리되었습니다.');
	})
	function showTab(type,page) {
		var types = ['food','desert','drink'];
		for (i= 0; i < 3; i++) {
			var tb = document.getElementById('tab_'+types[i]);
			if(type != types[i]){
				tb.style.display = "none";
				$('#'+types[i]+"T").css("color","orange");
			}else {
				tb.style.display = 'block';
				$('#'+types[i]+"T").css("color","lime");
				showPage(type,page);
			}
		}
	}
	function showPage(type,page) {
		$("#tab_"+type).load('/matna/review/tabPage?tabType='+type
				+'&pageType=${pageType}&page='+page);
	}
</script>
</head>
<body>
<a id="aList"></a>
	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active">최신 리뷰</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
	<div style="text-align: left;">
		<div style="border: 1px solid rgb(204, 204, 204);">
			<span onclick="showTab('food',${page})" id="foodT" 
				style="padding: 0pt 5px; cursor: pointer;">식사</span> 
			<span onclick="showTab('desert',${page})" id="desertT"
				style="padding: 0pt 5px; cursor: pointer;">디저트</span>
			<span onclick="showTab('drink',${page})" id="drinkT"
				style="padding: 0pt 5px; cursor: pointer;">주류</span>
		<%-- 	<c:if test="${type != null }">
			<span onclick="showTab('search')" id="searchT"
				style="padding: 0pt 5px; cursor: pointer; ">검색</span>
			</c:if> --%>
		</div>
	</div>
	<div style="text-align: center;">
		<div id="tab_food" style="display: block;"  style="width:1023px;"></div>
		<div id="tab_desert" style="display: none;"></div>
		<div id="tab_drink" style="display: none;"></div>
		<!-- <div id="tab_search" style="display: none;"></div> -->
	</div>
	<br>
	<div align="right" style="width: 90%;">
		<form action="/matna/review/regist" method="get">
			<button>글등록</button>
		</form>
	</div>
	
	</div></div></figure>
</body>
</html>
