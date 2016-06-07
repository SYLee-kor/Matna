<%@page import="com.kosta.matna.domain.community.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
		<table id="freeTable" align="center">
			<tr>
				<th width="73">NO</th>
				<th width="379">제목</th>
				<th width="73">작성자</th>
				<th width="164">작성일</th>
				<th width="58">조회수</th>

				<c:forEach var="free" items="${freeList}" varStatus="stat">
					<tr height="1" align="center">
						<td>${free.no}</td>
						<td><a href="/matna/community/listOne?no=${free.no}&type=free">${free.title }</a></td>
						<td>${free.writer}</td>
						<td>${free.regdate }</td>
						<td>${free.viewCnt}</td>
					</tr>
				</c:forEach>
		</table>

		<div align="right" style="width: 90%;">
			<button onclick="javascript:location.href='/matna/community/write';">글등록</button>
		</div>
	<form name="s"
		action="/Matna/community/free.do?action=freeList&&searchs=1&&page=1"
		method="post">
		<div align="center">

			<select name="freeSelect" id="freeSelect">
				<option id="title">제목</option>
				<option id="content">작성자</option>
			</select> <input type="text" name="searches" id="searches" value="${search }">
			<input type="submit" value="검색">
		</div>
		<br> <br>
	</form>

</body>
</html>