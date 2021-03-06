<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/matna/resource/css/message.css">
</head>

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
   /* tab 실행 */
   (function() {
      if (!!location.hash)
         return;

      var link = document.querySelector('#tabs > .tab-link');
      if (link)
         link.click();
   })();
</script>
<script type="text/javascript">
   /* 첫번째 tab 받은쪽지함 */
   $(document).ready(function() {
	   
      var formObj2 = $("form[role='form2']");

      $('#delete2').click(function() {
         formObj2.attr("action", "/matna/message/delete");
         formObj2.submit();
      });
   });
</script>
<script type="text/javascript">
   /* 두번째 tab 보낸쪽지함 */
   $(document).ready(function() {
      var formObj = $("form[role='form']");

      $('#delete').click(function() {
         formObj.attr("action", "/matna/message/delete");
         formObj.submit();
      });
      
      $('#send').click(function() {
			formObj.attr("action", "/matna/message/sendSuccess");
			//formObj.attr("action2","null");
			formObj.submit();
		});
     
   });
   
   function read(no , message){
	   var bno = '#'+no;
	   $(bno).toggle();
	   
	   $.ajax({
	   	      type: "GET",
	   	      url: "/matna/message/read",
	   	      data: {
	   	    	  action: "/matna/message/read",
	   	    	  no: no,
	   	    	  message: message
	   	      },
	   	      success:function(result) {
	   	    	   /*  var s = result;
	   	        	alert(s);  */
	   	        	//window.location.reload();
	   	      }
	   	    });
   }
   
	function receiveShowPage(page,messageSelect,search) {
		document.location.href='/matna/message/listAll?searchs=1&&message=receive&&'
				+'messageSelect='+messageSelect+'&&searches='+search+'&&receivepage='+page+'#tab-1';
	}
	function sendShowPage(page,messageSelect,search) {
		document.location.href='/matna/message/listAll?searchs=1&&message=send&&'
				+'messageSelect='+messageSelect+'&&searches='+search+'&&sendpage='+page+'#tab-2';
	}
</script>

<c:if test="${receiverPage > 1 }">
	<c:set value="${receiverPage-1 }" var="receiverBeforePage" />
</c:if>
<c:if test="${receiverPage == 1 }">
	<c:set value="${receiverPage }" var="receiverBeforePage" />
</c:if>
<c:if test="${receiverPage < receiverTotalPage }">
	<c:set value="${receiverPage+1 }" var="receiverNextPage" />
</c:if>
<c:if test="${receiverPage == receiverTotalPage }">
	<c:set value="${receiverPage }" var="receiverNextPage" />
</c:if>
<!-- 위는 receive,  밑은 sender -->
<c:if test="${senderPage > 1 }">
	<c:set value="${senderPage-1 }" var="senderBeforePage" />
</c:if>
<c:if test="${senderPage == 1 }">
	<c:set value="${senderPage}" var="senderBeforePage" />
</c:if>
<c:if test="${senderPage < senderTotalPage }">
	<c:set value="${senderPage+1 }" var="senderNextPage" />
</c:if>
<c:if test="${senderPage == senderTotalPage }">
	<c:set value="${senderPage }" var="senderNextPage" />
</c:if>
   
<style type="text/css">
	a:link, a:visited{
		color : gray;
		text-decoration: none;
	}
	
	@font-face{font-family:'Nanum Gothic'; src:url('/fonts/NanumGothic.woff')}
</style>	

