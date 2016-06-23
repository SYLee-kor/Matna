<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta name="description" content="">
   <meta name="keywords" content="" />
   <meta name="viewport" content="initial-scale=1">


<script src="/matna/resource/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
/* var TabBlock = {
		  s: {
		    animLen: 200
		  },
		  
		  init: function() {
		    TabBlock.bindUIActions();
		    TabBlock.hideInactive();
		  },
		  
		  bindUIActions: function() {
		    $('.tabBlock-tabs').on('click', '.tabBlock-tab', function(){
		      TabBlock.switchTab($(this));
		    });
		  },
		  
		  hideInactive: function() {
		    var $tabBlocks = $('.tabBlock');
		    
		    $tabBlocks.each(function(i) {
		      var 
		        $tabBlock = $($tabBlocks[i]),
		        $panes = $tabBlock.find('.tabBlock-pane'),
		        $activeTab = $tabBlock.find('.tabBlock-tab.is-active');
		      
		      $panes.hide();
		      $($panes[$activeTab.index()]).show();
		    });
		  },
		  
		  switchTab: function($tab) {
		    var $context = $tab.closest('.tabBlock');
		    
		    if (!$tab.hasClass('is-active')) {
		      $tab.siblings().removeClass('is-active');
		      $tab.addClass('is-active');
		   
		      TabBlock.showPane($tab.index(), $context);
		    }
		   },
		  
		  showPane: function(i, $context) {
		    var $panes = $context.find('.tabBlock-pane');
		   
		    // Normally I'd frown at using jQuery over CSS animations, but we can't transition between unspecified variable heights, right? If you know a better way, I'd love a read it in the comments or on Twitter @johndjameson
		    $panes.slideUp(TabBlock.s.animLen);
		    $($panes[i]).slideDown(TabBlock.s.animLen);
		  }
		};

		$(function() {
		  TabBlock.init();
		}); */
</script>
</head>
<body>

<%@include file="/WEB-INF/views/matnaHeader.jsp" %> 
<br>
 <div class="col-md-1 col-sm-1"></div>
<div class="col-md-10 col-sm-10">
 <div id="reviewList">
  <h1>Review</h1><br>
  <figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active">자유게시판</li>
    <li class="tabBlock-tab">만남게시판</li>
    <li class="tabBlock-tab">익명게시판</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
       <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
        <th style="text-align: center;"><span>title</span></th>
        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
        <th style="text-align: center;"><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">10</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">9</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">8</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">7</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">6</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">5</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">4</td>
         <td><a href=# style="font-size:13px;">첫번째탭입니다^-^</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">3</td>
         <td><a href=# style="font-size:13px;">가디에 콩국수 맛집을 찾았어요!!</a>
             <input type="button" readonly="readonly" class="reply_num"  value="13"  style="cursor: default;" ></td>
         <td>배고푸다</td>
         <td>21233</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">300</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">100</td>
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">2</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="3"  style="cursor: default;" ></td>
         <td>맥도날드드</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-09 12:25</td>
      </tr>
      
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">1</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디디비디비디디디딥</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-6-9</td>
      </tr>
    </tbody>
  </table> 
  
  <!-- ------ paging 처리--------- -->
   <center>
  <ul class="pagination modal-1" id="pagination">
  <li><a href="#" class="prev">&laquo</a></li>
  <li><a href="#" class="prev">prev</a></li>
  <li><a href="#" class="active">1</a></li>
  <li> <a href="#">2</a></li>
  <li> <a href="#">3</a></li>
  <li> <a href="#">4</a></li>
  <li> <a href="#">5</a></li>
  <li> <a href="#">6</a></li>
  <li> <a href="#">7</a></li>
  <li> <a href="#">8</a></li>
  <li> <a href="#">9</a></li>
  <li><a href="#" class="next">next</a></li>
  <li><a href="#" class="next">&raquo;</a></li>
</ul><br>
  
 
  <div class="list_write_bt" id="reviewlist_write_bt">
       <a href="#"><span><b>글 쓰기</b></span></a>  
  </div> 
  
  <!-- =============검색================== -->
    <table>
      <tr>
       <td>
       <span include="form-input-select2()">
       <select required>
			    <option value=""  hidden> == 전체 == </option>
			    normal options
			    <option value="1"> == 전체 == </option>
			    <option value="2">작성자+글제목</option>
			    <option value="3">작성자</option>
			    <option value="4">글제목</option>
			  </select>
			  </span>
       </td>
       <td>
           <form class="searchform2 cf">
			  <span><input type="text" placeholder="검색해보세요!^_^"></span>
			  <span><button type="button" class="list_searchbt">검색</button></span>
		   </form>
       </td>
     </tr>
   </table> 
  
  </center>
  </div>
    
    
    <!-- ========================두번째탭======================= -->
    <div class="tabBlock-pane">
       <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
        <th style="text-align: center;"><span>title</span></th>
        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
        <th style="text-align: center;"><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">10</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">9</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">8</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">7</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">6</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">5</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">4</td>
         <td><a href=# style="font-size:13px;">두번째탭입니당</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">3</td>
         <td><a href=# style="font-size:13px;">가디에 콩국수 맛집을 찾았어요!!</a>
             <input type="button" readonly="readonly" class="reply_num"  value="13"  style="cursor: default;" ></td>
         <td>배고푸다</td>
         <td>21233</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">300</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">100</td>
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">2</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="3"  style="cursor: default;" ></td>
         <td>맥도날드드</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-09 12:25</td>
      </tr>
      
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">1</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디디비디비디디디딥</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-6-9</td>
      </tr>
    </tbody>
  </table> 
  
  <!-- ------- paging 처리-------------- -->
   <center>
  <ul class="pagination modal-1" id="pagination">
  <li><a href="#" class="prev">&laquo</a></li>
  <li><a href="#" class="prev">prev</a></li>
  <li><a href="#" class="active">1</a></li>
  <li> <a href="#">2</a></li>
  <li> <a href="#">3</a></li>
  <li> <a href="#">4</a></li>
  <li> <a href="#">5</a></li>
  <li> <a href="#">6</a></li>
  <li> <a href="#">7</a></li>
  <li> <a href="#">8</a></li>
  <li> <a href="#">9</a></li>
  <li><a href="#" class="next">next</a></li>
  <li><a href="#" class="next">&raquo;</a></li>
