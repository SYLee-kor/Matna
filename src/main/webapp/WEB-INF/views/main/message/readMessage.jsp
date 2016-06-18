<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
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
</style>	
	

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/message/delete");
		formObj.submit();
	});
	
	$("#goListBtn2 ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/message/listAll?searches='${searches}'");
		formObj.submit();
	});
	
});
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<!-- /.box-header -->

				<form role="form" method="post">
					<input type="hidden" name="message" id="message" value="${message}" />
					<input type='hidden' name='check' id="check" value="${messageVO.no}">
				

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">보낸사람</label> <input type="text"
							name="writer" class="form-control" value="${messageVO.senderNickname}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">받은사람</label> <input type="text"
							name="writer" class="form-control" value="${messageVO.receiverNickname}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input type="text"
							name='title' class="form-control" value="${messageVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">내용</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${messageVO.content}</textarea>
					</div>
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
			    <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
			    <button type="button" onclick="window.close()" class="btn btn-primary" id="goListBtn">목록 </button>
<!-- 			    <button type="button" onclick="historyBack()" class="btn btn-primary" id="goListBtn">목록 </button> -->
			  </div>
			</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
	
</section>
<!-- /.content -->
<script type="text/javascript">
	function historyBack() {
		history.back();
	}
</script>