<body>

   <div id="tabs" style="font-family: 'Nanum Gothic' ;" >
      <span id="tab-1" class="tab-switch"></span> 
      	<a href="#tab-1" class="tab-link"><h4 id="tab-select">받은 쪽지함</h4></a>
      <div class="tab-content">
         <!-- Main content -->
         <div class="row">
            <!-- left column -->
            <div class="col-md-12">
               <!-- general form elements -->
			
               <div id="read" class="box">
                  <!-- <div class="box-header with-border">
                     <h1 class="box-title">받은 메세지</h1>
                  </div> -->
                  <div class="box-body">
                     <form name="delete_message" method="post" role="form2">
                     	 <input type="hidden" name="message" id="message" value="receive" />

                        <table class="table table-bordered" style="text-align:center; margin:auto;
                        		 border:1px soild #ff7359; width:100%; height:100px;">
                           <tr align="center" style="border:1px solid #ff7359;">
                              <th></th>
                              <th width="100px">보내는이</th>
                              <th width="300px">제목</th>
                              <th>날짜</th>
                              <th>읽음상태</th>
                           </tr>

                           <c:forEach items="${receiveList}" var="messageVO">
                              <c:set var="state_num" value="${messageVO.state }" />
                              <c:if test="${ state_num == 0}">
                                 <c:set var="state" value="읽지 않음" />
                              </c:if>
                              <c:if test="${ state_num == 1}">
                                 <c:set var="state" value="읽음" />
                              </c:if>
                              
                              <tr align="center">
                                 <td><input type="checkbox" name="check"
                                    value="${messageVO.no}" /></td>
                                 <td>${messageVO.senderNickname}</td>
                                 <td><a href="javascript:read(${messageVO.no},'receive')">${messageVO.title}</a></td>
                                 <td>${messageVO.sendDate}</td>
                                 <td>${state}</td>
                              </tr>
                              <tr align="center" id="${messageVO.no}" class="b">
                                 <td></td>
                                 <td style="background:#e8f8fd;">내용</td>
                                 <td colspan="3" style="background:#e8f8fd;">${messageVO.content}</td>
                                 <td></td>
                                 <td></td>
                              </tr>

                           </c:forEach>

                        </table>
                        <input type="submit" name="delete2" value="삭제" id="delete2"
                           class="btn btn-delete2" />
       <br>
         <div class="page">
         	<ul class="pagination modal-1" id="pagination">
         	<li><a href="javascript: receiveShowPage(1,'${messageSelect }','${search }')" class="prev">&laquo</a></li>
            <li><a href="javascript: receiveShowPage(${receiverBeforePage },'${messageSelect }','${search }')" class="prev">prev</a></li>
			<c:forEach var="i" begin="1" end="${receiverTotalPage }">
            	<li><a onfocus="" href="javascript: receiveShowPage(${i },'${messageSelect }','${search }')">${i}</a></li>
         	</c:forEach>
         	<li><a href="javascript: receiveShowPage(${receiverNextPage },'${messageSelect }','${search }')" class="next">next</a></li>
            <li><a href="javascript: receiveShowPage(${receiverTotalPage },'${messageSelect }','${search }')" class="next">&raquo;</a></li>
         	</ul>
		</div>
                     </form>

                  </div>
                  <!-- /.box-body -->
               </div>
            </div>
            <!--/.col (left) -->

         </div>
         <!-- /.row -->
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->

      <span id="tab-2" class="tab-switch"></span> <a href="#tab-2"
         class="tab-link"><h4 id="tab-select">보낸 쪽지함</h4></a>
      <div class="tab-content">
         <div class="row">
            <!-- left column -->
            <div class="col-md-12">
               <!-- general form elements -->

               <div class="box">
                  <!-- <div class="box-header with-border">
                     <h1 class="box-title">보낸 메세지</h1>
                  </div> -->
                  <div class="box-body">

                     <form name="delete_message" method="post" role="form">
                        <input type="hidden" name="message" id="message2"
                           value="send" />
                        <table class="table table-bordered" style="text-align:center; margin:auto; border:1px soild #ff7359; width:100%; height:100px;">
                           <tr align="center">
                              <th></th>
                              <th width="100px">받는이</th>
                              <th width="300px">제목</th>
                              <th>날짜</th>
                              <th>읽음상태</th>
                           </tr>


                           <c:forEach items="${sendList}" var="messageVO">
                              <c:set var="state_num" value="${messageVO.state }" />
                              <c:if test="${ state_num == 0}">
                                 <c:set var="state" value="읽지 않음" />
                              </c:if>
                              <c:if test="${ state_num == 1}">
                                 <c:set var="state" value="읽음" />
                              </c:if>
                              <tr align="center">
                                 <td><input type="checkbox" name="check" id="check"
                                    value="${messageVO.no}" /></td>
                                 <td>${messageVO.receiverNickname}</td>
                                 <td><a href="javascript:read(${messageVO.no},'send')">${messageVO.title}</a></td>
                                 <td>${messageVO.sendDate}</td>
                                 <td>${state}</td>
                              </tr>
                              <tr align="center" id="${messageVO.no}" class="b">
                                 <td></td>
                                 <td width="100px" style="background:#e8f8fd;">내용</td>
                                 <td colspan="3" style=" background:#e8f8fd;">${messageVO.content}</td>
                                 <td></td>
                                 <td></td>
                              </tr>

                           </c:forEach>

                        </table>
                        
                        <input type="submit" name="delete" value="삭제" id="delete"
                           class="btn btn-delete" />
                      <br>
		<div class="page">
			<ul class="pagination modal-1" id="pagination">
			<li><a href="javascript: sendShowPage(1,'${messageSelect }','${search }')" class="prev">&laquo;</a></li>
            <li><a href="javascript:sendShowPage(${senderBeforePage},'${messageSelect }','${search }')" class="prev">prev</a></li>
			<c:forEach var="i" begin="1" end="${senderTotalPage }">
            	<li><a href="javascript: sendShowPage(${i },'${messageSelect }','${search }')">${i}</a></li>
         	</c:forEach>
         	<li><a href="javascript:sendShowPage(${senderNextPage},'${messageSelect }','${search }')" class="next">next</a></li>
            <li><a href="javascript:sendShowPage(${senderTotalPage },'${messageSelect }','${search }')" class="next">&raquo;</a></li>
         	</ul>
		</div>
                     </form>
                  </div>
                  <!-- /.box-body -->
               </div>
            </div>
            <!--/.col (left) -->

         </div>
         <!-- /.row -->
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->



      <span id="tab-3" class="tab-switch"></span> <a href="#tab-3"
         class="tab-link"><h4 id="tab-select">쪽지 보내기</h4></a>
      <div class="tab-content">
         <!-- Main content -->
         <div class="row">
            <!-- left column -->
            <div class="col-md-12">
               <!-- general form elements -->
               <div class="box box-primary">
                  <!-- <div class="box-header">
                     <h1 class="box-title">WRITE MESSAGE</h1>
                  </div> -->
                  
                  <!-- /.box-header -->

                  <form role="form" method="post">
                     <div class="box-body">
                        <div class="form-group">
                           <label for="exampleInputEmail1">To.</label> <input type="text"
                              name="receiverNickname" class="form-control"
                              placeholder="Enter Receiver" style="margin-left:30px;" value="${toNickname}">
                        </div>
                        <div class="form-group">
                           <label for="exampleInputEmail1">From.</label> <input
                              type="text" name="senderNickname" class="form-control" readonly="readonly"
                              placeholder="Enter Sender" value="${userNickname}">
                        </div>
                        <div class="form-group">
                           <label for="exampleInputEmail1">Title</label> <input
                              type="text" name='title' class="form-control"
                              placeholder="Enter Title" style="margin-left:14px;">
                        </div>
                        <div class="form-group">
                           <div><label for="exampleInputPassword1">Content</label></div>
                           <textarea class="form-control4" name="content" rows="3"
                              ></textarea>
                        </div>
                     </div>
                     <!-- /.box-body -->

                     <div class="box-footer">
                        <button id="send" type="submit" class="btn btn-primary">확인</button>
                        <!-- <button id="send" type="submit" class="btn btn-primary">취소</button> -->
                     </div>
                  </form>


               </div>
               <!-- /.box -->
            </div>
            <!--/.col (left) -->

         </div>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->

   </div>

   <script>
		$(function(){
			$(".tab-switch").show();
		});
   
   	var result = '${msg}';

      if (result == 'SUCCESS') {
         alert("처리가 완료되었습니다.");
      }
      if(result=='close'){
    	  window.close();
    	  //화면 재생
      }
      if(result == 'fail'){
      	alert("존재하지 않는 닉네임입니다.");
      }
   </script>

</body>
</html>