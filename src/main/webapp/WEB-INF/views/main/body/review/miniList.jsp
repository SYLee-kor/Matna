<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ================== mini리뷰  =====================   -->
<div class="row">
	<div class="col-md-offset-1 col-md-5">
<a href="/matna/review/list?pageType=review"><h1>Review</h1></a><br>
		<figure class="tabBlock">
		<ul class="tabBlock-tabs">
			<li class="tabBlock-tab is-active" onclick="showMini_review('food')">식사</li>
			<li class="tabBlock-tab"  onclick="showMini_review('desert')">디저트</li>
			<li class="tabBlock-tab"  onclick="showMini_review('drink')">주류</li>
		</ul>
		<div class="tabBlock-content">
			<div class="tabBlock-pane" id="reTab_food"></div>
			<div class="tabBlock-pane" id="reTab_desert"></div>
			<div class="tabBlock-pane" id="reTab_drink"></div>
		</div>
		</figure>
	</div>
	<script type="text/javascript">
		function showMini_review(type) {
			$('#reTab_'+type).load('/matna/review/mini?pageType=review&tabType='+type);	
		}
		showMini_review('food');
	</script>
	<!-- ================================= Ranking ============================= -->
	<div class=" col-md-5">
	<a href="/matna/review/list?pageType=ranking"><h1>Ranking</h1></a><br>
		<figure class="tabBlock">
		<ul class="tabBlock-tabs">
			<li class="tabBlock-tab is-active" onclick="showMini_ranking('food')">식사</li>
			<li class="tabBlock-tab" onclick="showMini_ranking('desert')">디저트</li>
			<li class="tabBlock-tab" onclick="showMini_ranking('drink')">주류</li>
		</ul>
		<div class="tabBlock-content">
			<div class="tabBlock-pane" id="raTab_food"></div>
			<div class="tabBlock-pane" id="raTab_desert"></div>
			<div class="tabBlock-pane" id="raTab_drink"></div>
		</div>
		</figure>
	</div>
	<script type="text/javascript">
		function showMini_ranking(type) {
			$('#raTab_'+type).load('/matna/review/mini?pageType=ranking&tabType='+type);	
		}
		showMini_ranking('food');
	</script>
</div>


