<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="freetable">
<a href="/matna/community/list?type=free"><h1>Free Board</h1></a>
		  
		  <table id="free_table" cellpadding="0">
		    <thead>
		      <tr>
		        <th><span>title</span></th>
		        <th><span>작성자</span></th>
		        <th><span>조회수</span></th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="list1" items="${list1}" varStatus="stat">
		      <tr>
		         <td><a href="/matna/community/listOne?no=${list1.no}&type=${type1}">${list1.title }</a>[${list1.replyCnt }]</td>
		         <td>${list1.nickName }</td>
		         <td>${list1.viewCnt}
		         </td>
		      </tr>
		    </c:forEach>
		    </tbody>
		  </table>
		 </div> 