<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<figure class="tabBlock">
  <ul class="tabBlock-tabs">
    <li class="tabBlock-tab is-active">상품 상세정보</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
	<table id="detailTable" border="0">
		<tr>
			<td rowspan="5" colspan="2" class="photo"><img alt="사진1" 
					width="250" height="150"></td>
			<td class="name">이름</td>
			<td class="val">${detail.name }</td>
		</tr>
		<tr>
			<td class="name">가격</td>
			<td class="val">${detail.price }</td>
		</tr>
		<tr>
			<td class="name">남은 수량</td>
			<td class="val">${detail.amount }</td>
		</tr>
		<tr>
			<td class="name">정보</td>
			<td class="val">${detail.content }</td>
		</tr>
<!-- 		<tr>
			<td colspan="4" class="info"></td>
		</tr> -->
	</table>
	<br><br>
	<input type="button" value="구매" >
	<input type="button" value="뒤로" onclick="javascript:location.href='/Matna/item/item.do'">
	</center>
	</div></div></figure>
</body>
</html>