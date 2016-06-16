<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js" ></script>
<body bgcolor = "#E6E6FA">
<center>
<br><br><br><br><br>
<form method = "get" action = "/matna/find">
	<c:if test="${pageType =='findId' }">
		<c:if test="${result =='success'}">
			${ name} 님의 아이디는 <b>${ pw }</b> 입니다.<p>
			<input type = "button" value = "메인화면" onclick="javascript:window.close()">
	</p></c:if>
	<c:if test="${result =='fail'}">
			입력한 정보에 해당 하는 아이디가 없습니다. 
			<br>이름 또는 이메일을 확인해주세요 .<p>
			<input type = "submit" value = "다시 입력하기">
	</p></c:if></c:if>
	
	<c:if test="${pageType =='findPw' }">
		<c:if test="${result =='success'}">
			${ name} 님의 비밀번호는<b>${ pw } </b> 입니다.<p>
			<input type = "button" value = "메인화면" onclick="javascript:window.close()">
		</p></c:if>
	<c:if test="${result =='fail'}">
			입력한 정보에 해당 하는 비밀번호가 없습니다.
			<br>이름, 아이디 그리고 이메일을 확인해주세요.<p>
			<input type = "submit" value = "다시 입력하기">
	</p></c:if></c:if>
</form>
</center>
</body>
</html>