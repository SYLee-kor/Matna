<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <form action="/matna/item/buy">
	<table id="detailTable" border="0">
		<tr>
			<td rowspan="5" colspan="2" class="photo">
			<img alt="사진1" src="/matna/resource/img/${detailItem.photo}" width="250" height="150"></td>
			<td class="name">이름</td>
			<td class="val"><input type="hidden" name="name" value="${detailItem.name }"> ${detailItem.name }</td>
		</tr>
		<tr>
			<td class="name">가격</td>
			<td class="val"><input type="hidden" name="price" value="${detailItem.price }">${detailItem.price }</td>
		</tr>
		<tr>
			<td class="name">남은 수량</td>
			<td class="val"><input type="hidden" name="ino" value="${detailItem.ino}">${detailItem.amount }</td>
		</tr>
		<tr>
			<td class="name">정보</td>
			<td class="val"><input type="hidden" name="content" value="${detailItem.content }">${detailItem.content }</td>
		</tr>
<!-- 		<tr>
			<td colspan="4" class="info"></td>
		</tr> -->
	</table>
	<br><br>
	<input type="button" value="-" name="buyDown" onclick="buyCountChange(-1)">
	<input type="text" value="1" name="buyCount" >
	<input type="button" value="+" name="buyUp" onclick="buyCountChange(1)">
	
	<input type="submit" value="구매">
	<input type="button" value="뒤로" onclick="javascript:location.href='/matna/item/itemlistall'">
    </form>
	</div></div></figure>
</body>
</html>