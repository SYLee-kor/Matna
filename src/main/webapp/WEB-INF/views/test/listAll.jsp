<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#delete').click(function() {
			formObj.attr("action", "/join/delete");
			formObj.submit();
		});
	});
</script>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Member List</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered" border="1">
	<tr>
		<th style="width: 10px">NO</th>
		<th>아이디</th>
		<th>비번</th>
		<th>이름</th>
		<th>생일</th>
		<th>성별</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>포인트</th>
		<th>가입일</th>
	</tr>


<c:forEach items="${list}" var="memberVO">

	<tr>
		<td>${memberVO.no}</td>
		<td>${memberVO.id}</td>
		<td>${memberVO.pw}</td>
		<td>${memberVO.name}</td>
		<td>${memberVO.birth}</td>
		<td>${memberVO.gender}</td>
		<td>${memberVO.email}</td>
		<td>${memberVO.phone}</td>
		<td>${memberVO.post}</td>
		<td>${memberVO.addr}</td>
		<td>${memberVO.point}</td>
		<td>${memberVO.regdate}</td>
	</tr>

</c:forEach>

</table>


<form name="delete_member" method="post" role="form">
	<input type="text" name="no" id="no"/>
	<input type="submit" name="delete" value="삭제" id="delete" class="btn btn-delete" />
</form>

				</div>
				<!-- /.box-body -->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>

