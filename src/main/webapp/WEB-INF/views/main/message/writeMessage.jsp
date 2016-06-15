<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		$('#send').click(function() {
			formObj.attr("action", "/message/sendSuccess");
			//formObj.attr("action2","null");
			formObj.submit();
		});
	});
</script>

<script>
    
    var result = '${msg}';
    
    if(result == 'fail'){
    	alert("존재하지 않는 닉네임입니다.");
    }
    
</script>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">WRITE MESSAGE</h3>
				</div>
				<!-- /.box-header -->

<form role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">From.</label> 
			<input type="text"
				name="senderNickname" class="form-control" placeholder="Enter Sender">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> 
			<input type="text"
				name='title' class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">To.</label> 
			<input type="text"
				name="receiverNickname" class="form-control" placeholder="Enter Receiver">
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
		<button id="send" type="submit" class="btn btn-primary">Submit</button>
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
</div>
<!-- /.content-wrapper -->

