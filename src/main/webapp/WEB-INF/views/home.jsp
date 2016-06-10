<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="matnaHeader.jsp" %>  
  <!-- header추가  -->
<style type="text/css">
		/* 미니리스트 이미지 사이즈  */
		
		.miniimage{
		   width :130px;
		   height: 85px;
		 }
</style>
</head>
<body> 
        
    <!-- ================== mini리뷰  =====================   -->  
<div class="container">
  <div class="row">
   <div class="col-md-12 col-sm-12">
            	
    <div id="reviewtable">
	<div class="tabs">
      <div class="tab">
	   <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
	    <label for="tab-1" class="tab-label">식사</label>
	     <div class="tab-content">
		    <table id="review_table" cellspacing="0" cellpadding="0">
		    <thead>
		      <tr>
		        <th><span>image</span></th>
		        <th><span>title</span></th>
		        <th><span>author</span></th>
		        <th><span>like!</span></th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>맥날 첫번째 탭입니다~!!</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg"alt="" class="miniimage"/></td>
		         <td><a href=#>치맥치맥치맥치맥궄ㅇ~~~~~~~~</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>첫번째 탭입니다~!!</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		      
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>첫번째 탭입니다~!!</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		    </tbody>
		  </table>
    </div>
  </div>
 
  <div class="tab">
     <input type="radio" name="css-tabs" id="tab-2" class="tab-switch" class="miniimage">
     <label for="tab-2" class="tab-label">디저트</label>
     <div class="tab-content">
         <table id="review_table" cellspacing="0" cellpadding="0">
		    <thead>
		      <tr>
		        <th><span>image</span></th>
		        <th><span>title</span></th>
		        <th><span>author</span></th>
		        <th><span>like!</span></th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt=""  class="miniimage"/></td>
		         <td><a href=#>두번째 탭입니다~!!</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>세번째 탭입니다~!!</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		      
		      <tr>
		         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
		         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
		         <td>우리지금맛나!</td>
		         <td>23</td>
		      </tr>
		    </tbody>
		  </table>
   </div>
  </div>
 
  <div class="tab">
    <input type="radio" name="css-tabs" id="tab-3" class="tab-switch">
    <label for="tab-3" class="tab-label">주류</label>
    <div class="tab-content">
	    <table id="review_table" cellspacing="0" cellpadding="0">
	    <thead>
	      <tr>
	        <th><span>image</span></th>
	        <th><span>title</span></th>
	        <th><span>author</span></th>
	        <th><span>like!</span></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
	         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
	         <td>우리지금맛나!</td>
	         <td>23</td>
	      </tr>
	
	      <tr>
	         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
	         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
	         <td>우리지금맛나!</td>
	         <td>23</td>
	      </tr>
	
	      <tr>
	         <td><img src="/struts/images/AD_pizza.jpg" alt="" class="miniimage"/></td>
	         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
	         <td>우리지금맛나!</td>
	         <td>23</td>
	      </tr>
	      
	      <tr>
	         <td><img src="/struts/images/AD_bugerking.jpg" alt="" class="miniimage"/></td>
	         <td><a href=#>가디 맛집 전주 칼국수 한번 가보세요~~~~~~~~</a></td>
	         <td>우리지금맛나!</td>
	         <td>23</td>
	      </tr>
	    </tbody>
	  </table>
    </div>
   </div>
  </div>
</div>
</div>
</div>
</div>


    <!--============== mini자유게시판, mini만남게시판, mini리뷰 ==============================-->
    <!-- image크기 조절은 minilist.css - .miniimage에서  -->
   <div class="container">
    	<div class="row">
    	
    	<!--============== free게시판 ================-->
   <div class="col-md-6 col-sm-6">
            	
       <div id="freetable">
		  <h1>Meeting Board</h1>
		  
		  <table id="free_table" cellspacing="0" cellpadding="0">
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
		
		      <tr>
		         <td><a href=#>오늘은 금요일입니당</a> [155]</td>
		         <td>더반</td>
		         <td>250</td>
		      </tr>
		
		      <tr>
		         <td><a href=#>보쌈정식</a> [25]</td>
		         <td>맛나최고</td>
		         <td>50</td>
		      </tr>
		      
		      <tr>
		         <td><a href=#>보쌈정식</a> [25]</td>
		         <td>맛나최고</td>
		         <td>50</td>
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
			         <td>정정원</td>
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