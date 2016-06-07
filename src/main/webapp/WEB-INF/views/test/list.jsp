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
    
    
	<!-- 1행 -->
	<table id="itemTable" align="center" cellpadding="30">
		<c:forEach begin="0" end="2" varStatus="i" >
		<tr>
			<c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="itemVO" items="${list }">
			<td>
				<table>
					<tr>
						<td colspan="2"><img alt="사진1" width="200" height="200"></td>
					</tr>
					<tr>
						<td>${itemVO.name }</td>
						<td>${itemVO.no}</td>
					</tr>
				</table>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>	
	
			
	<!-- 3행끝 -->
	<br>
	<table align="center">
	<tr>
	<td>
		<br> 
		<form action="/Matna/item/item.do?action=selectTitle&&page=${page}" method="post">
			<input type="text" size="20" placeholder="상품명 입력" name="title"> 
			<input type="submit" value="검색">
		</form>
	</td>
	</tr>	
	</table>

	<div align="center">
		<button class="button" >맨앞</button>
		<button class="button" >이전</button>
		
		 <c:forEach var="i" begin="1" end="${totalPage }" >
            <%-- [<a href="javascript:location.href='../main/body/community/free/list.jsp?page=${i}'">${i}</a>] --%>
            [<a href="javascript:location.href='/Matna/item/item.do?page=${i}'">${i}</a>]
         </c:forEach>
         
		<%--<a href="">1</a>|<a href="">2</a>|<a href="">3</a>|<a href="">4</a>|<a href="">5</a> --%>
		<button class="button" >다음</button>
		<button class="button" >맨뒤</button>
	</div>
	</div>
	</div></figure>

</body>
</html>