<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="description" content="">
	<meta name="keywords" content="" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="initial-scale=1">
	
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="/struts/css/animate.css">
	<link rel="stylesheet" href="/struts/css/bootstrap.min.css">
	<link rel="stylesheet" href="/struts/css/font-awesome.min.css">
	<link rel="stylesheet" href="/struts/css/templatemo_misc.css">
	<link rel="stylesheet" href="/struts/css/reviewList.css">
  <!--   <link rel="stylesheet" href="css/matnaHeader.css">  -->
	
    <!-- JavaScripts -->
	<script src="/struts/js/jquery-1.10.2.min.js"></script>
	<script src="/struts/js/jquery.singlePageNav.js"></script>
	<script src="/struts/js/jquery.flexslider.js"></script>
	
	<script src="/struts/js/custom.js"></script>
    <script src="/struts/js/jquery-1.10.2.min.js"></script>
	<script src="/struts/js/jquery.lightbox.js"></script>
	<script src="/struts/js/templatemo_custom.js"></script>
    <script src="/struts/js/jquery-git2.js"></script><!-- previous next script -->


    <title>우리지금 Matna!!</title>

<style type="text/css">
.image{
   width :150px;
   height: 100px;
}

</style>
</head>
<body>

<%@include file="matnaHeader.jsp" %>
</br>
<div class="col-md-1 col-sm-1"></div>
<div class="col-md-10 col-sm-10">
 <div id="reviewList">
  <h1>Review</h1>
  <input type="button" value="글쓰기">
  <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th><span>no</span></th>
        <th><span>image</span></th>
        <th><span>title</span></th>
        <th><span>author</span></th>
        <th><span>조회수</span></th>
        <th><span>좋아요!</span></th>
        <th><span>싫어요!</span></th>
        <th><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
         <td>4</td>
         <td><img src="/struts/images/AD_pizza.jpg" class="image" /></td>
         <td><a href=#>맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디</a> [5]</td>  <!-- title,조회수 -->
         <td>배고푸다배고프다</td>
         <td>2</td>   <!-- 댓글수 -->
         <td>10</td>  <!-- 좋아요 -->
         <td>3</td>  <!-- 싫어요 -->
         <td>2016-06-09 12:25</td>
      </tr>

      <tr>
         <td>3</td>
         <td><img src="/struts/images/AD_bugerking.jpg" class="image" alt="" /></td>
         <td><a href=#>맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디</a> [1]</td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td>10</td>
         <td>3</td>
         <td>2016-06-09 12:25</td>
      </tr>

      <tr>
         <td>2</td>
         <td><img src="/struts/images/AD_bugerking.jpg"  class="image" alt="" /></td>
         <td><a href=#>맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디</a> [2]</td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td>10</td>
         <td>3</td>
         <td>2016-06-09 12:25</td>
      </tr>
      
      <tr>
         <td>1</td>
         <td><img src="/struts/images/AD_bugerking.jpg" class="image" alt="" /></td>
         <td><a href=#>맥도나아ㅏ아아아아아앙아아아아알드으으으으으 베토디베토디베토디</a> [3]</td>
         <td>배고푸다배고프다</td>
         <td>2</td> 
         <td>10</td>
         <td>3</td>
         <td>2016-6-9</td>
      </tr>
    </tbody>
  </table>
  
  <!-- ===================== paging 처리======================= -->
  <ul class="pagination modal-1" id="pagination">
  <li><a href="#" class="prev">&laquo</a></li>
  <li><a href="#" class="prev">&#706;</a></li>
  <li><a href="#" class="active">1</a></li>
  <li> <a href="#">2</a></li>
  <li> <a href="#">3</a></li>
  <li> <a href="#">4</a></li>
  <li> <a href="#">5</a></li>
  <li> <a href="#">6</a></li>
  <li> <a href="#">7</a></li>
  <li> <a href="#">8</a></li>
  <li> <a href="#">9</a></li>
  <li><a href="#" class="next">&#62;</a></li>
  <li><a href="#" class="next">&raquo;</a></li>
</ul><br>
  
  
  <!-- =============검색================== -->
  <form class="searchform cf">
  <input type="text" placeholder="검색해보세요!^_^">
  <button type="submit">검색</button>
  </form>

 
 </div> 
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>