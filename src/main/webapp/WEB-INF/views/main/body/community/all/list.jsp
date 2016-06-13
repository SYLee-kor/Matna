<%@page import="com.kosta.matna.domain.community.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script type="text/javascript"
	src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<link href="/matna/resource/css/main/body/community/all/list.css"
	rel="stylesheet" type="text/css" />


</head>
<body>
<center>
<h1>
<c:choose> 
    <c:when test="${type eq 'notice'}">
             공지
    </c:when> 
    <c:when test="${type eq 'meeting'}">
             만남
    </c:when> 
    <c:when test="${type eq 'noname'}">
             익명
    </c:when> 
    <c:when test="${type eq 'suggest'}">
              건의
    </c:when> 
    <c:when test="${type eq 'faq'}">
   	  faq
    </c:when> 
    <c:otherwise>
 	   자유
    </c:otherwise>
</c:choose>
게시판</h1>
	<table id="Table" align="center">
		<tr>
			<th width="73">NO</th>
			<th width="379">제목</th>
			<th width="73">작성자</th>
			<th width="164">작성일</th>
			<th width="58">조회수</th>

			<c:forEach var="list" items="${list}" varStatus="stat">
				<tr height="1" align="center">
					<td>${list.no}</td>
					<td>
					<c:choose> 
					    <c:when test="${userID eq list.writer}">
					             <a href="/matna/community/listOne?no=${list.no}&type=${type}">${list.title }</a>
					    </c:when>
					    <c:otherwise>
					 	   ${list.title }
					    </c:otherwise>
					</c:choose>
					</td>
					<td>${list.writer}</td>
					<td>${list.regdate }</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
	</table>

	<div align="right" style="width: 70%;">
		<button onclick="javascript:location.href='/matna/community/write';">글등록</button>
	</div>
	<br>
	<div>
			<c:if test="${pageMaker.prev}">
				<a name="page" href="${pageMaker.startPage - 1}">&laquo;</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<a name="page" href="${idx}">${idx}</a>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a name="page" href="${pageMaker.endPage +1}">&raquo;</a>
			</c:if>
	</div>
	<br>
	<form id="pageData" action="/matna/community/list" method="get">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name="perPageNum"
			value=${pageMaker.cri.perPageNum}>
	</form>

	<script type="text/javascript">
		$("a[name=page]").on("click", function(event) {
			alert("실행");
			event.preventDefault();
			var targetPage = $(this).attr("href");
			var f = $("#pageData");
			f.find("[name='page']").val(targetPage);
			f.submit();
		});
	</script>

	<form name="search"
		action="/matna/community/slist" method="get">
		<div align="center">
				<select name="searchType">
						<option value="title"
							<c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
							제목</option>
						<option value="writer"
							<c:out value="${cri.searchType eq 'writer'?'selected':''}"/>>
							작성자</option>
				</select> 
				<input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
			<input type="submit" value="검색">
		</div>
		<br> <br>
	</form>
	</center>
	<script type="text/javascript">
	$('#searchBtn').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
	});
	</script>
	

</body>
</html>