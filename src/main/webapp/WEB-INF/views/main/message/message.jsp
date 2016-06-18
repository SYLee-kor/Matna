<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
/* MAGIC ... IMPORTANT! */
#tabs::after {
   display: block;
   content: "";
   clear: both;
}

.tab-switch {
   position: fixed;
}

.tab-switch:target+.tab-link+.tab-content {
   display: block;
}

.tab-link {
   display: inline-block;
}

.tab-content {
   box-sizing: border-box;
   float: right;
   display: none;
   width: 100%;
}

/* FANCY STYLES */
body {
   font-family: sans-serif;
   padding: 10px 20px;
}

h1 {
   text-align: center;
}

footer {
   margin-top: 20px;
   text-align: center;
}

#tabs {
   text-align: center;
   background-color: #ff7359; /* tomato button color */
   border: 1px solid #1caa5d;
   font-size: 0;
}

.tab-link {
   margin-left: 20px;
   margin-top: 10px;
   padding: 20px;
   text-decoration: none;
   font-size: 18px;
   color: white;
}

.tab-link:hover {
   background-color: white;
   color: black;
}

.tab-link ~ .tab-link {
   margin-left: 0;
}

.tab-switch:target+.tab-link {
   background-color: white;
   color: black;
}

.tab-content {
   background-color: white;
   padding: 35px;
   font-size: 13px;
}

.tab-content p {
   line-height: 1.65;
}

.tab-content ul, .tab-content ol {
   padding: 0 0 0 15px;
   margin: 0;
   line-height: 1.25;
}

.tab-content ul>li, .tab-content ol>li {
   margin: 5px 0;
}

/* 첫번째 tab table css */
.box-body {
    border-radius:4px;
    background: #fff; 
    background: -moz-linear-gradient(#fff, #f9fdff);
    background: -o-linear-gradient(#fff, #f9fdff);
    background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff), to(#f9fdff));
    background: -webkit-linear-gradient(#fff, #f9fdff);
    padding:5px;
    border-color:rgba(4, 129, 177, 0.4);
}
.table{
    border: 3px solid #ff7359;
    text-transform:uppercase;
    color: ;
    cursor: pointer;
    font-size: 20px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
}
.name{
     padding:10px;
}
.button{
    background: #00b8e6;
    border: none;
    text-transform:uppercase;
    color: #eee;
    cursor: pointer;
    font-size: 20px;
    margin: 5px 0;
    padding: 5px 22px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    margin-right: 30px;
}
#delete{
    background: #ff7359;
    border: none;
    text-transform:uppercase;
    color: #eee;
    cursor: pointer;
    font-size: 20px;
    margin: 5px 0;
    padding: 5px 22px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    margin-left:450px;
}
    .name { 
        color: #373737;
        background: #fff;
        border: 1px solid #CCCCCC;
        color: #aaa;
        font-size: 23px;
        line-height: 1.2em;
        margin-bottom:15px;

        -moz-border-radius:4px;
        -webkit-border-radius:4px;
        border-radius:4px;
         padding:10px;
    }
    .val{
       color: #373737;
        background: #fff;
        border: 1px solid #CCCCCC;
        color: #aaa;
        font-size: 20px;
        line-height: 1.2em;
        margin-bottom:15px;

        -moz-border-radius:4px;
        -webkit-border-radius:4px;
        border-radius:4px;
        padding:10px;
    }
    h1{
       color: #aaa;
    }
    
/* 두번째 tab table css */
#delete2{
       background: #ff7359;
        border: none;
        text-transform:uppercase;
        color: #eee;
        cursor: pointer;
        font-size: 20px;
        margin: 5px 0;
        padding: 5px 22px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        -webkit-border-radius:4px;
        -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
        float:right;
    }
/* 세번째 tab table css */
.form-group{
    text-transform:uppercase;
    color: ;
    cursor: pointer;
    font-size: 20px;
}
input{
   border: 3px solid #ff7359;
    text-transform:uppercase;
    color: ;
    cursor: pointer;
    font-size: 20px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    margin-left:;
}
.form-control{
   border: 3px solid #ff7359;
    text-transform:uppercase;
    cursor: pointer;
    font-size: 20px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
}
.form-control4{
   border: 3px solid #ff7359;
    text-transform:uppercase;
    color: ;
    cursor: pointer;
    font-size: 20px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    width: 70%;
    height: 300px;
}
#send{
   background: #ff7359;
    border: none;
    text-transform:uppercase;
    color: #eee;
    cursor: pointer;
    font-size: 20px;
    margin-right:20px;
    padding: 5px 22px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
}
#send2{
   background: #ff7359;
    border: none;
    text-transform:uppercase;
    color: #eee;
    cursor: pointer;
    font-size: 20px;
    float:right;
    padding: 5px 22px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -webkit-border-radius:4px;
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
}
.box-footer{
   float:right;
 }
 .b{
 	display:none;
 }
}
</style>
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
	   	      }
	   	    });
   }
   
	function receiveShowPage(page,messageSelect,search) {
		document.location.href='/matna/message/listAll?searchs=1&&message=receive&&'
				+'messageSelect='+messageSelect+'&&searches='+search+'&&page='+page;
	}
	function sendShowPage(page,messageSelect,search) {
		document.location.href='/matna/message/listAll?searchs=1&&message=send&&'
				+'messageSelect='+messageSelect+'&&searches='+search+'&&page='+page;
	}
