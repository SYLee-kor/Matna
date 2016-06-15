<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#delete').click(function() {
			formObj.attr("action", "/message/delete");
			formObj.submit();
		});
		
		$('#search').click(function() {
			formObj.attr("action", "/message/sendList");
			formObj.submit();
		});
	});
</script>

<script>
	function showPage(page,messageSelect,search) {
		document.location.href='/message/sendList?searchs=1&&'
				+'messageSelect='+messageSelect+'&&searches='+search+'&&page='+page;
	}
</script>

<c:if test="${page > 1 }">
	<c:set value="${page-1 }" var="beforePage" />
</c:if>
<c:if test="${page == 1 }">
	<c:set value="${oldPage }" var="beforePage" />
</c:if>
<c:if test="${page < senderTotalPage }">
	<c:set value="${page+1 }" var="nextPage" />
</c:if>
<c:if test="${page == senderTotalPage }">
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
					<h3 class="box-title">보낸 메세지</h3>
				</div>
				<div class="box-body">

<form name="delete_message" method="post" role="form">
"프렌"님의 보낸 쪽지함
<input type="hidden" name="message" id="message" value="send" />
<table class="table table-bordered" border="1">
	<tr align="center">
		<th></th>
		<th>받는이</th>
		<th width="80px">제목</th>
		<th width="200px">내용</th>
		<th>날짜</th>
		<th>읽음상태</th>
	</tr>


<c:forEach items="${list}" var="messageVO">
	<c:set var="state_num" value="${messageVO.state }"/>
	<c:if test="${ state_num == 0}">
		<c:set var="state" value="읽지 않음"/>
	</c:if>
	<c:if test="${ state_num == 1}">
		<c:set var="state" value="읽음"/>
	</c:if>
	<tr align="center">
		<td><input type="checkbox" name="check" id="check" value="${messageVO.no}"/></td>
		<td>${messageVO.receiverNickname}</td>
		<td>${messageVO.title}</td>
		<td><a href='/message/read?no=${messageVO.no}&message=send&searches=${search}'>${messageVO.content}</a></td>
		<td>${messageVO.sendDate}</td>
		<td>${state}</td>
	</tr>

</c:forEach>

</table>

	<select name="messageSelect" id="messageSelect">
    	<option id="title">제목</option>
    	<option id="content">내용</option>
   	</select>
	<input type="text" name="searches" id="searches" value="${search }">
	<input type="submit" value="검색" name="search" id="search">
	<input type="submit" name="delete" value="삭제" id="delete" class="btn btn-delete" />
	
	<br>
		<div>
			<input type="button" class="button" onclick="showPage(1,'${messageSelect }','${search }')" value="처음">
			<%-- <input type="button" class="button" value="이전" onclick="showPage(${beforePage})"> --%>
			<c:forEach var="i" begin="1" end="${senderTotalPage }">
            [<a href="javascript: showPage(${i },'${messageSelect }','${search }')">${i}</a>]
			
         	</c:forEach>
			<%-- <input type="button" class="button" value="다음" onclick="showPage(${nextPage})"> --%>
			<input type="button"  class="button" onclick="showPage(${senderTotalPage },'${messageSelect }','${search }')" value="끝">
		</div>
</form>

<hr>



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

