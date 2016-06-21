<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	function buyCountChange(no) { // +,- 버튼 구현
		var buyCount = $('[name=buyCount]')
			var changeNum = Number(buyCount.val())+no
			if(changeNum < 1 ) changeNum = 1;
			else if (changeNum > Number('${detailItem.amount}')) changeNum = Number('${detailItem.amount}');
			buyCount.val( changeNum );
	}
	
</script>
<body>
	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active">상품 상세정보</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
    <c:choose>
    	<c:when test="${detailItem.state!=3}">
    	<form action="/matna/item/buy">
    	</c:when>
    	<c:otherwise>
    	<form action="/matna/item/gift">
    	</c:otherwise>
    </c:choose>
	<table id="detailTable" border="0">
		<tr>
			<td rowspan="5" colspan="2" class="photo">
			<img alt="사진1" src="/matna/resource/img/${detailItem.photo}" width="250" height="150"></td>
			<td class="name">이름</td>
			<td class="val"><input type="hidden" name="name" value="${detailItem.name }"> ${detailItem.name }</td>
		</tr>
		<!-- 1ino가 5천이 아닐때 -->
		<tr>
	<c:choose>
		<c:when test="${detailItem.state!=3}">
			<td class="name">가격</td>
			<td class="val"><input type="hidden" name="price" value="${detailItem.price }">${detailItem.price }</td>
		</c:when>
		<c:otherwise>
			<td class="name">수령자 닉네임</td>
			<td class="val"><input type="text" name="taker" ></td>
		</c:otherwise>
	</c:choose>
		</tr>
		<tr>
	<c:choose>
		<c:when test="${detailItem.state!=3}">
			<td class="name">남은 수량</td>
			<td class="val"><input type="hidden" name="ino" value="${detailItem.ino}">${detailItem.amount }</td>
		</c:when>
		<c:otherwise>
			<td class="name">선물 POINT</td>
			<td class="val">
				<select name="point">
					<option value="500">500P</option>
					<option value="1000">1,000P</option>
					<option value="5000">5,000P</option>
					<option value="10000">10,000P</option>
				</select>
			</td>
		</c:otherwise>
	</c:choose>
		</tr>
		<!-- 포인트 구매일때 -->
		<tr>
			<td class="name">정보</td>
			<td class="val"><input type="hidden" name="content" value="${detailItem.content }">${detailItem.content }</td>
		</tr>
<!-- 		<tr>
			<td colspan="4" class="info"></td>
		</tr> -->
	</table>
	<br><br>
	<c:if test="${detailItem.state!=3}">
		<input type="button" value="-" name="buyDown" onclick="buyCountChange(-1)">
		<input type="text" value="1" name="buyCount" >
		<input type="button" value="+" name="buyUp" onclick="buyCountChange(1)">
	</c:if>
	
	<c:choose>
		<c:when test="${detailItem.state!=3}">
			<input type="submit" value="구매">
		</c:when>
		<c:otherwise>
			<input type="submit" value="선물">
		</c:otherwise>
	</c:choose>
	<input type="button" value="뒤로" onclick="javascript:location.href='/matna/item/itemSearch'">
    </form>
	</div></div></figure>
</body>
</html>