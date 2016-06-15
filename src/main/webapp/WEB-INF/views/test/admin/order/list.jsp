<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#detail').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length==1){
				$('input[name=ck]:checked').each(function(index){
					window.open("/Matna/admin/members/list.do?action=oselectSearch&id="+$(this).val(), "상세보기", "width=500,height=400");
					$('input[name=ck]:checked').each(function(){ this.checked = false;});
				});
			}else{
				alert("상세보기를 하나만 선택해 주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}
		});
		
		$('#delete').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length>=1){
				$('input[name=ck]:checked').each(function(index){
					$.ajax({
						url:'/matna/admin/deleteOrder',
						data:{
							ono:$(this).val()
						},
						success:function(){
							document.location.href = "/matna/admin/orderlistall";
						}
					});
				});
			}else{
				alert("삭제를 하나 이상 선택해 주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}

		});	
		
		$('#update').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length>=1){
				$('input[name=ck]:checked').each(function(index){
					$.ajax({
						url:'/Matna/admin/members/list.do',
						data:{
							action:'oupdate',
							id:$(this).val(),
						},
						success:function(){
							document.location.href = "/Matna/admin/members/list.do?action=oselectAll";
						}
					});
				});
			}else{
				alert("배송상태 변경을 하나 이상 선택 해주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}

		});	
		
		/* $('#search').click(function(){
			var search = $('#text').val();
			$.ajax({
				url:'/Matna/admin/members/list.do',
				data:{
					action:'idselectSearch',
					id:search
				}
		
			});
		}); */
		
	});
</script>
</head>
<body>
	<center>
		<h3>주문 리스트</h3>
		<hr>
		<table border="1">
			<tr>
				<td></td>
				<td class="name">구매자</td>
				<td class="name">수령인</td>
				<td class="name">주문상품</td>
				<td class="name">주문수량</td>
				<td class="name">주문날짜</td>
				<td class="val" id="flag">배송상태</td>
				<td class="name">배송주소</td>
			</tr>
			<c:forEach items="${orders}" var="order">
			<tr>
				<td><input type="checkbox" name="ck" value="${order.ono}"></td>
				<td class="val" id="giver">${order.giver}</td>
				<td class="val" id="taker">${order.taker}</td>
				<td class="val" id="item">${order.item}</td>
				<td class="val" id=cnt>${order.cnt}</td>
				<td class="val" id="orderDate">${order.orderDate}</td>
				<td class="val" id="state">
					<c:if test="${order.state==0}">
						<c:set var="state" value="배송중"/>
					</c:if>
					<c:if test="${order.state==1}">
						<c:set var="state" value="배송완료"/>
					</c:if>
					${state}
				</td>
				<td class="val" id="addr">${order.addr}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="right">
				<input type="button" value="배송완료" id="update">
				<input type="button" value="목록보기" onclick="javascript:document.location.href='/matna/admin/orderlistall'">
				<input type="button" value="상세보기" id="detail">
				<input type="button" value="주문제거" id="delete">
				</td>
			</tr>
		</table>
		<br>
		<form action="/Matna/admin/members/list.do?action=idselectSearch" method="post">
			아이디 <input type="text" id="text" name="id"> <input type="submit" value="검색" id="search">
		</form>
		
	</center>
</body>
</html>