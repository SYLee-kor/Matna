<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %> 
   <meta name="description" content="">
   <meta name="keywords" content="" />
   <meta name="viewport" content="initial-scale=1">
<style type="text/css">
.image{
   width :100px;
   height: 70px;
} 
</style>
<script type="text/javascript">
//======================================== Review 함수 =====================================	
// # 지정 탭에 할당된 span 태그에 Ajax를 통해 출력할 페이지 가져오는 함수 ( tabPage.jsp )
function showPage_review(type,page) {
	$("#tab_"+type+"_review").load('/matna/review/tabPage?&tabType='+type
			+'&pageType=review&page='+page+'&perPageNum=5');
	
	var types=["food","desert","drink"];
	for (var int = 0; int < types.length; int++) {
		if(type == types[int]){
			$('#tab_'+types[int]+'_review').show();
			$('#rtab_'+types[int]+'_review').attr("class","tabBlock-tab is-active");
		}else{
			$('#tab_'+types[int]+'_review').hide();
			$('#rtab_'+types[int]+'_review').attr("class","tabBlock-tab");
		}
	}
}
//======================================== Ranking 함수 =====================================	
// # 지정 탭에 할당된 span 태그에 Ajax를 통해 출력할 페이지 가져오는 함수 ( tabPage.jsp )
function showPage_ranking(type,page) {
	$("#tab_"+type+"_ranking").load('/matna/review/tabPage?&tabType='+type
			+'&pageType=ranking&page='+page+'&perPageNum=5');
	
	var types=["food","desert","drink"];
	for (var int = 0; int < types.length; int++) {
		if(type == types[int]){
			$('#tab_'+types[int]+'_ranking').show();
			$('#rtab_'+types[int]+'_ranking').attr("class","tabBlock-tab is-active");
		}else{
			$('#tab_'+types[int]+'_ranking').hide();
			$('#rtab_'+types[int]+'_ranking').attr("class","tabBlock-tab");
		} 
	}
}
</script>
 <div class="col-md-1 col-sm-1"></div>
<div class="col-md-10 col-sm-10">
 <div id="reviewList">
  <c:if test="${pageType=='review' }">
  <h1>Review</h1><br>
  </c:if>
  <c:if test="${pageType=='ranking' }">
  <h1>Ranking</h1><br>
  </c:if>
  <figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active" id="rtab_food_${pageType }" onclick="showPage_${pageType}('food',1)">식사</li>
    <li class="tabBlock-tab" id="rtab_desert_${pageType }" onclick="showPage_${pageType}('desert',1)">디저트</li>
    <li class="tabBlock-tab" id="rtab_drink_${pageType }" onclick="showPage_${pageType}('drink',1)">주류</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane" id="tab_food_${pageType }"></div>
    <div class="tabBlock-pane" id="tab_desert_${pageType }"></div>
    <div class="tabBlock-pane" id="tab_drink_${pageType }"></div>
  <div class="list_write_bt" id="reviewlist_write_bt">
       <a id="goRegist" style="cursor: pointer;"><span><b>글 쓰기</b></span></a>  
  </div> 
  </div>
  </figure>
</div>
</div>
<script type="text/javascript">
	if('${pageType}'=='review') showPage_review('${tabType}','${page}'); // # 
	else if('${pageType}'=='ranking') showPage_ranking('${tabType}','${page}'); // # 
	
	// # 삽입 , 수정, 삭제 후 결과 출력.
	if('${result}'=='success') alert('처리되었습니다.');
	// # 글등록 버튼을 누르면 이동
	$('#goRegist').click(function() {
		document.location.href=
			"/matna/review/regist?page=${page}&tabType=${tabType}&pageType=${pageType}";
	})
</script>
<%@include file="/WEB-INF/views/footer.jsp" %>
