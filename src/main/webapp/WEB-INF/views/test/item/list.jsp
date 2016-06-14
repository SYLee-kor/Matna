<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active">상품</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
    
    
	<!-- table시작 -->
	<table id="itemTable" align="center" cellpadding="30">
		<c:forEach begin="0" end="2" varStatus="i" >
		<tr>
			<c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="itemVO" items="${list}">
			<td>
				
				<table onclick="javascript:document.location.href='/matna/item/itemdetail?ino=${itemVO.ino}'">
					<tr>
						<td colspan="2"><img alt="사진1" src="/matna/resource/img/${itemVO.photo}" width="200" height="200"></td>
					</tr>
					<tr>
						<td>${itemVO.name }</td>
						<td>${itemVO.price}</td>
					</tr>
				</table>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>	
	
			
	<!-- table끝 -->
	<br>
	<table align="center">
	<tr>
	<td>
		<br> 
		<form action="/matna/item/itemSeach">
			<input type="text" size="20" placeholder="상품명 입력" name="title"> 
			<input type="submit" value="검색">
		</form>
	</td>
	</tr>	
	</table>

	</div>
	</div></figure>

</body>
</html>