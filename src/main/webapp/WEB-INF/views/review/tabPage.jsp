<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
function showContents(no) {
	var moveUrl = "/matna/review/read?no="+no
			+"&pageType=${pageType}&tabType=${tabType}&page=${pageMaker.cri.page}";
	document.location.href=moveUrl;
}
</script>
<table id="menuTable" style="width: 100%">
	<c:forEach var="review" items="${list }" varStatus="stat">
		<c:if test="${review.parking==1 }">
			<c:set var="parking" value="있음" />
		</c:if>
		<c:if test="${review.parking==0 }">
			<c:set var="parking" value="없음" />
		</c:if>
		<tr>
			<td><span style="cursor:pointer;" onclick="showContents(${review.no})">${review.photo }</span></td>
			<td>
				<table style="width: 100%">
					<tr>
						<td colspan="3" width="400">
							<font color="dd0077"><b>
								<span style="cursor:pointer; color: #59baba" onclick="showContents(${review.no})">${review.title } [${review.replyCnt }]</span>
							</b></font>
						</td>
						<td>
							<font color="da1010" size=2>작성자 : <b>${review.writer }</b></font>
						</td>
					</tr>
					<tr>
						<td><font color="orange" size="2">등록일 : <b>${review.regdate }</b></font></td>
						<td><font color="15b5dd" size="2">주차장 <b>${parking}</b></font></td>
						<td><font color="aacc55" size="2">추천메뉴 : <b>${review.recommend }</b></font></td>
						<td><font color="#888888" size="2">조회수 : ${review.viewCnt }</font></td>
					</tr>
				</table>
			</td>
		</tr>
	</c:forEach>
</table>
<c:if test="${pageDivShow eq 'ON' }">
<div align="center" id="reviewPageDiv">
		<br>
		<br>
		<button class="button" onclick="showPage('${type}',1)">처음</button>
		<button class="button" onclick="showPage('${type}',beStart,beEnd)">이전</button>
		<c:forEach items="list" var="reviewDTO" varStatus="stat">
			<a href=#aList onclick="showPage('${type}',${start },${end },${reviewCnt })">${stat.index }</a>
		</c:forEach>
		<button class="button" onclick="showPage('${type}',afStart,afEnd,${reviewCnt })">다음</button>
		<button class="button" onclick="showPage('${type}',${lastStart} ,${lastEnd})">끝</button>
	</div>
	<br>
</c:if>