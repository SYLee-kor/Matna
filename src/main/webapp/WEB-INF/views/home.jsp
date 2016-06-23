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

  <%@include file="/WEB-INF/views/main/body/review/menu/all/miniList.jsp" %>  
 

   <div class="container">
    	<div class="row">
   <!-- Review miniList 영역 -->
<%--    <div class="col-md-6 col-sm-6">
    	<% pageContext.setAttribute("listType", "mini"); %>
    	<% pageContext.setAttribute("pageType", "review"); %>
    	<%@include file="/WEB-INF/views/main/body/review/list.jsp" %>
   </div> --%>
   <!-- Review Ranking miniList 영역 -->
<%--    <div class="col-md-6 col-sm-6">
    	<% pageContext.setAttribute("pageType", "ranking"); %>
    	<%@include file="/WEB-INF/views/main/body/review/list.jsp" %>
   </div> --%>
    	<!--============== free게시판 ================-->
   <div class="col-md-6 col-sm-6">
            	
       <div id="freetable">
		  <h1>Free Board</h1>
		  
		  <table id="free_table" cellpadding="0">
		    <thead>
		      <tr>
		        <th><span>title</span></th>
		        <th><span>author</span></th>
		        <th><span>조회수</span></th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		         <td><a href=#>가산 전주칼국수 먹어보신분 정말맛있나요????</a> [13]</td>
		         <td>우리지금맛나맛나안녕</td>
		         <td>60</td>
		      </tr>
		    </tbody>
		  </table>
		 </div> 
       </div>
            
            <!--============== Meeting게시판 ================-->
        	<div class="col-md-6 col-sm-6">
              <div id="meetingtable">
			  <h1>Meeting Board</h1>
			  
			  <table id="meeting_table" cellspacing="0" cellpadding="0">
			    <thead>
			      <tr>
			        <th><span>title</span></th>
			        <th><span>author</span></th>
			        <th><span>조회수</span></th>
		          </tr>
			    </thead>
			    <tbody>
			      <tr>
			         <td><a href="#">가디에서 치맥한잔하실분~~~~~~~~~~!!!!!!!!!!!</a> [5]</td>
			         <td>정정원ㅎㅎㅎㅎㅎㅎㅎ</td>
			         <td>20</td>
			      </tr>
			
			      <tr>
			         <td><a href="#">역시 일이끝난뒤에는 한잔 똑</a></td>
			         <td>이수용</td>
			         <td>12</td>
			      </tr>
			
			      <tr>
			         <td><a href="#">신전떡볶이 먹고싶다 누구같이갈사람없냐</a></td>
			         <td>이남흔</td>
			         <td>22</td>
			      </tr>
			      
			      <tr>
			         <td><a href="#">일 끝나고 가디에서 한잔 하시는분~~~</a></td>
			         <td>이창ㅇ원입니다</td>
			         <td>14</td>
			      </tr>
			    </tbody>
			  </table>
			 </div> 
           </div>
         </div>
     </div>
      
        	   	
        	
    <!-- footer start -->
    <%@include file="footer.jsp" %>
    <!-- footer end --> 
</body>
</html>