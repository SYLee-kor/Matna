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
    <li class="tabBlock-tab is-active">상품 구매</li>
  </ul>
  <div class="tabBlock-content">
    <div class="tabBlock-pane">
    
	<table id="buyTable" align="center" cellpadding="20">
	<!-- 구매자정보 시작-->
	<tr><td>
	<table border="1" >
		<tr><th align="left" colspan="2" style="size: 5; ">구매자 정보</tr>
		<tr><th>이름</th><td></td></tr>
		<tr><th>이메일</th><td></td></tr>
		<tr><th>전화번호</th><td></td></tr>
		<tr><th>우편번호</th><td></td></tr>
		<tr><th>배송지</th><td></td></tr>
	</table>
	</td></tr>
	<!-- 구매자정보 끝-->
	<br><br>
	<!-- 상품정보 시작-->
	<tr><td>
	<table border="1">
		<tr>
			<td rowspan="5" colspan="2" class="photo"><img alt="사진1" 
					width="250" height="150"></td>
			<th class="name">이름</th>
			<td width="100px"></td>
		</tr>
		<tr>
			<th class="name">가격</th>
			<td width="100px"></td>
		</tr>
		<tr>
			<th class="name">남은 수량</th>
			<td width="100px"></td>
		</tr>
		<tr>
			<th class="name">정보</th>
			<td width="100px"></td>
		</tr>
	</table>
	</td></tr>
	<!-- 상품정보 끝-->
	<br><br>
	<!-- 포인트 시작-->
	<tr><td>
	<table>
		<tr><th colspan="5" style="text-align: left;">포인트</th></tr>
		<tr style="text-align: center;"><th>현재 포인트</th><th></th><th>구매 포인트</th><th></th><th>남은 포인트</tr>
		<tr style="text-align: center;"><td></td><td>-</td><td></td><td>=</td><td></td></tr>
	</table>
	</td></tr>
	<!-- 포인트 끝-->
	</table>
	
	<br><br>
	<div align="center">
	<%-- <form action="/Matna/item/item.do" method="post">
		<input type="hidden" name="action" value="plus">
		<input type="hidden" name="point" value="<%=(minfo.getPoint()-item.getPrice()) %>">
		<input type="hidden" name="name" value="<%=minfo.getName()%>">
		<input type="hidden" name="title" value="<%=item.getTitle()%>">
		<input type="hidden" name="cnt" value="<%=item.getCnt()%>">
		<input type="hidden" name="price" value="<%=item.getPrice()%>">
		<input type="hidden" name="no" value="<%=item.getNo()%>">
		<input type="hidden" name="amount" value="<%=item.getAmount()%>">
		<input type="submit" value="구매">
	<input type="button" value="취소" onclick="javascript:location.href='/Matna/item/item.do'">
	</form> --%>
	</div>
	</div>
	</div></figure>
</body>
</html>