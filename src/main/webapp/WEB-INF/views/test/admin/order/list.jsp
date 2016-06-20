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
		
		// 이전 검색조건 유지
		if('${searchId}' != ''){
			$("[name=searchId]").val('${searchId}');
			$("[name=search]").val('${search}');
		}
		
		$('#cancel').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length>=1){
				$('input[name=ck]:checked').each(function(index){
					var state = $(this).parent().parent().find('input[name=state]').val();
					var item = $(this).parent().parent().find('input[name=item]').val();
					var cnt = $(this).parent().parent().find('input[name=cnt]').val();
					var giver = $(this).parent().parent().find('input[name=giver]').val();
					if(state==0){
						$.ajax({
							url:'/matna/admin/cancelOrder',
							data:{
								item:item,
								cnt:cnt,
								giver:giver,
								ono:$(this).val()
							},
							success:function(){
								document.location.href = "/matna/admin/orderlistall";
							}
						})
					}else{
						alert("발송완료 상품은 주문취소가 불가능 합니다.");
						$('input[name=ck]:checked').each(function(){ this.checked = false;});
					}
				});
			}else{
				alert("주문취소를 하나만 선택해 주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}
		});
		
		$('#delete').click(function(){
			var length = $('input[name=ck]:checked').length;
			if(length>=1){
				$('input[name=ck]:checked').each(function(index){
					var state = $(this).parent().parent().find('input[name=state]').val();
					
					if(state==1){
					$.ajax({
						url:'/matna/admin/deleteOrder',
						data:{
							ono:$(this).val()
						},
						success:function(){
							document.location.href = "/matna/admin/orderlistall";
						}
					});
					}else{
						alert("발송전 상품은 주문목록 삭제가 불가능 합니다.");
						$('input[name=ck]:checked').each(function(){ this.checked = false;});
					}
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
					var state = $(this).parent().parent().find('input[name=state]').val();
					$.ajax({
						url:'/matna/admin/updateOrderState',
						data:{
							ono:$(this).val(),
							state:state
						},
						success:function(){
							document.location.href = "/matna/admin/orderlistall";
						}
					});
				});
			}else{
				alert("배송상태 변경을 하나 이상 선택 해주세요");
				$('input[name=ck]:checked').each(function(){ this.checked = false;});
			}

		});	
		
		
	});
</script>

</head>
<%@include file="/WEB-INF/views/main/admin/adminHeader.jsp" %>
<body>
	<center>
		<h3>주문 리스트</h3>
		<hr>
		<table border="1">
			<tr>
				<td></td>
				<td class="name">구매자</td>
				<!-- <td class="name">수령인</td> -->
				<td class="name">주문상품</td>
				<td class="name">주문수량</td>
				<td class="name">주문날짜</td>
				<td class="val" id="flag">배송상태</td>
				<td class="name">배송주소</td>
			</tr>
			<c:forEach items="${orders}" var="order">
			<tr>
				<td><input type="checkbox" name="ck" value="${order.ono}"></td>
				<td class="val" id="giver"><input type="hidden" name="giver" value="${order.giver}">${order.giverid}</td>
			<%-- 	<td class="val" id="taker"><input type="hidden" name="takerid" value="">${order.takerid}</td> --%>
				<td class="val" id="item"><input type="hidden" name="item" value="${order.item}">${order.itemname}</td>
				<td class="val" id=cnt ><input type="hidden" name="cnt" value="${order.cnt}">${order.cnt}</td>
				<td class="val" id="orderDate">${order.orderDate}</td>
				<td class="val" id="state">
				<input type="hidden" name="state" value="${order.state}">
					<c:if test="${order.state==0}">
						<c:set var="state" value="발송전"/>
					</c:if>
					<c:if test="${order.state==1}">
						<c:set var="state" value="발송완료"/>
					</c:if>
					${state}
				</td>
				<td class="val" id="addr">${order.addr}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="right">
				<input type="button" value="목록보기" onclick="javascript:document.location.href='/matna/admin/orderlistall'">
				<input type="button" value="배송상태 변경" id="update">
				<input type="button" value="주문취소" id="cancel">
				<input type="button" value="발송완료 제거" id="delete">
				</td>
			</tr>
		</table>
		<br>
		<form action="/matna/admin/orderlistall" method="get">
			<select name="searchId">
				<option value="buyer">구매자</option>
				<option value="receiver">수령인</option>
			</select>
			<input type="text" id="text" name="search" placeholder="아이디로 검색합니다.">
			<input type="submit" value="검색">
		</form>
		
		
	<br>
	<div>
			<c:if test="${pageMaker.prev}">
				<a name="page" href="${pageMaker.startPage - 1}">&laquo;</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<a name="page" href="/matna/admin/orderlistall?page=${idx}&search=${search}&searchId=${searchId}">${idx}</a>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a name="page" href="${pageMaker.endPage +1}">&raquo;</a>
			</c:if>
	</div>
	<br>

	</center>
</body>
</html>