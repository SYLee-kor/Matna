<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$( ".input" ).focusin(function() {
	  $( this ).find( "span" ).animate({"opacity":"0"}, 200);
	});

	$( ".input" ).focusout(function() {
	  $( this ).find( "span" ).animate({"opacity":"1"}, 300);
	});

	$(".login").submit(function(){
	  $(this).find(".submit i").removeAttr('class').addClass("fa fa-check").css({"color":"#fff"});
	  $(".submit").css({"background":"#2ecc71", "border-color":"#2ecc71"});
	  $(".feedback").show().animate({"opacity":"1", "bottom":"-80px"}, 400);
	  $("input").css({"border-color":"#2ecc71"});
	  return false;
	});
</script>
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
      
            <!-- 닉네임입력 -->
            <!-- <img alt="gift" src="/struts/images/gift-icon.png"> -->
		    <div class="input">
            <span><i class="fa fa-gift" style="color: #ff7359;"></i></span>
		    	<input type="email" placeholder="NickName" required />
		    
		    <!-- point select -->
		    <div include="form-input-select()">
			  <select required>
			    <option value=""
			            hidden
			    >POINT선택</option>
			
			    <!-- normal options -->
			    <option value="1">500 POINT</option>
			    <option value="2">1,000 POINT</option>
			    <option value="3">5,000 POINT</option>
			    <option value="4">10,000 POINT</option>
			  </select>
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