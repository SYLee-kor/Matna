<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#back').click(function(){
		document.location.href="/matna/admin/itemlistall";
	});
	
	
	//#아이템 스테이트 변경에서 포인트 등록일떄 가격, 수량 텍스트 필드 잠금
	$('#itemState').change(function() {
		if ( $(this).val()== 3 ) {
			$('input[name=price]').attr('readonly','readonly');
			$('input[name=amount]').attr('readonly','readonly');
			$('input[name=price]').val(0);
			$('input[name=amount]').val(0);
		}else{
			$('input[name=price]').removeAttr('readonly','readonly');
			$('input[name=amount]').removeAttr('readonly','readonly');
		};
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            var file = input.files[0].name;
            var img_format = "\.(bmp|gif|jpg|jpeg|png)$";
            if(!(new RegExp(img_format, "i")).test(file)){
            	alert("이미지 파일만 올려주세요");
                $('#file').val('');
                return;
            }
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                $('#photo').attr('src', e.target.result);
                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                //(아래 코드에서 읽어들인 dataURL형식)
            }                   
            reader.readAsDataURL(input.files[0]);
            //File내용을 읽어 dataURL형식의 문자열로 저장
        }
    }//readURL()--

    //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
    $("#file").change(function(){
        //alert(this.value); //선택한 이미지 경로 표시
        readURL(this);
    });
    
    $('#submit').click(function(){
    	var form = $('#form');
    	var action = "${action}";
		//$('#photo').val($('#file').val());
		form.attr("action","/matna/admin/${action}")
    });
    
    if("${action}"=="modifyitem"){
    	$("[name=state]").val("${items.state}");
    }
 });
</script>
</head>
<%@include file="/WEB-INF/views/main/admin/adminHeader.jsp" %>
<body>
<center>
	<h3>상품 상세 정보</h3>
	<hr>
		<form method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" name="action"/>
	<input type="hidden" name="no" />
	<table border="1">
		<tr>
			<td rowspan="5" colspan="2">
			<c:if test="${items.photo!=null}">
				<img src="/matna/resource/img/${items.photo}" id="photo" width="300px" height="300px"><br>
			</c:if>
			<c:if test="${items.photo==null}">
				<img src="" id="photo" width="300px" height="300px"><br>
			</c:if>
				<input type="file" id="file" name="file" accept="image/*">
				<input type="hidden" value="${items.photo}" name="photo">
			</td>
			<td class="name">상품명</td>
			<td class="val"><input type="text" name="name"  value="${items.name}"></td>
		</tr>
		<tr>
			<td class="name">가격</td>
			<td class="val"><input type="text" name="price" value="${items.price}"></td>
		</tr>
		<tr>
			<td class="name">수량</td>
			<td class="val"><input type="text" name="amount" value="${items.amount}"></td>
		</tr>
		<tr>
		<td class="name">정보</td>
			<td class="val"><input type="text" name="content" value="${items.content}"></td>
		</tr>
		<tr>
		<td class="name">상품 상태</td>
		<td>
			<select name="state" id="itemState">
				<option value="0">일반 상품</option>
				<option value="1">인기 상품</option>
				<option value="2" selected="selected">신상품</option>
				<option value="3">포인트 등록</option>
			</select>
		</td>
		</tr>
	</table>
	<br>
	<input type="hidden" value="${items.ino}" name="ino">
	<input type="submit" value="저장" id="submit">
	<input type="button" value="취소" id="back">
	</form>
	</center>
</body>
</html>