</script>

<c:if test="${page > 1 }">
	<c:set value="${page-1 }" var="beforePage" />
</c:if>
<c:if test="${page == 1 }">
	<c:set value="${oldPage }" var="beforePage" />
</c:if>
<c:if test="${page < receiverTotalPage }">
	<c:set value="${page+1 }" var="nextPage" />
</c:if>
<c:if test="${page == receiverTotalPage }">
	<c:set value="${page }" var="nextPage" />
</c:if>
<!-- 위는 receive,  밑은 sender -->
<c:if test="${page > 1 }">
	<c:set value="${page-1 }" var="beforePage" />
</c:if>
<c:if test="${page == 1 }">
	<c:set value="${oldPage }" var="beforePage" />
</c:if>
<c:if test="${page < senderTotalPage }">
	<c:set value="${page+1 }" var="nextPage" />
</c:if>
<c:if test="${page == senderTotalPage }">
	<c:set value="${page }" var="nextPage" />
</c:if>
   
	

<body>
   <div id="tabs">
      <span id="tab-1" class="tab-switch"></span> 
      	<a href="#tab-1" class="tab-link"><h4>받은 쪽지함</h4></a>
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

                        <table class="table table-bordered" style="text-align:center; margin:auto; border:1px soild #ff7359; width:100%; height:100px;">
                           <tr align="center" style="border:1px solid #ff7359;">
                              <th></th>
                              <th width="80px">보내는이</th>
                              <th width="350px">제목</th>
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
                                 <td colspan="4">${messageVO.content}</td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                              </tr>

                           </c:forEach>

                        </table>
                        <input type="submit" name="delete2" value="삭제" id="delete2"
                           class="btn btn-delete2" />
       <br>
         <div>
			<c:forEach var="i" begin="1" end="${receiverTotalPage }">
            [<a href="javascript: receiveShowPage(${i },'${messageSelect }','${search }')">${i}</a>]
         	</c:forEach>
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
         class="tab-link"><h4>보낸 쪽지함</h4></a>
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
                              <th>받는이</th>
                              <th width="350px">제목</th>
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
                                 <td colspan="4">${messageVO.content}</td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                              </tr>

                           </c:forEach>

                        </table>
                        <input type="submit" name="delete" value="삭제" id="delete2"
                           class="btn btn-delete" />
                      <br>
		<div>
			<c:forEach var="i" begin="1" end="${senderTotalPage }">
            [<a href="javascript: sendShowPage(${i },'${messageSelect }','${search }')">${i}</a>]
         	</c:forEach>
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
         class="tab-link"><h4>쪽지 보내기</h4></a>
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
                              placeholder="Enter Receiver" style="margin-left:30px;">
                        </div>
                        <div class="form-group">
                           <label for="exampleInputEmail1">From.</label> <input
                              type="text" name="senderNickname" class="form-control"
                              placeholder="Enter Sender">
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