<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script>
$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#login_bt').click(function() {
			formObj.attr("action", "/login/login");
			formObj.submit();
		});
		
		$('#confirmid').click(function() {
		    $.ajax({
		      type: "POST",
		      url: "/join/confirmId",
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
<body>

<div class="col-md-5 col-sm-5" id="loginForm">
	<div id="box">
		<form role="form" id="login_frm" method="post">
			<input type="text" id="login_id" name=login_id placeholder="USERNAME" />
			<input type="password" id="login_pass" name=login_pass placeholder="PASSWORD" />
		</form>
		<a href="#" name="find_idpass">forgot ID / PASS ?</a>
		<input name="login_bt" id="login_bt" type="submit" value="LOGIN !"/>
		<div class="signup">
			<p>not a member ? <a href="#">sign up</a></p>
		</div>
	</div>
</div>

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
</html>