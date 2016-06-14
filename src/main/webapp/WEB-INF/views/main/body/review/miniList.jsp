<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>리뷰 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="/Matna/css/body/review/menu/all/miniList.css">
<script type="text/javascript" src="/Matna/js/jquery2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tab_food").load('/Matna/review/review.do?action=selectFood&pageType=mini');
		$("#tab_desert").load('/Matna/review/review.do?action=selectDesert&pageType=mini');
		$("#tab_drink").load('/Matna/review/review.do?action=selectDrink&pageType=mini');
		
		showTab('<%= request.getParameter("tabType") %>');
	})
	
	function showTab(type) {
		var types = ['food','desert','drink'];
		for (i= 0; i < 3; i++) {
			var tb = document.getElementById('tab_'+types[i]);
			if(type != types[i]){
				tb.style.display = "none";
				$('#'+types[i]).css("color","orange");
			}else {
				tb.style.display = 'block';
				$('#'+types[i]).css("color","lime");
			}
		}
	}
</script>
</head>
<body>

	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active"><a href="/Matna/review/list.do?tabType=food">최신 리뷰</a></li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
    
	<div style="text-align: left; font-weight: bold;">
		<div style="border: 1px solid rgb(204, 204, 204);">
			<span onclick="showTab('food')" id="food"
				style="padding: 0pt 5px; cursor: pointer;">식사</span> 
			<span onclick="showTab('desert')" id="desert"
				style="padding: 0pt 5px; cursor: pointer;">디저트</span> 
			<span onclick="showTab('drink')" id="drink" 
				style="padding: 0pt 5px; cursor: pointer;">주류</span>
		</div>
	</div>
	<div style="text-align: center;">
		<div id="tab_food" style=" height 70%; display: block;"></div>
		<div id="tab_desert" style=" height 70%; display: none;"></div>
		<div id="tab_drink" style=" height 70%; display: none;"></div>
	</div>
	
	</div>
  </div>
</figure>
</body>
</html>