</ul><br>
  
 
  <div class="list_write_bt" id="reviewlist_write_bt">
       <a href="#"><span><b>글 쓰기</b></span></a>  
  </div> 
  
  <!-- =============검색================== -->
    <table>
      <tr>
       <td>
       <span include="form-input-select2()">
       <select required>
			    <option value=""  hidden> == 전체 == </option>
			    normal options
			    <option value="1"> == 전체 == </option>
			    <option value="2">작성자+글제목</option>
			    <option value="3">작성자</option>
			    <option value="4">글제목</option>
			  </select>
			  </span>
       </td>
       <td>
           <form class="searchform2 cf">
			  <span><input type="text" placeholder="검색해보세요!^_^"></span>
			  <span><button type="button" class="list_searchbt">검색</button></span>
		   </form>
       </td>
     </tr>
   </table> 
  
  </center>
  </div>
  <!-- ===============================세번째탭=========================================== -->  
    <div class="tabBlock-pane">
       <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
        <th style="text-align: center;"><span>title</span></th>
        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
        <th style="text-align: center;"><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
    
     
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">10</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">9</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">8</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">7</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">6</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">5</td>
         <td><a href=# style="font-size:13px;">세번째 탭입니다!!!</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-23 9:59</td>
      </tr>
    
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">4</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으</a>
           <input type="button" readonly="readonly" class="reply_num"  value="53" style="cursor: default;" >
         </td> 
         <td>배고푸다배고프다다다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td> 
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>  
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">3</td>
         <td><a href=# style="font-size:13px;">가디에 콩국수 맛집을 찾았어요!!</a>
             <input type="button" readonly="readonly" class="reply_num"  value="13"  style="cursor: default;" ></td>
         <td>배고푸다</td>
         <td>21233</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">300</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">100</td>
         <td>2016-06-09 12:25</td>
      </tr>

      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">2</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="3"  style="cursor: default;" ></td>
         <td>맥도날드드</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-06-09 12:25</td>
      </tr>
      
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">1</td>
         <td><a href=# style="font-size:13px;">맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디디비디비디디디딥</a> 
             <input type="button" readonly="readonly" class="reply_num"  value="27"  style="cursor: default;" ></td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td><img alt="like" src="/matna/resource/images/good.PNG">10</td>
         <td><img alt="bad" src="/matna/resource/images/sad.PNG">3</td>
         <td>2016-6-9</td>
      </tr>
     
    </tbody>
  </table> 
  
  <!-- ------- paging 처리--------- -->
   <center>
  <ul class="pagination modal-1" id="pagination">
  <li><a href="#" class="prev">&laquo</a></li>
  <li><a href="#" class="prev">prev</a></li>
  <li><a href="#" class="active">1</a></li>
  <li> <a href="#">2</a></li>
  <li> <a href="#">3</a></li>
  <li> <a href="#">4</a></li>
  <li> <a href="#">5</a></li>
  <li> <a href="#">6</a></li>
  <li> <a href="#">7</a></li>
  <li> <a href="#">8</a></li>
  <li> <a href="#">9</a></li>
  <li><a href="#" class="next">next</a></li>
  <li><a href="#" class="next">&raquo;</a></li>
</ul><br>
  
 
  <div class="list_write_bt" id="reviewlist_write_bt">
       <a href="#"><span><b>글 쓰기</b></span></a>  
  </div> 
  
  <!-- =============검색================== -->
    <table>
      <tr>
       <td>
       <span include="form-input-select2()">
       <select required>
			    <option value=""  hidden> == 전체 == </option>
			    normal options
			    <option value="1"> == 전체 == </option>
			    <option value="2">작성자+글제목</option>
			    <option value="3">작성자</option>
			    <option value="4">글제목</option>
			  </select>
			  </span>
       </td>
       <td>
           <form class="searchform2 cf">
			  <span><input type="text" placeholder="검색해보세요!^_^"></span>
			  <span><button type="button" class="list_searchbt">검색</button></span>
		   </form>
       </td>
     </tr>
   </table> 
  
  </center>
  </div>
    </div>
</figure>
</div>   
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>