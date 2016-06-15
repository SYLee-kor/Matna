<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="/WEB-INF/views/matnaHeader.jsp" %>

<body id="itemorder_bd">
<div id="finalize_order">
	<div id="accordian">
		
 		<div class="step" id="step5">
			<div class="number">
				<i class="fa fa-check"></i>
			</div>
			<div class="order_title">
				<h1>Finalize Order</h1><!-- 구매확인 -->
			</div>

		</div>
		<div class="order_content" id="final_products">
			<div class="left" id="ordered">
				<div class="products">
					<div class="product_image">
						<img src="/resource/images/쉑쉑.png" id="order_img"/>
					</div>
					<div class="product_details">
						<span class="product_name">&nbsp;&nbsp;&nbsp;&nbsp;Cherry Bikini</span>
						<span class="quantity">1개</span>
						<span class="price">2,000p</span>   
					</div>   
        <div id="order_info">
          <div>
          <span class="order_info">받는분 NICKNAME :
              <span class="order_info2">&nbsp;&nbsp;&nbsp;우리지금맛나맛나</span>
          </span>
          <span class="order_info">배송지 :
              <span class="order_info2">&nbsp;&nbsp;&nbsp;인천시 계양구 계산3동 흥인아이젠 505호</span>
          </span>
          <span class="order_info">PHONE NUMBER : 
              <span class="order_info2">&nbsp;&nbsp;&nbsp;010-3934-4540</span>
          </span>
        </div>
      </div>
	</div>
        
      
		<div class="totals">
			<span class="subtitle">현재 POINT:
                <span id="sub_price">&nbsp;&nbsp;&nbsp;15,000p</span></span>
			<span class="subtitle">-
                <span id="sub_tax">&nbsp;&nbsp;&nbsp;2,000p</span></span>
		</div>
		<div class="final">
			<span class="title">보유 POINT <span id="calculated_total">&nbsp;&nbsp;13,000p</span></span>
		</div>
	  </div>	
	</div>
  </div>
    
    <!-- 주문/취소 -->
    <div class="order_bt">   
		<input type="button" id="order_ok" value="주문">
		<input type="button" id="order_cancle" value="취소">
    </div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>