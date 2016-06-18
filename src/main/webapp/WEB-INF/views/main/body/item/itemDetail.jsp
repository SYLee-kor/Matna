<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<body id="itemorder_bd">
<div id="finalize_order">
	<div id="accordian">
		
 		<div class="step" id="step5">
			<div class="number">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="order_title">
				<label>ITEM DETAIL</label><!-- 상품 상세정보 -->
	        </div>
	    </div>
	        
	           <div class="row">
	           <div class="col-md-6 col-sm-6">
                  <div>
                     <img src="/matna/resource/images/쉑쉑.png" id="order_img"/>
		          </div>			
		       </div>
		       
		       <div class="col-md-6 col-sm-6">
          		  <div class="sub_content"> 
				     <span class="subtitle" id="item_name">이름:&nbsp;&nbsp;맛있는 쉑쉑버거 </span><br><br>
					 <span class="subtitle" id="item_price">가격:&nbsp;&nbsp;15,000p</span><br><br>
					 <span class="subtitle" id="item_amount">수량:&nbsp;&nbsp;500</span>   <br><br>
                     <span class="subtitle" id="item_content">정보:&nbsp;&nbsp;맛있는 쉑쉑버거가 드디어 한국에 입점했습니당!!!대표메뉴!@#!@$를 만나보세요~~</span>   <br>
				  </div> 
			  </div>
			   
	          </div>
	
    </div>
      <div style="border-top: 1px solid #d9d9d9;margin-top: 3%;">
       <div id="item_order" style="margin-left:23%; float:left; margin-top:3%; padding: 3%;">
           <div style="padding-left: 20%;">
            <input type="button" id="up" value="업"> 
           <a href="#"><img alt="arrow_up" src="/matna/resource/images/arrow1_1.PNG"></a> &nbsp;&nbsp;
           <!-- <a href="#"><img alt="arrow_up" src="/struts/images/arrow2_1.PNG"></a>-->
           <input type="text" id="amount" value="1" style="width: 40px;height: 30px;text-align: center;font-size: 20px;"> &nbsp;&nbsp;
           <a href="#"><img alt="arrow_up" src="/matna/resource/images/arrow1_2.PNG"></a>
           <input type="button" id="down" value="다운" > 
           <!--  <a href="#"><img alt="arrow_up" src="/struts/images/arrow2_2.PNG"></a> -->
           </div>
       </div>
      </div>
		    <!-- 주문/취소 -->
		    <div class="order_bt">   
				<input type="button" id="order_ok" value="확인">
				<input type="button" id="order_cancle" value="이전">
		    </div>
		    </div>
    
     <!--   </div>
</div>
 -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>