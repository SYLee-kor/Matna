<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인성공</title>
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script>
$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#logout').click(function() {
			formObj.attr("action", "/matna/login/logout");
			formObj.submit();
		});
		
		$('#message').click(function() {
			formObj.attr("action", "/matna/message/sendList");
			formObj.submit();
		});
	}); 
</script>

</head>


<body>
<form role="form" name="memberinfo" method="post">
    <label class="nickname" name="nickname">
    	${nickname } 님 반갑습니다~~!!</label><br>
    <label class="point" name="point">
          POINT: ${point } </label><br>
  <input class="mypage" type="submit" id="mypage" name="mypage" value="MyPage">
  <input class="logout" type="submit" id="logout"  name="logout" value="logout">
  <input class="message" type="submit" id="message"  name="message" value="message">
</form>
</body>

</html>