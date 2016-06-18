<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#update').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length==1){
				$('input[name=ck]:checked').each(function(index){
					var ino= $(this).val()
					document.location.href = "/matna/admin/detailitem?ino="+ino;
				});
			}else{
				alert("상세보기를 하나만 선택해 주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}
		});//#update click
		
		$('#delete').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length>=1){
				$('input[name=ck]:checked').each(function(index){
					$.ajax({
						url:'/matna/admin/itemdelete',
						data:{
							ino: $(this).val()
						},
						success:function(){
							document.location.href = "/matna/admin/itemlistall";
						}
					});
				});
			}else{
				alert("삭제를 하나 이상 선택해 주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}
		});	//#delete click
		
	});
</script>
</head>
<body>
	<center>
		<h3>상품 리스트</h3>
		<hr>
		<table border="1">
				<tr>
				<th class="name"></th>
				<th class="name">상품명</th>
				<th class="name">가격</th>
				<th class="name">수량</th>
				<th class="name">신상/핫</th>
				</tr>
			<c:forEach items="${items}" var="item">
			<tr>
				<td><input type="checkbox" name="ck" value="${item.ino}"></td>
				<td class="val" id="name">${item.name}</td><!-- item.getTitle()  -->
				<td class="val" id="price">${item.price}</td>
				<td class="val" id="cnt">${item.amount}</td>
				<c:if test="${item.state==0}">
					<c:set var="state" value="일반 상품"/>
				</c:if>
				<c:if test="${item.state==1}">
					<c:set var="state" value="신상품"/>
				</c:if>
				<c:if test="${item.state==2}">
					<c:set var="state" value="인기 상품"/>
				</c:if>
					<td class="val" id="cnt2">${state}</td>
			</tr>
			</c:forEach>	
		</table>
		<br>
		
		<form action="/matna/admin/item" method="get">
			<input type="button" value="전체 목록" onclick="javascript:document.location.href='/matna/admin/itemlistall'">
			<input type="submit" value="추가">
			<input type="button" value="제거" id="delete">
			<input type="button" value="상세보기" id="update">
		</form>

		<br>
		<form action="/matna/admin/itemlistall" method="get">
			<input type="text" id="text" name="search" placeholder="상품명으로 검색합니다.">
			<input type="submit" value="검색">
		</form>
		<br>
		
	<br>
	<div>
			<c:if test="${pageMaker.prev}">
				<a name="page" href="${pageMaker.startPage - 1}">&laquo;</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<a name="page" href="/matna/admin/itemlistall?page=${idx}&search=${search}">${idx}</a>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a name="page" href="${pageMaker.endPage +1}">&raquo;</a>
			</c:if>
	</div>
	<br>
	
	</center>
</body>
</html>