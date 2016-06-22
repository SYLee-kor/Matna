<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#back').click(function(){
		document.location.href="/matna/admin/AD/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            var file = input.files[0].name;
            var img_format = "\.(bmp|gif|jpg|jpeg|png)$";
            if(!(new RegExp(img_format, "i")).test(file)){
            	alert("이미지 파일만 올려주세요");
                $('#file').val('');
                return;
            }
            reader.onload = function (e) {
                $('#photo').attr('src', e.target.result);
            }                   
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#file").change(function(){
        readURL(this);
    });
 });
</script>
</head>
<body>
<br><br><br>
	<center>
	<h3>광고 상세</h3>
	
	<form method="post" enctype="multipart/form-data" id="form" action="/matna/admin/AD/update">
	<input type='hidden' name="page" value="${cri.page}">
	<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
	<input type='hidden' name="searchType" value="${cri.searchType}">
	<input type='hidden' name="keyword" value="${cri.keyword}">
	<table border="1">
		<tr>
			<td colspan="2">
			<c:if test="${AD.photo!=null}">
				<img src="/matna/resource/images/admin/ad/${AD.photo}" id="photo" width="550px" height="150px"><br>
			</c:if>
			<c:if test="${AD.photo==null}">
				<img src="" id="photo" width="550px" height="150px"><br>
			</c:if>
				<input type="file" id="file" name="file" accept="image/*">
				<input type="hidden" value="${AD.photo}" name="photo">
			</td>
		</tr>
		<tr>
			<td class="name" width="100p">제목</td>
			<td class="val"><input type="text" name="title"  value="${AD.title}" style="width:400px;"></td>
		</tr>
		<tr>
			<td class="name">링크</td>
			<td class="val"><input type="text" name="link" value="${AD.link}" style="width:400px;"></td>
		</tr>
		<tr>
		<td class="name" style="height:100px;">정보</td>
			<td class="val"><textarea name="comments" style="width:400px; height:80px;">${AD.comments}</textarea></td>
		</tr>
	</table>
	<br>
	<c:if test="${AD.no!=null}">
			<input type="hidden" value="${AD.no}" name="no">
	</c:if>
<%-- 	<c:if test="${AD.no==null}">
			<input type="hidden" value="0" name="no">
	</c:if> --%>
	<input type="submit" value="저장" id="submit">
	<input type="button" value="취소" id="back">
	</form>
	</center>
</body>
</html>