<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#confirmid').click(function() {
			formObj.attr("action", "/find/findPw");
			formObj.submit();
		});
		
		$('#confirmid2').click(function() {
			formObj.attr("action", "/find/findId");
			formObj.submit();
		});
	});
</script>

<body>
	<form role="form" method="post">
					이름 : <input type="text" name="name" placeholder="이름을 입력해주세요" class="tf1"/><br> 
					아이디 : <input type="text" name="id" placeholder="아이디를 입력해주세요" class="tf1"><br>
					이메일 : <input type="text" name="email" placeholder="email을 입력해주세요" class="tf1"><br> 
						<input type="submit" id="confirmid" name="confirmid" value="확인" style="margin-left: 190px" />
	<br>
					이름 : <input type="text" name="name2" placeholder="이름을 입력해주세요" class="tf1"/><br> 
					이메일 : <input type="text" name="email2" placeholder="email을 입력해주세요" class="tf1"><br> 
						<input type="submit" id="confirmid2" name="confirmid2" value="확인" style="margin-left: 190px" />
	</form>
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
