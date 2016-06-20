<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<link rel="stylesheet" href="/matna/resource/css/myPage.css">
</head>

<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[role='form']");

      $('#modify').click(function() {
         formObj.attr("action", "/matna/mypage/modifySuccess");
         formObj.submit();
      });
      
      $('#withdrawal').click(function() {
         formObj.attr("action", "/matna/mypage/withdraw");
         formObj.submit();
      });

      $('#confirmid').click(function() {
         $.ajax({
            type : "POST",
            url : "/matna/join/confirmId",
            data : {
               action : "join",
               action2 : "confirmid",
               id : $('#id').val()
            },
            success : function(result) {
               var s = result;
               alert(s);
               $("#duplicated").val(s);
            }
         });
      });

      $('#confirmnick').click(function() {
         $.ajax({
            type : "POST",
            url : "/matna/join/confirmNick",
            data : {
               action : "join",
               action2 : "confirmNick",
               nickname : $('#nickname').val()
            },
            success : function(result) {
               var s = result;
               alert(s);
               $("#duplicated").val(s);
            }
         });
      });
   });
</script>

<body>

   <div id="tabs">
      <span id="tab-1" class="tab-switch"></span> <a href="#tab-1"
         class="tab-link"><h4>상품리스트</h4></a>
      <div class="tab-content">

         <fieldset>
            <div class='multitab-widget-content multitab-widget-content-widget-id'
               id='multicolumn-widget-id1'>
               <span class='sidebar' id='sidebartab1' preferred='yes'> </br> </br>
                  <div id="wrapper">
                     <center>

                        <h1>주문 조회</h1>
                        <table id="mypageTable" border="3px solid DeepSkyBlue">
                           <tr>
                              <th class="name"></th>
                              <th class="name">상품명</th>
                              <th class="name">주문 수량</th>
                              <th class="name">주문날짜</th>
                              <th class="name">배송상태</th>
                              <th class="name">배송주소</th>
                           </tr>
							
						   <c:forEach items="${orders}" var="order">
                           <tr>
                              <td class="val"><input type="checkbox" name="ck" value="${order.ono}"></td>
                              <td class="val" id="item"><input type="hidden" name="item" value="${order.item}">${order.itemname}</td>
                              <td class="val" id=cnt ><input type="hidden" name="cnt" value="${order.cnt}">${order.cnt}</td>
                              <td class="val" id="orderDate">${order.orderDate}</td>
                              <td class="val" id="state">
								<input type="hidden" name="state" value="${order.state}">
								<c:if test="${order.state==0}">
									<c:set var="state" value="발송전"/>
								</c:if>
								<c:if test="${order.state==1}">
									<c:set var="state" value="발송완료"/>
								</c:if>
								${state}
								</td>
                              <td class="val" id="addr">${order.addr}</td>
                           </tr>
                           </c:forEach>

                        </table>
                        <br>
                        <form action="/Matna/main/admin/items/info.jsp" method="post">
                           <input type="hidden" name="action" value="selectAll"> <input
                              type="button" value="제거" id="delete">
                        </form>

                        <br> <br>
                        <div class="page">
                            <!-- =========== 페이징 ================= -->
                            <ul class="pagination modal-1" id="pagination">
                             <li><a href="#" class="prev">&laquo</a></li>
                             <li><a href="#" class="prev">prev</a></li>
                             <li><a href="#" class="active">1</a></li>
                             <li> <a href="#">2</a></li>
                             <li> <a href="#">3</a></li>
                             <li> <a href="#">4</a></li>
                             <li> <a href="#">5</a></li>
                             <li><a href="#" class="next">next</a></li>
                             <li><a href="#" class="next">&raquo;</a></li>
                          </ul><br><br>
  
  
                             <!-- =============검색================== -->
                             <div class="col-md-12 col-sm-12" style="margin-right:150px;">
                             <form class="searchform cf">
                             <input type="text" placeholder="상품을 검색해보세요!^_^">
                             <button type="submit">검색</button>
                             </form>
                               </div>
                        </div>
                     </center>
                  </div>
               </span>
            </div>
         </fieldset>
      </div>


      <span id="tab-2" class="tab-switch"></span> <a href="#tab-2"
         class="tab-link"><h4>회원정보수정</h4></a>
      <div class="tab-content">
      <fieldset>
         <div id="wrapper">
            <form commandName="member" name="join_member" method="post"
               role="form">
               <input type="hidden" name="action" id="action" value="join" />
               <input type="hidden" name="action2" id="action2" value="join" />
               <input type="hidden" name="duplicated" id="duplicated" />
               <input type="hidden" name="gender" id="gender" />
                  <div style="float:left;">
                     아이디:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
                        id="id" name="id" placeholder="ID" class="tf1" maxlength="15" value="${memberVO.id}"
                        path="id" readonly="readonly" /> <input type="button" id="confirmid"
                        name="confirmid" value="중복확인"
                        style="margin-left: 20px; background-color: #ff7359; color: white;" />
                  </div>
                  <div>
                     <form:errors path="id" />

                     <html:messages id="msg" property="errID">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     패스워드:&nbsp;&nbsp;&nbsp; <input type="password" name="pw" id="pw" value="${memberVO.pw}"
                        placeholder="Password" maxlength="15" class="tf1" /> <label
                        class="la" style="margin-left: 20px">*특수문자, 숫자, 영문자
                        혼합사용가능</label>

                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errPw">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="password" maxlength="15" name="confirmpass"
                        placeholder="Password 확인" class="tf1" />
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errPass2">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     닉네임:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${memberVO.nickname}"
                        id="nickname" name="nickname" placeholder="nickname" class="tf1"
                        maxlength="15" path="nickname" /> <input type="button"
                        id="confirmnick" name="confirmnick" value="중복확인"
                        style="margin-left: 20px; background-color: #ff7359; color: white;" />
                     <label class="la" style="margin-left: 20px">*공백없이 입력</label>
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errNick">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
                        type="text" maxlength="30" name="name" placeholder="이름" value="${memberVO.name}"
                        class="tf1" /> <label class="la" style="margin-left: 20px">*공백없이
                        입력</label>
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errName">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     email:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${memberVO.email}"
                        name="email" maxlength="50" placeholder="Email" class="tf1" />
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errEmail">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>

                  <div style="float:left;">
                     생년월일:&nbsp;&nbsp;&nbsp; <input type="text" name="birth" value="${memberVO.birth}"
                        placeholder="생년월일" maxlength="6" class="tf1" readonly="readonly"/> <label
                        class="la" style="margin-left: 20px">* - 없이 6자리
                        입력(YYMMDD)</label>
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errBirth">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     Tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="text" maxlength="11" width="10" name="phone" value="${memberVO.phone}"
                        id="firsttel"> - , 공백 없이 숫자만 입력
                     <!-- <input type="text" maxlength="4" width="10" name="phone2"
                  class="tel">- <input type="text" maxlength="4" width="10"
                  name="phone3" class="tel"> -->
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errPhone">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     우편번호:&nbsp;&nbsp;&nbsp; <input type="text" name="post" value="${memberVO.post}"
                        placeholder="우편번호" class="tf1" maxlength="5" /> <label
                        class="la" style="margin-left: 20px">*- , 공백 없이 숫자 5자리
                        입력</label>
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errPost">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br>
                  <div style="float:left;">
                     상세주소:&nbsp;&nbsp;&nbsp; <input type="text" name="addr" value="${memberVO.addr}"
                        placeholder="상세주소" maxlength="50" /> <label class="la"
                        style="margin-left: 20px">*50자 이내</label>
                  </div>
                  <div style="float:left;">
                     <html:messages id="msg" property="errAddr">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
                     </html:messages>
                  </div>
                  <br> <br> <br>
                  
                  <div style="float:left; margin-left:215px;">
                     <input type="submit" name="modify" value="수정" id="modify" class="btn btn-modify" />
                        <input type="button" value="취소" OnClick="window.close()" id="cancel" style="margin-right: 35px;" />
                        <input type="submit" name="submit" value="탈퇴" id="withdrawal"  />
                  </div>
            </form>
            </div>
            </fieldset>
            </div>
         </div>
         </fieldset>
</body>

<script>
	/* function withdraw(){
		window.opener.location.reload();
		window.close();
	} */

    var result = '${msg}';
    
    if(result == 'notPw'){
    	alert("두 비밀번호가 일치하지 않습니다.");
    }
    if(result=='withdraw'){
    	window.opener.location.reload();
		window.close();
    }
    
</script>

</html>