<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
</head>
<style>
/* tab css코드의 시작 */
#tabs::after {
   display: block;
   content: "";
   clear: both;
}

.tab-switch {
   position: fixed;
}

.tab-switch:target+.tab-link+.tab-content {
   display: block;
}

.tab-link {
   display: inline-block;
}

.tab-content {
   box-sizing: border-box;
   float: right;
   display: none;
   width: 100%;
}

/* FANCY STYLES */
body {
   font-family: sans-serif;
   padding: 10px 100px;
}

h1 {
   text-align: center;
}

footer {
   margin-top: 20px;
   text-align: center;
}

#tabs {
   text-align: center;
   background-color: #ff7359; /* tomato button color */
   border: 1px solid #ff7359; /* tomato button color */
   font-size: 0;
}

.tab-link {
   margin-left: 20px;
   margin-top: 10px;
   padding: 20px;
   text-decoration: none;
   font-size: 18px;
   color: white;
}

.tab-link:hover {
   background-color: white;
   color: black;
}

.tab-link ~ .tab-link {
   margin-left: 0;
}

.tab-switch:target+.tab-link {
   background-color: white;
   color: black;
}

.tab-content {
   background-color: white;
   padding: 35px;
   font-size: 13px;
}

.tab-content p {
   line-height: 1.65;
}

.tab-content ul, .tab-content ol {
   padding: 0 0 0 15px;
   margin: 0;
   line-height: 1.25;
}

.tab-content ul>li, .tab-content ol>li {
   margin: 5px 0;
}

/* tab css코드의 끝 */
#wrapper {
   width: 720px;
   margin: 0 auto;
   font-family: Verdana, sans-serif;
   color: #aaa;
}

