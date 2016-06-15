<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		var formObj2 = $("form[role='form2']");
		
		$('#delete').click(function() {
			formObj.attr("action", "/message/delete");
			formObj.submit();
		});

		$('#delete2').click(function() {
			formObj2.attr("action", "/message/delete");
			formObj2.submit();
		});
	});
</script>

<script>
	function showPage(page) {
		document.location.href='/message/listAll?page='+page;
	}
</script>

<c:if test="${page > 1 }">
	<c:set value="${page-1 }" var="beforePage" />
</c:if>
<c:if test="${page == 1 }">
	<c:set value="${oldPage }" var="beforePage" />
</c:if>
<c:if test="${page < allTotalPage }">
	<c:set value="${page+1 }" var="nextPage" />
</c:if>
<c:if test="${page == allTotalPage }">
	<c:set value="${page }" var="nextPage" />
</c:if>

<!-- Main content -->
<section class="content">
	<div align="center" class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">전체 쪽지</h3>
				</div>
				<div class="box-body">

<form name="delete_message" method="post" role="form">

<table class="table table-bordered" border="1">
	<tr align="center">
		<th></th>
		<th>보낸이</th>
		<th>받는이</th>
		<th width="80px">제목</th>
		<th width="200px">내용</th>
		<th>날짜</th>
		<th>읽음상태</th>
	</tr>


<c:forEach items="${list}" var="messageVO">
	
	<input type="hidden" name="message" id="message" value="" />
	
	<c:set var="state_num" value="${messageVO.state }"/>
	<c:if test="${ state_num == 0}">
		<c:set var="state" value="읽지 않음"/>
	</c:if>
	<c:if test="${ state_num == 1}">
		<c:set var="state" value="읽음"/>
	</c:if>
	
	<tr align="center">
		<td><input type="checkbox" name="check" id="check" value="${messageVO.no}"/></td>
		<td>${messageVO.senderNickname}</td>
		<td>${messageVO.receiverNickname}</td>
		<td>${messageVO.title}</td>
		<td><a href='/message/read?no=${messageVO.no}&message=all'>${messageVO.content}</a></td>
		<td>${messageVO.sendDate}</td>
		<td>${state}</td>
	</tr>

</c:forEach>

</table>
	<input type="submit" name="delete" value="삭제" id="delete" class="btn btn-delete" />

<br>
		<div>
			<input type="button" class="button" onclick="showPage(1)" value="처음">
			<%-- <input type="button" class="button" value="이전" onclick="showPage(${beforePage})"> --%>
			<c:forEach var="i" begin="1" end="${allTotalPage }">
            [<a href="javascript: showPage(${i })">${i}</a>]
			
         	</c:forEach>
			<%-- <input type="button" class="button" value="다음" onclick="showPage(${nextPage})"> --%>
			<input type="button" class="button" onclick="showPage(${allTotalPage })" value="끝">
		</div>
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
    
    if(result == 'fail'){
    	alert("존재하지 않는 닉네임입니다.");
    }
    
    </script>

