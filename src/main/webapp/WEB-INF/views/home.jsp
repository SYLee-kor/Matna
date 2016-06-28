<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="matnaHeader.jsp" %>  
  <!-- header추가  -->
<style type="text/css">
		/* 미니리스트 이미지 사이즈  */
		
		.miniimage{
		   width :100px;
		   height: 70px;
		 }
</style>
<script type="text/javascript">
 if('${param.login}'!='') alert('먼저 로그인 해주세요.');
</script>
</head>
<body> 
	<!-- review 게시판 -->
  	<%@include file="/WEB-INF/views/main/body/review/miniList.jsp" %>  
  	<%@include file="/WEB-INF/views/main/body/community/all/miniList.jsp" %>  
  
    <!-- footer start -->
    <%@include file="footer.jsp" %>
    <!-- footer end --> 
</body>
</html>