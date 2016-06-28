<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<!-- services 라이브러리 불러오기 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d57f90536554e1d1025bdf0836b0ed4f&libraries=services"></script>
<script type="text/javascript" src="/matna/resource/js/daumMap.js"></script>
<script src="/matna/resource/jqplot/jquery.jqplot.min.js"/></script>
<script type="text/javascript" src="/matna/resource/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript">
window.onload = function() {
	listReply('${board.no }');
}

function page_move(url) {
	var f = document.frm;
	$('#frm').prop("action",url)
	f.submit();
}
</script>
</head>
<body>
			<h1 style="width: 70%;margin-left: 15%;margin-top: 2%;">
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
					게시판
			</h1>
		<form name="frm" id="frm" method="post">
			<input type="hidden" name="type" id="type" value="${type }" />
			<input type="hidden" name="no" id="no" value="${board.no }" />
			<input type='hidden' name='page' id='page' value ="${cri.page}">
   		    <input type='hidden' name='perPageNum' id='perPageNum' value ="${cri.perPageNum}">
   		    <input type='hidden' name='searchType' id='searchType' value ="${cri.searchType}">
   		    <input type='hidden' name='keyword' id='keyword' value ="${cri.keyword}">
			<table id="contentTable">
				<tr align="center">
					<td align="center" width="200">글번호</td>
					<td width="800">${board.no }</td>
				</tr>
				<tr align="center">
					<td align="center">작성자</td>
					<td>${board.writer }</td>
				</tr>
				<tr align="center">
					<td align="center">작성일</td>
					<td>${board.regdate }</td>
				</tr>
				<tr align="center">
					<td align="center">제목</td>
					<td>${board.title }</td>
				</tr>
				<tr>
					<td colspan="2"
						style="width: 1000px; height: 500px; overflow: scroll;">${board.content }</td>
				</tr>
			</table>
			<br> <input type=button value="목록으로"
				onclick="javascript:page_move('/matna/community/listPage');"> <input
				type=button value="수정"
				onclick="javascript:page_move('/matna/community/update');"> <input
				type=button value="삭제"
				onclick="javascript:page_move('/matna/community/delete');">
		</form>
		<br> <br>
	<%@include file="/WEB-INF/views/main/body/community/all/replyPage.jsp" %>
	</center>
</body>
</html>