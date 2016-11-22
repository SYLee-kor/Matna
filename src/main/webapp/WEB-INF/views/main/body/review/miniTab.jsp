<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#review_photo{
  width: 80px;
  height: 50px;
}
</style>
<script>
	function readReview(no) {
		document.location.href="/matna/review/read?pageType=${pageType }&no="+no;
	}
</script>
<table id="review_table" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th><span>����</span></th>
							<th><span>����</span></th>
							<th><span>�ۼ���</span></th>
							<c:if test="${pageType=='review' }">
							<th>�����</th>
							</c:if>
							<c:if test="${pageType=='ranking' }">
							<th>���ƿ�!</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${miniList }" var="mini">
						<tr>
							<td onclick="readReview(${mini.no})" style="cursor:pointer;">${mini.photo }</td>
							<td onclick="readReview(${mini.no})" style="cursor:pointer;">${mini.title }</td>
							<td>${mini.nickName }</td>
							<c:if test="${pageType=='review' }">
								<td>${mini.regdate }</td>
							</c:if>
							<c:if test="${pageType=='ranking' }">
								<td>${mini.good }</td>
							</c:if>
						</tr>
						</c:forEach>
					</tbody>
				</table>