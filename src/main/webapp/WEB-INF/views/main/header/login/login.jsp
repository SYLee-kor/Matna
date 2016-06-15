<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <link rel="stylesheet" href="/matna/resource/css/login.css"> -->

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
	});
</script>

</head>
<div class="col-md-5 col-sm-5" id="loginForm">
	<div id="box">
		<form role="form" id="login_frm" method="post">
			<div class="form-group">
     			<label class="form-label">아이디</label>
      			<input type="text" class="form-control"id="login_id" name=login_id >
    		</div>
    		<div class="form-group">
    			<label class="form-label">비밀번호</label>
				<input class="form-control" type="password" id="login_pass" name=login_pass />
			</div>
		</form>
		
		<button type="submit" class="btn" name="login_bt" id="login_bt">Log in</button>
		<div class="signup">
			<a href="#" name="find_idpass">ID / PW 찾기</a>
			<a href="#">회원가입</a></p>
		</div>
	</div>
</div>
<!-- <div class="panel">
  <h4>로그인</h4>
  <form role="form" id="login_frm" method="post">
  <div class="formset">
    <div class="form-group">
      <label class="form-label">아이디</label>
      <input type="text" class="form-control"id="login_id" name=login_id >
    </div>
    <div class="form-group">
      <label class="form-label">비밀번호</label>
      <input type="password" class="form-control" id="login_pass" name=login_pass/>
    </div>
    <button type="submit" class="btn" name="login_bt" id="login_bt">Log in</button>
  </div>
  </form>
</div> -->

<script>
    
    var result = '${msg}';
    
    if(result == 'fail'){
    	alert("아이디와 비번이 일치하지 않습니다.");
    }
    if(result == 'false'){
    	alert("이미 로그인 중입니다.");
    }
    
</script>