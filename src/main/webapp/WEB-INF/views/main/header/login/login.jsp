<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/matna/resource/css/login.css">

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script>
$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#login_bt').click(function() {
			formObj.attr("action", "/matna/login/login");
			formObj.submit();
		});
		
		$('#confirmid').click(function() {
		    $.ajax({
		      type: "POST",
		      url: "/matna/join/confirmId",
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
		
		$('#logout').click(function() {
			formObj.attr("action", "/matna/login/logout");
			formObj.submit();
		});
		
	});
	
	function joinMember(){
    window.open("/matna/join","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=00,left=200, width=1000,height=700");
	}
	
	function findIdPW(){
    window.open("/matna/find#tab-1","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=150,left=400, width=700,height=400");
	}
	
	function message(){
    window.open("/matna/message/listAll#tab-1","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=50,left=200, width=1000,height=600");
	}
	
	function mypage(){
  		 window.open("/matna/mypage#tab-1","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=50,left=100, width=1000,height=800");
	}
	
	function admin(){
  		 window.open("/matna/admin/memberList","_blank","location=no,toolbar=yes,scrollbars=yes,resizable=no,top=0,left=100, width=1000,height=700");
	}
</script>

</head>
<body>
<c:if test="${isLogin == null }">


	<form role="form" id="login_frm" method="post">
			<div class="box">
				<h2 id="logintoregister">Login</h2>
				<div class="group">
					<input class="inputMaterial" type="text" name="login_id" required>
					<span class="highlight"></span> <span class="bar"></span> <label id="id">Username</label>
				</div>
				<div class="group">
					<input class="inputMaterial" type="password" name="login_pass" required>
					<span class="highlight"></span> <span class="bar"></span> <label id="pw">Password</label>
				</div>
	
				<div align="center">
					<button type="submit" id="login_bt">Login</button>
					<input type="button" onclick="findIdPW()" id="find" value="ID / PW 찾기"/>
					<input type="button" onclick="joinMember()" id="join" value="회원가입"/>
					<!-- <button type="button" onclick="find()" id="find">ID / PW 찾기</button>
					<button type="button" onclick="join()" id="join">회원가입</button> -->
				</div>
				</div>
		</form>
		<br>

</c:if>


<c:if test="${isLogin == true }">

<form role="form" name="memberinfo" method="post">
<div align="center" class="box" style="padding-top: 50px">
<table id="state" style="border: 1px;">
	<tr><td rowspan="3" width="130px">
		<c:if test="${userGrade == '1' }">
			<img src="/matna/resource/img/5.png"  width="60" height="60"/>
		</c:if>
		<c:if test="${userGrade == '2' }">
			<img src="/matna/resource/img/4.png"  width="60" height="60"/>
		</c:if>
		<c:if test="${userGrade == '3' }">
			<img src="/matna/resource/img/3.png"  width="60" height="60"/>
		</c:if>
		<c:if test="${userGrade == '4' }">
			<img src="/matna/resource/img/2.png"  width="60" height="60"/>
		</c:if>
		<c:if test="${userGrade == '5' }">
			<img src="/matna/resource/img/1.png"  width="60" height="60"/>
		</c:if>
		</td>
		
    <td><label id="nickname" class="nickname" name="nickname">
    	닉네임: ${userNickname }</label></td></tr>
    	
    <tr><td><c:if test="${userGrade == '1' }">
    	<label id="grade" class="grade" name="grade">
    	등급: 관리자</label><br>
    </c:if>
    <c:if test="${userGrade == '2' }">
   		<label id="grade" class="grade" name="grade">
    	등급: 부관리자</label><br>
    </c:if>
    <c:if test="${userGrade == '3' }">
    	<label id="grade" class="grade" name="grade">
    	등급: 특별회원</label><br>
    </c:if>
    <c:if test="${userGrade == '4' }">
    	<label id="grade" class="grade" name="grade">
    	등급: 우수회원</label><br>
    </c:if>
    <c:if test="${userGrade == '5' }">
    	<label id="grade" class="grade" name="grade">
    	등급: 일반회원</label><br>
    </c:if></td></tr>
    <tr><td>
    <label id="point" class="point" name="point">
          POINT: ${userPoint } </label><br></td>
  </table>        
  <br>        
  
  <input class="logout" type="submit" id="logout"  name="logout" value="logout">
  <a onclick="mypage()"><img src="/matna/resource/img/mypage2.png" width="60" height="50" id="myPage"/></a>
  <a onclick="message()"><img src="/matna/resource/img/message1.png" width="60" height="50" id="msg"/></a>
  
  <c:if test="${userGrade == '1' }">
  	<input class="admin" onclick="admin()" type="button" id="adm" name="adm" value="관리자">
  </c:if>
  </div>
</form>

<br>
</c:if>

</body>
<script>
    
    var result = '${msg}';
    
    if(result == 'fail'){
    	alert("아이디와 비번이 일치하지 않습니다.");
    }
    if(result == 'false'){
    	alert("이미 로그인 중입니다.");
    }
    
</script>