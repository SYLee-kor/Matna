<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#order').click(function() {
			formObj.attr("action", "/matna/admin/orderlistall");
			formObj.submit();
		});
		
		$('#member').click(function() {
			formObj.attr("action", "/matna/admin/memberList");
			formObj.submit();
		}); 

		$('#message').click(function() {
			formObj.attr("action", "/matna/admin/messageList");
			formObj.submit();
		});
		$('#item').click(function() {
			formObj.attr("action", "/matna/admin/itemlistall");
			formObj.submit();
		});
		
	});
	
</script>

</head>
<body>
	<form role="form" method="get">
		<input type="submit" id="member" name="member" value="회원관리"> 
		<input type="submit" id="order" name="order" value="주문관리"> 
		<input type="submit" id="item" name="item" value="상품관리"> 
		<input type="submit" id="message" name="message" value="쪽지관리"> 
	</form>
</body>
</html>