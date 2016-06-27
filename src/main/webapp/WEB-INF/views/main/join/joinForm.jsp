<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/matna/resource/css/join.css">
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(emailconfirm).hide();
		var formObj = $("form[role='form']");
		var idFlag = false;
		var nickFlag = false;
		
		// # 아이디 또는 닉네임 값이 변경 될때 다시 중복확인 하지 않으면 가입 불가하도록 .... 
		$('[name=id]').change(function() {
			idFlag = false;
		});
		$('[name=nickname]').change(function() {
			nickFlag = false;
		});
		
		$('#join').click(function() {
			if( !(idFlag && nickFlag) ) {
				alert('아이디 및 닉네임 중복 확인을 해주세요.');
				return false;
			}
			if( $('[name=pw]').val() != $('[name=confirmpass]').val() ){
				alert('비밀번호와 비번확인 값이 서로 일치하지 않습니다.');
				return false;
			}
			formObj.attr("action", "/matna/join/joinSuccess");
			formObj.attr("action2","null");
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
		        	idFlag = true;
		      }
		    });
		});
		
		$('#confirmnick').click(function() {
		    $.ajax({
		      type: "POST",
		      url: "/matna/join/confirmNick",
		      data: { action: "join", 
		    	      action2: "confirmNick", 
		    	  	  nickname: $('#nickname').val()
		      },
		      success:function(result) {
		    	    var s = result;
		        	alert(s);
		        	$("#duplicated").val(s);
		        	nickFlag=true;
		      }
		    });
		});
		
		$('#confirmemail').click(function() {
			$(emailconfirm).show();
		});
		
		$('#confirmemail2').click(function() {
			$(emailconfirm).hide();
		});
		
		if('${errMsgs.isValid}'=='invalid'){
			var objs = [$('[name=id]'),$('[name=pw]'),
			            $('[name=nickname]'),$('[name=name]'),$('[name=email]'),
			            $('[name=gender]'),$('[name=birth]'),$('[name=phone]'),
			            $('[name=post]'),$('[name=addr]')];
			
			var values = ['${member.id}','${member.pw}',
			              '${member.nickname}','${member.name}','${member.email}',
			              '${member.gender}','${member.birth}','${member.phone}',
			              '${member.post}','${member.addr}'];
			
			var errMsgs = ['${errMsgs.e_id}','${errMsgs.e_pw}',
			               '${errMsgs.e_nickname}','${errMsgs.e_name}','${errMsgs.e_email}',
			               '${errMsgs.e_gender}','${errMsgs.e_birth}','${errMsgs.e_phone}',
			               '${errMsgs.e_post}','${errMsgs.e_addr}'];
			for (var int = objs.length-1; int >= 0 ; int--) {
				objs[int].val(values[int]); // @ 기본 데이터 세팅
				if(errMsgs[int] != null && errMsgs[int] != ''){ // @ 에러발생부분 칸 비우기
					objs[int].val('');
					objs[int].focus(); // 포커스 가져가기
				}
			}		}
	});

</script>
</head>
<%-- joinForm.jsp --%>
<body>
	<div id="wrapper">
		<form:form commandName="member" name="join_member" method="post" role="form">
			<input type="hidden" name="action" id="action" value="join" />
			<input type="hidden" name="action2" id="action2" value="join" />
			<input type="hidden" name="duplicated" id="duplicated"/>
			<fieldset>
				<div>
					아이디:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" id="id"	name="id" placeholder="ID" class="tf1" maxlength="15" path="id"/>
					<input type="button" id="confirmid"	name="confirmid" value="중복확인" style="margin-left: 20px" />
				</div>
				<font color="red" size="2">${errMsgs.e_id }</font>
				<div>
				<form:errors path="id"/>
				</div>
				<br>
				<div>
					비밀번호:&nbsp;&nbsp;&nbsp; <input type="password" name="pw" id="pw"
						placeholder="Password" maxlength="15" class="tf1" /> <label
						class="la" style="margin-left: 20px">*특수문자, 숫자, 영문자 혼합사용가능</label>

				</div>
				<font color="red" size="2">${errMsgs.e_pw }</font>
				<br>
				<div>
					비번확인:&nbsp;&nbsp;&nbsp;
					<input type="password" maxlength="15" name="confirmpass" placeholder="Password 확인"
						class="tf1" />
				</div>
				<br>
				<div>
					닉네임:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" id="nickname"	name="nickname" placeholder="nickname" class="tf1" maxlength="8" path="nickname"/>
					<input type="button" id="confirmnick" name="confirmnick" value="중복확인" style="margin-left: 20px" />
					<label class="la" style="margin-left: 20px">*공백없이 2~8글자 입력</label>
				</div>
				<font color="red" size="2">${errMsgs.e_nickname }</font>
				<br>
				<div>
					이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" maxlength="24" name="name" placeholder="이름" class="tf1" />
					<label class="la" style="margin-left: 20px">*공백없이 입력</label>
				</div>
				<font color="red" size="2">${errMsgs.e_name }</font>
				<br>
				<div>
					email:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
						name="email" maxlength="50" placeholder="Email" class="tf1" />
						<input type="button" id="confirmemail" name="confirmemail" value="이메일인증" style="margin-left: 20px" />
				</div>
				<font color="red" size="2">${errMsgs.e_email }</font>
				<div id="emailconfirm">
					인증번호:&nbsp; &nbsp;&nbsp;<input type="text"
						name="confirmnum" maxlength="10" placeholder="인증번호" class="tf1" />
					<input type="button" id="confirmemail2" name="confirmemail2" value="인증하기" style="margin-left: 20px" />
				</div>
				<br>
				<div>
					성별: &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="gender" value="남" checked="checked">남
					<input type="radio" name="gender" value="여">여
				</div>
				<font color="red" size="2">${errMsgs.e_gender }</font>
				<br>
	
				<div>
					생년월일:&nbsp;&nbsp;&nbsp; <input type="text" name="birth"
						placeholder="생년월일" maxlength="6" class="tf1" />
						<label class="la" style="margin-left: 20px">* - 없이 6자리 입력(YYMMDD)</label>
				</div> 
				<font color="red" size="2">${errMsgs.e_birth }</font>
				<br>
				<div>
					Tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" maxlength="11" width="10" name="phone" id="firsttel"> - , 공백 없이 숫자만 입력
					<!-- <input type="text" maxlength="4" width="10" name="phone2"
						class="tel">- <input type="text" maxlength="4" width="10"
						name="phone3" class="tel"> -->
				</div>
				<font color="red" size="2">${errMsgs.e_phone }</font>
				<br>
				<div>
					우편번호:&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="post"
						placeholder="우편번호" class="tf1" maxlength="5"/> <label
						class="la" style="margin-left: 20px">*- , 공백 없이 숫자 5자리 입력</label>
				</div>
				<font color="red" size="2">${errMsgs.e_post }</font>
				<br>
				<div>
					상세주소:&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="addr"
						placeholder="상세주소" maxlength="50"/> <label class="la" style="margin-left: 20px">*50자
						이내</label>
				</div>
				<font color="red" size="2">${errMsgs.e_addr }</font>
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

