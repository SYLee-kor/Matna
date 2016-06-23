<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/matna/resource/css/findIdPw.css">
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#confirmid').click(function() {
			formObj.attr("action", "/matna/find/findPw");
			formObj.submit();
		});
		
		$('#confirmid2').click(function() {
			formObj.attr("action", "/matna/find/findId");
			formObj.submit();
		});
	});
</script>

<body>
	<!-- <form role="form" method="post">
					이름 : <input type="text" name="name" placeholder="이름을 입력해주세요" class="tf1"/><br> 
					아이디 : <input type="text" name="id" placeholder="아이디를 입력해주세요" class="tf1"><br>
					이메일 : <input type="text" name="email" placeholder="email을 입력해주세요" class="tf1"><br> 
						<input type="submit" id="confirmid" name="confirmid" value="확인" style="margin-left: 190px" />
	<br>
					이름 : <input type="text" name="name2" placeholder="이름을 입력해주세요" class="tf1"/><br> 
					이메일 : <input type="text" name="email2" placeholder="email을 입력해주세요" class="tf1"><br> 
						<input type="submit" id="confirmid2" name="confirmid2" value="확인" style="margin-left: 190px" />
	</form> -->
	
      <div id="tabs">
         <span id="tab-1" class="tab-switch"></span> <a href="#tab-1" class="tab-link"><strong>아이디 찾기</strong></a>
            <div class="tab-content">
               <form role="form" method="post" >
         <p>이름 : &nbsp;&nbsp;&nbsp;<input type="text" name="name2" placeholder="이름을 입력해주세요" class="tf1"/></p>
               <p>이메일 : <input type="text" name="email2" placeholder="email을 입력해주세요" class="tf1"><p>
                  <input type="submit" id="confirmid2" name="confirmid2" value="확인" style="margin-left: 80%; background-color:#ff7359; color:white;" />
           </form>  
        </div>

      <span id="tab-2" class="tab-switch"></span> <a href="#tab-2" class="tab-link"><strong>비밀번호 찾기</strong></a>
      <div class="tab-content">
      <form role="form" method="post" >
                <p> 이름 : &nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="이름을 입력해주세요" class="tf1"/></p> 
                <p> 아이디 : <input type="text" name="id" placeholder="아이디를 입력해주세요" class="tf1"></p>
                <p> 이메일 : <input type="text" name="email" placeholder="email을 입력해주세요" class="tf1"></p> 
                       <input type="submit" id="confirmid" name="confirmid" value="확인" style="margin-left: 80%; background-color:#ff7359; color:white;" />
         </form>
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
