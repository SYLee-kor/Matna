<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
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
				<div class="box-header">
					<h3 class="box-title">READ Message</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post">
					<input type="hidden" name="message" id="message" value="${message}" />
					<input type='hidden' name='check' id="check" value="${messageVO.no}">
				

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Sender</label> <input type="text"
							name="writer" class="form-control" value="${messageVO.senderNickname}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Receiver</label> <input type="text"
							name="writer" class="form-control" value="${messageVO.receiverNickname}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${messageVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${messageVO.content}</textarea>
					</div>
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
			    <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
			    <button type="button" onclick="historyBack()" class="btn btn-primary" id="goListBtn">GO LIST </button>
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