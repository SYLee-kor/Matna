<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<script src="<c:url value="/resource/jquery/jquery-2.2.3.js"/>"></script>
<script type="text/javascript">
function page_move(url) {
	var f = document.frm;
	$('#frm').prop("action",url)
	f.submit();
}
</script>
</head>
<body>
	<center>
		<br> <br> <br>
		<form name="frm" id="frm" method="post">
			<input type="hidden" name="type" id="type" value="free" />
			<input type="hidden" name="no" id="no" value="${free.no }" />
			<table id="contentTable">
				<tr align="center">
					<td align="center" width="200">글번호</td>
					<td width="800">${free.no }</td>
				</tr>
				<tr align="center">
					<td align="center">작성자</td>
					<td>${free.writer }</td>
				</tr>
				<tr align="center">
					<td align="center">작성일</td>
					<td>${free.regdate }</td>
				</tr>
				<tr align="center">
					<td align="center">제목</td>
					<td>${free.title }</td>
				</tr>
				<tr>
					<td colspan="2"
						style="width: 1000px; height: 500px; overflow: scroll;">${free.content }</td>
				</tr>
			</table>
			<br> <input type=button value="목록으로"
				onclick="javascript:location.href='/community/list';"> <input
				type=button value="수정"
				onclick="javascript:page_move('/community/update');"> <input
				type=button value="삭제"
				onclick="javascript:page_move('/community/delete');">
		</form>
		<br> <br>
	</center>
</body>
</html>