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
        
        <c:forEach begin="0" end="2" varStatus="i" >
        <div class="row" ><!-- 1행 -->
            <div class="col-md-2"></div>
            
            <c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="itemVO" items="${list}">
           <a href="/matna/item/itemdetail?ino=${itemVO.ino}">
           <div class="col-md-3 col-sm-4 templatemo_servicegap" ><!-- 1번째꺼 -->
            <img src="/matna/resource/images/admin/item/${itemVO.photo}" alt="10,000포인트" width="230px" height="210px">
               <div class="templatemo_email"> <!-- 동그라미 돌아가는거 class명 안바꿔도됨 -->
                   <a href="/matna/item/itemdetail?ino=${itemVO.ino}"><div class="fa fa-gift"></div></a>
                </div>
                <div class="clear"></div>
                <div class="templatemo_teamtext">
                    <div class="templatemo_teamname">
                        <div class="templatemo_teamtitle">${itemVO.name }</div>
                        <c:choose>
                        	<c:when test="${itemVO.state==3}">
                        		<div class="templatemo_teampost">${itemVO.content}</div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="templatemo_teampost">${itemVO.price}</div>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    
               </div>
            </div> <!-- 1번째꺼 -->
           </a>
            </c:forEach>
            
        </div><!-- 1행 -->
        </c:forEach>
     
        </div>
        
       
   <!-- =========== 페이징 ================= -->
   <center>
       <ul class="pagination modal-1" id="pagination">
		  <!-- <li><a href="#" class="prev">&laquo</a></li>
		  <li><a href="#" class="prev">prev</a></li> -->
			<c:if test="${pageMaker.prev}">
				<a name="page" href="${pageMaker.startPage - 1}">&laquo;</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li><a name="page" href="/matna/item/itemSearch?page=${idx}&search=${search}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a name="page" href="${pageMaker.endPage +1}">&raquo;</a>
			</c:if>
		  <!-- <li><a href="#" class="next">next</a></li>
		  <li><a href="#" class="next">&raquo;</a></li> -->
     </ul><br>
  </center>
  <!-- =============검색================== -->
  <div class="col-md-12 col-sm-12">
  <form class="searchform cf" action="/matna/item/itemSearch">
  	<input type="text" placeholder="상품을 검색해보세요!^_^" name="search">
  	<button value="submit" class="list_searchbt">검색</button>
  </form>
    </div>
    
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>