fieldset {
   border-radius: 4px;
   background: #fff;
   background: -moz-linear-gradient(#fff, #f9fdff);
   background: -o-linear-gradient(#fff, #f9fdff);
   background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff),
      to(#f9fdff));
   background: -webkit-linear-gradient(#fff, #f9fdff);
   padding: 20px;
   border-color: #ff7359; /* tomato button color */
}

input {
   color: #373737;
   background: #fff;
   border: 1px solid #ff7359; /* tomato button color */
   color: #aaa;
   font-size: 14px;
   line-height: 1.2em;
   margin-bottom: 15px;
   -moz-border-radius: 4px;
   -webkit-border-radius: 4px;
   border-radius: 4px;
}

.tf1, input[name="addr"], input[name="addr2"] {
   padding: 8px 6px;
   height: 22px;
   width: 280px;
}

.la {
   color: #373737;
   color: #aaa;
   font-size: 14px;
}

#firsttel {
   padding: 8px 6px;
   height: 18px;
   width: 150px;
}

.tel {
   padding: 8px 6px;
   height: 18px;
   width: 50px;
}

.tf1:focus {
   background: #f5fcfe;
   text-indent: 0;
   z-index: 1;
   color: #373737;
   -webkit-transition-duration: 400ms;
   -webkit-transition-property: width, background;
   -webkit-transition-timing-function: ease;
   -moz-transition-duration: 400ms;
   -moz-transition-property: width, background;
   -moz-transition-timing-function: ease;
   -o-transition-duration: 400ms;
   -o-transition-property: width, background;
   -o-transition-timing-function: ease;
   border-color: #ccc;
   box-shadow: 0 0 5px rgba(4, 129, 177, 0.5);
   opacity: 0.6;
}

input[name="addr"]:focus {
   background: #f5fcfe;
   text-indent: 0;
   z-index: 1;
   color: #373737;
   -webkit-transition-duration: 400ms;
   -webkit-transition-property: width, background;
   -webkit-transition-timing-function: ease;
   -moz-transition-duration: 400ms;
   -moz-transition-property: width, background;
   -moz-transition-timing-function: ease;
   -o-transition-duration: 400ms;
   -o-transition-property: width, background;
   -o-transition-timing-function: ease;
   border-color: #ccc;
   box-shadow: 0 0 5px rgba(4, 129, 177, 0.5);
   opacity: 0.6;
   width: 380px;
}

#cancel, #modify, #withdrawal {
   background: #ff7359; /* tomato button color */
   border: none;
   text-transform: uppercase;
   color: #eee;
   cursor: pointer;
   font-size: 20px;
   margin: 5px 0;
   padding: 5px 22px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -webkit-box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
   margin-right: 30px;
}

.small {
   line-height: 14px;
   font-size: 12px;
   color: #999898;
   margin-bottom: 3px;
}

/* 상품리스트 조희 css 시작 */
fieldset {
   border-radius: 4px;
   background: #fff;
   background: -moz-linear-gradient(#fff, #f9fdff);
   background: -o-linear-gradient(#fff, #f9fdff);
   background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff),
      to(#f9fdff));
   background: -webkit-linear-gradient(#fff, #f9fdff);
   padding: 50px;
   border-color: #ff7359; /* tomato button color */
}

#mypageTable {
   border: 3px solid #ff7359; /* tomato button color */
   text-transform: uppercase;
   color:;
   cursor: pointer;
   font-size: 20px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -webkit-box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
   margin-right: 30px;
}

.name {
   padding: 10px;
}

.button {
   background: #ff7359; /* tomato button color */
   border: none;
   text-transform: uppercase;
   color: #eee;
   cursor: pointer;
   font-size: 20px;
   margin: 5px 0;
   padding: 5px 22px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -webkit-box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
   margin-right: 30px;
}

#delete {
   background: #ff7359; /* tomato button color */
   border: none;
   text-transform: uppercase;
   color: #eee;
   cursor: pointer;
   font-size: 20px;
   margin: 5px 0;
   padding: 5px 22px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -webkit-box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
   margin-right: 30px;
}

.name {
   color: #373737;
   background: #fff;
   border: 1px solid #CCCCCC;
   color: #aaa;
   font-size: 23px;
   line-height: 1.2em;
   margin-bottom: 15px;
   -moz-border-radius: 4px;
   -webkit-border-radius: 4px;
   border-radius: 4px;
   padding: 10px;
}

.val {
   color: #373737;
   background: #fff;
   border: 1px solid #CCCCCC;
   color: #aaa;
   font-size: 20px;
   line-height: 1.2em;
   margin-bottom: 15px;
   -moz-border-radius: 4px;
   -webkit-border-radius: 4px;
   border-radius: 4px;
   padding: 10px;
}

h1 {
   color: #aaa;
}
/* 상품리스트 조희 css 끝 */

/* 상품리스트 paging css */
.page{
   margin-right:150px;
}

.pagination {
  list-style: none;
  display: inline-block;
  padding: 0;
  margin-top: 10px;
}

.pagination li {
  display: inline;
}

.pagination a {
  float: left;
  display: block;
  font-size: 14px;
  text-decoration: none;
  padding: 5px 12px;
  color: #fff;
  margin-left: -1px;
  border: 1px solid transparent;
  line-height: 1.5;
}
.pagination a.active {
  cursor: default;
}
.pagination a:active {
  outline: none;
}

.modal-1 li:first-child a {
  -moz-border-radius: 6px 0 0 6px;
  -webkit-border-radius: 6px;
  border-radius: 6px 0 0 6px;
}
.modal-1 li:last-child a {
  -moz-border-radius: 0 6px 6px 0;
  -webkit-border-radius: 0;
  border-radius: 0 6px 6px 0;
}
.modal-1 a {
  border-color: #ddd;
  color: #ff4524;
  background: #fff;

}
.modal-1 a:hover {
  background: #ffedea;
}
.modal-1 a.active, .modal-1 a:active {
  border-color: #ff4524;
  background: #ff4524;
  color: #fff;
}

#pagination{
  margin-left: 17.5%;
}

/*--------------------------------------------------------------
1.0 - BASE SITE STYLES
--------------------------------------------------------------*/
 *,*:after,*:before {
  box-sizing:border-box;
  -moz-box-sizing:border-box;
  -webkit-box-sizing:border-box;
}

.cf:before,
.cf:after {
    content:"";
    display:table;
}
.cf:after {
    clear:both;
}

 
/*--------------------------------------------------------------
2.0 - SEARCH FORM
--------------------------------------------------------------*/
 .searchform {
  background:#f4f4f4;
  background:rgba(244,244,244,.79);
  border: 1px solid #d3d3d3;
  padding: 2px 5px;
   margin: 2% 0 0 37.5%;
   margin-bottom : 3%;
  width:29em;
  border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  float:left;
}

.searchform input {
   text-align:center;
   background:#fefefe;
   border: none;
   font:12px/12px 'HelveticaNeue', Helvetica, Arial, sans-serif;
   margin-right: 5px;
   padding: 10px;
   width: 28em;
   box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
   -moz-box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
   -webkit-box-shadow: 0 0 4px rgba(0,0,0,.4) inset, 1px 1px 1px rgba(255,255,255,.75);
  border-radius: 9px;
  -moz-border-radius: 9px;
  -webkit-border-radius: 9px
}
   .searchform input:focus {
      outline: none;
      box-shadow:0 0 4px #dd2100 inset;
      -moz-box-shadow:0 0 4px #dd2100 inset;
      -webkit-box-shadow:0 0 4px #dd2100 inset;
   }
   .searchform input::-webkit-input-placeholder {
     font-style: italic;
     line-height: 15px
   }

   .searchform input:-moz-placeholder {
     font-style: italic;
     line-height: 15px
   }

.searchform button {
   background: #ff7359; /* tomato button color */
   filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#34adec', endColorstr='#2691dc',GradientType=0 );
   border: none;
   float:right;
   color:#fff;
   cursor: pointer;
   font: 13px/13px 'HelveticaNeue', Helvetica, Arial, sans-serif;
   padding: 10px;
   width:50px;
   box-shadow: 0 0 2px #ff4524i nset;
   -moz-box-shadow: 0 0 2px #ff4524 inset;
   -webkit-box-shadow: 0 0 2px #ff4524 inset;
  border-radius: 9px;
  -moz-border-radius: 9px;
  -webkit-border-radius: 9px;
}
   .searchform button:hover {
      opacity:.9;
   } 
</style>
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
                              <th class="name">가격</th>
                              <th class="name">연락번호</th>
                              <th class="name">주소</th>
                              <th class="name">배송상태</th>
                           </tr>

                           <tr>
                              <td class="val"><input type="checkbox" name="ck"
                                 value=">"> <input type="hidden" value="" name="mid"></td>
                              <td class="val" id="title"><input type="hidden" value=""
                                 name="nitem"></td>
                              <td class="val" id="cnt"></td>
                              <!-- item.getTitle()  -->
                              <td class="val" id="price"></td>
                              <td class="val" id="phone"></td>
                              <td class="val" id="addr2"></td>
                              <td class="val" id="statement"></td>
                           </tr>

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
                        <input type="submit" name="submit" value="탈퇴" id="withdrawal" onclick="window.close()"  />
                  </div>
            </form>
            </div>
            </fieldset>
            </div>
         </div>
         </fieldset>
</body>

<script>
    
    var result = '${msg}';
    
    if(result == 'notPw'){
    	alert("두 비밀번호가 일치하지 않습니다.");
    }
    
</script>

</html>