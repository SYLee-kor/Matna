<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	function buyCountChange(no) { // +,- 버튼 구현
		var buyCount = $('[name=buyCount]')
			var changeNum = Number(buyCount.val())+no
			if(changeNum < 1 ) changeNum = 1;
			else if (changeNum > Number('${detailItem.amount}')) changeNum = Number('${detailItem.amount}');
			buyCount.val( changeNum );
	}
	
</script>
</head>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<body>
<div id="finalize_order">
	<div id="accordian">
		<c:choose>
    		<c:when test="${detailItem.state!=3}">
    			<form action="/matna/item/itembuy">
    		</c:when>
    		<c:otherwise>
    			<form action="/matna/item/gift">
    		</c:otherwise>
    	</c:choose>
 		<div class="step" id="step5">
			<div class="number">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="order_title">
				<label>상품 상세보기</label><!-- 상품 상세정보 -->
	        </div>
	    </div>
	        
	           <div class="row">
	           <div class="col-md-5 col-sm-5">
                  <div>
                     <!-- <img src="/matna/resource/images/쉑쉑.png" id="order_img"/> -->
                     <img alt="사진1" src="/matna/resource/img/${detailItem.photo}" id="order_img">
		          </div>			
		       </div>
		       
		       <div class="col-md-5 col-sm-5">
          		  <div class="sub_content"> 
				     <span class="subtitle" id="item_name">이름:&nbsp;&nbsp;<input type="hidden" name="name" value="${detailItem.name }"> ${detailItem.name } </span><br><br>
			   <c:choose>
				  <c:when test="${detailItem.state!=3}">
					 <span class="subtitle" id="item_price">가격:&nbsp;&nbsp;<input type="hidden" name="price" value="${detailItem.price }">${detailItem.price }p</span><br><br>
					 <span class="subtitle" id="item_amount">수량:&nbsp;&nbsp;<input type="hidden" name="ino" value="${detailItem.ino}">${detailItem.amount }개</span>   <br><br>
				  </c:when>
				  <c:otherwise>
					 <span class="subtitle" id="item_price">수령자 닉네임:&nbsp;&nbsp;</span>
					    <span id="nick_input">
					    	<input type="text" name="taker" placeholder="NickName" required />
						</span><br><br>
						
					 <span class="subtitle" id="item_price">선물할 포인트:&nbsp;&nbsp;</span>	
					<span include="form-input-select()">
			  			<select required name="point">
			    			<option value="500">500 POINT</option>
			    			<option value="1000">1,000 POINT</option>
			    			<option value="5000">5,000 POINT</option>
			   				<option value="10000">10,000 POINT</option>
			  			</select>

		    		</span>
				  </c:otherwise>
			   </c:choose>
                     <span class="subtitle" id="item_content">정보:&nbsp;&nbsp;<input type="hidden" name="content" value="${detailItem.content }">${detailItem.content }</span>   <br>
				  </div> 
			  </div>
			   
	          </div>
	
    </div>
      <div style="border-top: 1px solid #d9d9d9;margin-top: 3%;">
       <div id="item_order" style="margin-left:20%; float:left; margin-top:3%; padding: 3%;">
           <div>
            <!-- <input type="button" id="up" value="업"> 
           <a href="#"><img alt="arrow_up" src="/matna/resource/images/arrow1_1.PNG" ></a> &nbsp;&nbsp;
           <a href="#"><img alt="arrow_up" src="/struts/images/arrow2_1.PNG"></a>
           <input type="text" id="amount" value="1" style="width: 40px;height: 30px;text-align: center;font-size: 20px;"> &nbsp;&nbsp;
           <a href="#"><img alt="arrow_up" src="/matna/resource/images/arrow1_2.PNG"></a>
           <input type="button" id="down" value="다운" > 
            <a href="#"><img alt="arrow_up" src="/struts/images/arrow2_2.PNG"></a> -->
           		<c:if test="${detailItem.state!=3}">
           		<span><a href="javascript:buyCountChange(-1)" name="buyDown"><img alt="arrow_down" src="/matna/resource/images/arrow1_2.PNG" ></a></span>
           		<span><input type="text" id="amount" value="1" name="buyCount" style="width: 40px;height: 30px;text-align: center;font-size: 20px;"></span> 
				<span><a href="javascript:buyCountChange(1)" name="buyUp"><img alt="arrow_up" src="/matna/resource/images/arrow1_1.PNG"></a></span>
					<!-- <input type="button" value="-" name="buyDown" onclick="buyCountChange(-1)">
					<input type="text" value="1" name="buyCount" >
					<input type="button" value="+" name="buyUp" onclick="buyCountChange(1)"> -->
				</c:if>
           </div>
       </div>
      </div>
		    <!-- 주문/취소 -->
		    <div class="order_bt">
		    <c:choose>
				<c:when test="${detailItem.state!=3}">
				<input type="submit" id="order_ok" value="구매">
				</c:when>
				<c:otherwise>
				<input type="submit" id="order_ok" value="선물">
				</c:otherwise>
			</c:choose>   
				<input type="button" id="order_cancle" value="이전" onclick="javascript:location.href='/matna/item/itemSearch'">
		    </div>
				</form>
		    </div>
    
     <!--   </div>
</div>
 -->

<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>