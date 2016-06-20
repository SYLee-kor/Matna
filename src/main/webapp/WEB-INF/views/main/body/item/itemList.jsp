<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<%@include file="/WEB-INF/views/matnaHeader.jsp" %>

<!-- 이미지 크기는 500x500 입니다 -->
<div class="clear"></div>
    <div class="container">
    	<div class="row" style="margin-left: 11%; width: 80%;">
        	<div class="col-md-12">
            	<label id="item_header">상품 구매하기</label>
            </div>
        </div>
        
        <div class="clear"></div>
        <div class="row" >
            <div class="col-md-2"></div>
        	<div class="col-md-3 col-sm-4 templatemo_servicegap">
            <img src="/matna/resource/images/point1.png" alt="10,000포인트">
            	<div class="templatemo_email"> <!-- 동그라미 돌아가는거 class명 안바꿔도됨 -->
                	<a href="#"><div class="fa fa-gift"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">10,000 POINT</div>
                        <div class="templatemo_teampost">10.000p</div>
                    </div>
                    
               </div>
            </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/point2.png" alt="5,000point">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-gift"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">5,000 POINT</div>
                        <div class="templatemo_teampost">5,000p</div>
                    </div>
                   
               </div>
             </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/쉑쉑.png" alt="service 03">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">쉑쉐버거-논현점</div>
                        <div class="templatemo_teampost">15,000</div>
                    </div>
                    
               </div>
            </div>
        </div>
     
        <div class="row" >
            <div class="col-md-2"></div>
        	<div class="col-md-3 col-sm-4 templatemo_servicegap">
            <img src="/matna/resource/images/member1.jpg" alt="Tracy - Designer">
            	<div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Candy</div>
                        <div class="templatemo_teampost">Designer</div>
                    </div>
                    
               </div>
            </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/member2.jpg" alt="service 02">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Marvel</div>
                        <div class="templatemo_teampost">Developer</div>
                    </div>
                   
               </div>
             </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/member3.jpg" alt="service 03">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Julia</div>
                        <div class="templatemo_teampost">Director</div>
                    </div>
                    
               </div>
            </div>
        </div>
       
        <div class="row" >
            <div class="col-md-2"></div>
        	<div class="col-md-3 col-sm-4 templatemo_servicegap">
            <img src="/matna/resource/images/member1.jpg" alt="Tracy - Designer">
            	<div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Candy</div>
                        <div class="templatemo_teampost">Designer</div>
                    </div>
                    
               </div>
            </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/member2.jpg" alt="service 02">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Marvel</div>
                        <div class="templatemo_teampost">Developer</div>
                    </div>
                   
               </div>
             </div>
            <div class="col-md-3 col-sm-4 templatemo_servicegap">
            	<img src="/matna/resource/images/member3.jpg" alt="service 03">
                <div class="templatemo_email">
                	<a href="#"><div class="fa fa-shopping-cart"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">Julia</div>
                        <div class="templatemo_teampost">Director</div>
                    </div>
                    
               </div>
            </div>
        </div>
        </div>
       
       
   <!-- =========== 페이징 ================= -->
   <center>
       <ul class="pagination modal-1" id="pagination">
		  <li><a href="#" class="prev">&laquo</a></li>
		  <li><a href="#" class="prev">prev</a></li>
		  <li><a href="#" class="active">1</a></li>
		  <li> <a href="#">2</a></li>
		  <li> <a href="#">3</a></li>
		  <li> <a href="#">4</a></li>
		  <li> <a href="#">5</a></li>
		  <li> <a href="#">6</a></li>
		  <li> <a href="#">7</a></li>
		  <li> <a href="#">8</a></li>
		  <li> <a href="#">9</a></li>
		  <li><a href="#" class="next">next</a></li>
		  <li><a href="#" class="next">&raquo;</a></li>
     </ul><br>
  </center>
  
  <!-- =============검색================== -->
 
  <div class="col-md-12 col-sm-12">
  <form class="searchform cf">
  <input type="text" placeholder="상품을 검색해보세요!^_^">
  <button type="button" class="list_searchbt">검색</button>
  </form>
    </div>
    
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>