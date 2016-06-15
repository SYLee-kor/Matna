<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="">
	<meta name="keywords" content="" />
	<meta name="viewport" content="initial-scale=1">
	
<style type="text/css">
.image{
   width :150px;
   height: 100px;
} 

</style>
</head>
<body>

<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<br>
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
      <c:forEach var="reviewDTO" items="list">
      <tr>
         <td>${reviewDTO.no }</td>
         <td><img src="${reviewDTO.photo }" class="image" /></td>
         <td><a href=#>${reviewDTO.title }</a> [5]</td>  <!-- title,조회수 -->
         <td>${reviewDTO.nickName }</td>
         <td>${reviewDTO.replyCnt }</td>   <!-- 댓글수 -->
         <td>${reviewDTO.good }</td>  <!-- 좋아요 -->
         <td>${reviewDTO.bad }</td>  <!-- 싫어요 -->
         <td>${reviewDTO.regdate }</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  <!-- ===================== paging 처리======================= -->
  <ul class="pagination modal-1" id="pagination">
  <c:if test="${pageMaker.prev }">
  <li><a class="prev" onclick="showPage('${tabType}',${pageMaker.beforePage})">&laquo</a></li>
  </c:if>
  <li><a class="prev" onclick="showPage('${tabType}',${pageMaker.prevPage})">이전</a></li>
  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
  <li><a onclick="showPage('${tabType}',${stat.index})">${stat.index }</a></li>
  </c:forEach>
  <li><a class="next" onclick="showPage('${tabType}',${pageMaker.nextPage})">다음</a></li>
  <c:if test="${pageMaker.next }">
  <li><a class="next" onclick="showPage('${tabType}',${pageMaker.afterPage})">&raquo;</a></li>
  </c:if>
</ul><br>
 </div> 
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>