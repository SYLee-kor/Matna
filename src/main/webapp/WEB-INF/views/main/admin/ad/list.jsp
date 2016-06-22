<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<title>관리자</title>

</head>
<%@include file="/WEB-INF/views/main/admin/adminHeader.jsp" %>
<body>
<center>
<br><br>
<h3>광고 리스트</h3>
<table id="Table" align="center" border="1">
		<tr>
			<th width="50"><input type="checkbox" name="chkAll" onclick="CheckAll(this)"/></th>
			<th width="73">NO</th>
			<th width="379">제목</th>
		</tr>
			<c:forEach var="ad" items="${ad}" varStatus="stat">
				<tr height="1" align="center">
					<td>
					<input type="checkbox" name="check" value="${ad.no}"/>
					<input type='hidden' name="delNo" value="${ad.no}">
					</td>
					<td>${ad.no}</td>
					<td>
		            <a href="/matna/admin/AD/read?no=${ad.no }&page=${pageMaker.cri.page}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${ad.title }</a>
					</td>
				</tr>
			</c:forEach>
	</table>
	<br><br>
	<div align="right" style="width: 70%;">
		<button onclick="javascript:location.href='/matna/admin/AD/write';">등록</button>
		<button id="delete">제거</button>
	</div>
	<br>
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
	<form id="pageData" action="/matna/admin/AD/list" method="get">
		<input type='hidden' name="page" id="page" value="${pageMaker.cri.page}">
		<input type='hidden' name="perPageNum"
			value="${pageMaker.cri.perPageNum}">
			
		<div align="center">
				<select name="searchType">
						<option value="title"
							<c:out value="${pageMaker.cri.searchType eq 'title'?'selected':''}"/>>
							제목</option>
						<option value="comments"
							<c:out value="${pageMaker.cri.searchType eq 'comments'?'selected':''}"/>>
							내용</option>
				</select> 
				<input type="text" name='keyword' id="keywordInput"
						value='${pageMaker.cri.keyword }'>
			<input type="submit" id="searchBtn" value="검색">
		</div>
		<br> <br>
	</form>
	</center>
	<script type="text/javascript">
	$('#searchBtn').on("click",function(event) {
		$('#page').val('1');
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
	});
	
	$("a[name=page]").on("click", function(event) {
			event.preventDefault();
			var targetPage = $(this).attr("href");
			var f = $("#pageData");
			f.find("[name='page']").val(targetPage);
			f.submit();
		});
	
	function CheckAll(obj){
		   var state = $(obj).prop("checked");  ﻿
		   $("input[name=check]").each(function(no){
		    if( state == true ){
		     $(this).prop('checked', true);
		    }else{
		     $(this).prop('checked', false);
		    }
		   });
		  }
	
	$('#delete').click(function(){
		var length = $('input[name=check]:checked').length;
		if(length>=1){
			$('input[name=check]:checked').each(function(index){
				$.ajax({
					url:'/matna/admin/AD/delete',
					data:{
						no:$(this).val()
					},
					success:function(){
 						document.location.href = "/matna/admin/AD/list?page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}";
					}
				});
			});
		}else{
			alert("삭제를 하나 이상 선택해 주세요");
			$('input[name=check]:checked').each(function(){ this.checked = false;});
		}
	});
	</script>
	
</body>
</html>