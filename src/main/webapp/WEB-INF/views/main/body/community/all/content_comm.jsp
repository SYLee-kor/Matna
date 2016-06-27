<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<!-- services 라이브러리 불러오기 -->
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
    <h1 style="width: 70%;margin-left: 15%;margin-top: 2%;">자유게시판</h1>

   <form name="frm" id="frm" method="post">
      <input type="hidden" name="type" id="type" value="free" />
         <input type="hidden" name="no" id="no" value="${board.no }" />
         <input type='hidden' name='page' id='page' value ="${cri.page}">
             <input type='hidden' name='perPageNum' id='perPageNum' value ="${cri.perPageNum}">
             <input type='hidden' name='searchType' id='searchType' value ="${cri.searchType}">
             <input type='hidden' name='keyword' id='keyword' value ="${cri.keyword}">
      
       <br>
       <div class="row"></div>
       <table style="margin-left: 20%;width: 60%;">
         <tr class="review_tr">
            <td colspan="4" class="review_td">
                  <input type="button" readonly="readonly" value="글제목" id="comm_img">    
                    ${board.title }
            </td>
         </tr>
         <tr class="comm_tr">
           <td class="comm_td"> 
                <input type="button" readonly="readonly" value="No." class="comm_img">   ${board.no }</td>
           <td class="comm_td"> 
                <input type="button" readonly="readonly" value="작성자" class="comm_img">  ${board.writer }</td>
           <td class="comm_td"> 
                <input type="button" readonly="readonly" value="작성일"class="comm_img">   ${board.regdate }</td>
           <td class="comm_td"> 
                <input type="button" readonly="readonly" value="조회수"class="comm_img">   132</td>
         </tr>
       </table>
        
        <div id="comm_content" >
              <div id="comm_content2">
                  ${board.content }</div>
        </div>    
        
        
         <%--버튼으로 바꿀예정!! --%>
     <div id="comm_bt">
        <a href="#" onclick="javascript:page_move('/matna/community/update');" class="comm_bt"><span>수정하기</span></a>
        <a href="#" onclick="javascript:page_move('/matna/community/delete');" class="comm_bt"><span>삭제하기</span></a>
        <a href="#" onclick="javascript:page_move('/matna/community/listPage');" class="comm_bt"><span>목록으로</span></a>
      <!-- <input type=button value="수정" 
             onclick="javascript:page_move('/matna/community/update');">
      <input type=button value="삭제" 
             onclick="javascript:page_move('/matna/community/delete');">
      <input type=button value="목록으로" 
             onclick="javascript:page_move('/matna/community/listPage');">     -->   
      </div>   
 </form>

    <%@include file="/WEB-INF/views/main/body/community/all/replyPage.jsp" %>
    <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>