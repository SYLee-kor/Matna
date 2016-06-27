<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[role='form']");
      
      $('#join').click(function() {
         /* 
         $("#gender").val($("input[name='sex']:checked").val());
          */
         formObj.attr("action", "/join/joinSuccess");
         formObj.attr("action2","null");
         formObj.submit();
      });
      
      $('#confirmid').click(function() {
          $.ajax({
            type: "POST",
            url: "/join/joinSuccess",
            data: { action: "join", 
                   action2: "confirmid", 
                    id: $('#id').val()
            },
            success:function(result) {
                 var s = result;
                 alert(s);
                 $("#duplicated").val(s);
            }
          });
      });
   });
</script>
</head>
<%-- joinForm.jsp --%>
<body>
   <div id="wrapper">
      <form:form modelAttribute="MemberValidator" name="join_member" method="post" role="form">
         <input type="hidden" name="action" id="action" value="join" />
         <input type="hidden" name="action2" id="action2" value="join" />
         <input type="hidden" name="duplicated" id="duplicated"/>
         <input type="hidden" name="gender" id="gender" />
         <fieldset>
            <div>
               아이디:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <input type="text" id="id"   name="id" placeholder="ID" class="tf1" maxlength="15" path="id"/> 
               <input type="button" id="confirmid"   name="confirmid" value="ID 중복확인" style="margin-left: 20px" />
            </div>
            <div>
            <form:errors path="id"/>
            
            <html:messages id="msg" property="errID">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               패스워드:&nbsp;&nbsp;&nbsp; <input type="password" name="pw" id="pw"
                  placeholder="Password" maxlength="15" class="tf1" /> <label
                  class="la" style="margin-left: 20px">*특수문자, 숫자, 영문자 혼합사용가능</label>

            </div>
            <div>
            <html:messages id="msg" property="errPw">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="password" maxlength="15" name="confirmpass" placeholder="Password 확인"
                  class="tf1" />
            </div>
            <div>
            <html:messages id="msg" property="errPass2">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
                  type="text" maxlength="30" name="name" placeholder="이름" class="tf1" />
               <label class="la" style="margin-left: 20px">*공백없이 입력</label>
            </div>
            <div>
            <html:messages id="msg" property="errName">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               email:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
                  name="email" maxlength="50" placeholder="Email" class="tf1" />
            </div>
            <div>
            <html:messages id="msg" property="errEmail">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               성별: &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
                  name="gender" value="남" >남 <input type="radio" name="gender"
                  value="여">여
            </div>
            
            <div>
            <html:messages id="msg" property="errGender">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
   
            <div>
               생년월일:&nbsp;&nbsp;&nbsp; <input type="text" name="birth"
                  placeholder="생년월일" maxlength="6" class="tf1" />
                  <label class="la" style="margin-left: 20px">* - 없이 6자리 입력(YYMMDD)</label>
            </div>
            <div>
            <html:messages id="msg" property="errBirth">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               Tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
                  type="text" maxlength="11" width="10" name="phone" id="firsttel"> - , 공백 없이 숫자만 입력
               <!-- <input type="text" maxlength="4" width="10" name="phone2"
                  class="tel">- <input type="text" maxlength="4" width="10"
                  name="phone3" class="tel"> -->
            </div>
            <div>
            <html:messages id="msg" property="errPhone">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               우편번호:&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="post"
                  placeholder="우편번호" class="tf1" maxlength="5"/> <label
                  class="la" style="margin-left: 20px">*- , 공백 없이 숫자 5자리 입력</label>
            </div>
            <div>
            <html:messages id="msg" property="errPost">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <div>
               상세주소:&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="addr"
                  placeholder="상세주소" maxlength="50"/> <label class="la" style="margin-left: 20px">*50자
                  이내</label>
            </div>
            <div>
            <html:messages id="msg" property="errAddr">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;
               <font color="red"><bean:write name="msg" /><br></font>
            </html:messages>
            </div>
            <br>
            <br>
            <br>
            <div align="center">
               <input type="submit" name="join" value="가입" id="join" class="btn btn-join" /> <input
                  type=button value="취소" OnClick="javascript:history.back(-1)"
                  id="cancel" style="margin-right: 35px" />
            </div>
         </fieldset>
      </form:form>
   </div>
</body>
</html>
