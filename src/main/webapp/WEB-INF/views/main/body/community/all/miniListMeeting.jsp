<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="meetingtable">
			  <a href="/matna/community/list?type=meeting"><h1>Meeting Board</h1></a>
			  
			  <table id="meeting_table" cellspacing="0" cellpadding="0">
			    <thead>
			      <tr>
			        <th style="width: 300px;text-align: left;"><span>title</span></th>
			        <th style="width: 150px;text-align: left;"><span>작성자</span></th>
			        <th style="width: 80px;text-align: left;"><span>조회수</span></th>
		          </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="list2" items="${list2}" varStatus="stat">
		      <tr>
		         <td style="text-align: left;padding-left: 20px;"><a href="/matna/community/listOne?no=${list2.no}&type=${type2}">${list2.title }</a>[${list2.replyCnt }]</td>
		         <td style="text-align: left;"> ${list2.nickName }</td>
		         <td style="text-align: center;">${list2.viewCnt}</td>
		      </tr>
		    </c:forEach>
			    </tbody>
			  </table>
			 </div> 