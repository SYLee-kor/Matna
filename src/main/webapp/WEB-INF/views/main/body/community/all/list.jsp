<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kosta.matna.domain.community.BoardVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<meta name="description" content="">
<meta name="keywords" content="" />
<meta name="viewport" content="initial-scale=1">

</head>
<body>

	<%@include file="/WEB-INF/views/matnaHeader.jsp"%>

	<div class="col-md-1 col-sm-1"></div>
	<div class="col-md-10 col-sm-10">
		<div id="reviewList">
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
					게시판
			</h1>
			<br>

			<div class="tabBlock-content">
				<div class="tabBlock-pane">
					<table class="review_List" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th style="width: 50px; padding: 0px; text-align: center"><span>No</span></th>
								<th style="text-align: center;"><span>Title</span></th>
								<th style="text-align: center; width: 150px;"><span>작성자</span></th>
								<th style="width: 70px; padding: 0px; text-align: center;">조회수</th>
								<th style="text-align: center;"><span>date</span></th>

							</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${list}" varStatus="stat">
							<tr class="list_lists">
								<td style="width: 50px; padding: 0px;">${list.no}</td>
								<td>
								<c:choose> 
						    		<c:when test="${userNo eq list.writer &&type eq 'suggest'}">
										<a href="/matna/community/listOne?no=${list.no}&type=${type}&page=${pageMaker.cri.page}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}"
										 style="font-size: 13px;">${list.title }</a>
											<input type="button" readonly="readonly" class="reply_num"
											value="${list.replyCnt }" style="cursor: default;">
									</c:when>
									<c:when test="${type != 'suggest' }">
										<a href="/matna/community/listOne?no=${list.no}&type=${type}&page=${pageMaker.cri.page}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}"
										 style="font-size: 13px;">${list.title }</a>
											<input type="button" readonly="readonly" class="reply_num"
											value="${list.replyCnt }" style="cursor: default;">
									</c:when>
						    		<c:otherwise>
						 	   			${list.title } <input type="button" readonly="readonly" class="reply_num"
											value="${list.replyCnt }" style="cursor: default;">
						    		</c:otherwise>
								</c:choose>
								</td>
								<td>
								<c:choose> 
						    		<c:when test="${type eq 'noname'}">
										익명
									</c:when>
						    		<c:otherwise>
						 	   			${list.nickName }
						    		</c:otherwise>
								</c:choose>
								</td>
								<td>${list.viewCnt}</td>
								<td>${list.regdate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

					<!-- ------ paging 처리--------- -->
					<center>
						<ul class="pagination modal-1" id="pagination">
							<li><a href="#" id="goStart" class="prev">&laquo</a></li>
							<c:if test="${pageMaker.prev}">
							<li><a name="page" href="${pageMaker.startPage - 1}">Prev</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li><a name="page" href="${idx}">${idx}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a name="page" href="${pageMaker.endPage +1}">Next</a></li>
							</c:if>
							<li><a href="#" id="goEnd" class="next">&raquo;</a></li>
						</ul>
						<br>
						<c:choose> 
						    		<c:when test="${type eq 'faq' || type eq 'notice'}">
						    			<c:if test="${userGrade > 3 && isLogin == true}">
							    			<div class="list_write_bt" id="reviewlist_write_bt">
											<a href="/matna/community/write?type=${type }"><span><b>글 쓰기</b></span></a>
											</div>
										</c:if>
						    		</c:when>
						    		<c:when test="${type eq 'meeting' }">
						    			<c:if test="${userGrade > 2 && isLogin == true}">
							    			<div class="list_write_bt" id="reviewlist_write_bt">
											<a href="/matna/community/write?type=${type }"><span><b>글 쓰기</b></span></a>
											</div>
										</c:if>
						    		</c:when>
						    		<c:when test="${isLogin == true }">
						    			<div class="list_write_bt" id="reviewlist_write_bt">
										<a href="/matna/community/write?type=${type }"><span><b>글 쓰기</b></span></a>
										</div>
						    		</c:when>
						</c:choose>
						

						<!-- =============검색================== -->
						<table>
							<tr>
								<td><span include="form-input-select2()">
								<select required name="searchType" id="searchType">
								<option value="title"
								<c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
								제목</option>
								<option value="writer"
								<c:out value="${cri.searchType eq 'writer'?'selected':''}"/>>
								작성자</option>
								</select>
								</span></td>
								<td>
								<form id="pageData" action="/matna/community/list" class="searchform2 cf" method="get">
								<input type='hidden' name="page" id="page" value="${pageMaker.cri.page}">
								<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
								<input type="hidden" name="type" id="type" value="${type }"/>
								<input type="hidden" name="searchType" id="searchType" value="${pageMaker.cri.searchType }"/>
										<span><input type="text" name='keyword' id="keywordInput" value='${pageMaker.cri.keyword }'></span>
										<span><button type="button" id="searchBtn" class="list_searchbt">검색</button></span>
									</form>
								</td>
							</tr>
						</table>

					</center>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$('#searchBtn').on("click",function(event) {
		$('#page').val('1');
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("#searchType > option:selected").val()
						+ "&keyword=" + $('#keywordInput').val()
						+ "&type="
						+ '${type}';
	});
	
	$("a[name=page]").on("click", function(event) {
			event.preventDefault();
			var targetPage = $(this).attr("href");
			var f = $("#pageData");
			f.find("[name='page']").val(targetPage);
			f.submit();
		});
	$("#goStart").on("click", function(event) {
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var f = $("#pageData");
		f.find("[name='page']").val('1');
		f.submit();
	});
	$("#goEnd").on("click", function(event) {
		event.preventDefault();
		var targetPage = $(this).attr("href");
		var f = $("#pageData");
		f.find("[name='page']").val('${pageMaker.end}');
		f.submit();
	});
	</script>

	<%@include file="/WEB-INF/views/footer.jsp"%>