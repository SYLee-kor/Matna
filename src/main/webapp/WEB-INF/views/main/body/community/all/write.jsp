<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script src="/matna/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "free_content",
			sSkinURI : "/matna/resource/SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fOnAppLoad : function() {
				oEditors.getById["free_content"].exec("PASTE_HTML",
						[ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요" ]);
			},
			fCreator : "createSEditor2"
		});
		$("#submmit").click(function() {
			oEditors.getById["free_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
		
		// # 유효성 검사
		if('${errMsgs.isValid}'=='invalid'){
			var values = ['${board.title}','${board.content}'];
			var errMsgs = ['$errMsgs.e_title}','${errMsgs.e_content}'];
			var objs = [$('[name=title]'),$('[name=content]')];
		
			for (var int = objs.length-1; int >= 0; int--) {
				objs[int].val(values[int]);				
				if( errMsgs[int] != '' ){
					objs[int].val('');
					objs[int].focus();
				}
			}
		}
	});

</script>
</head>
<body>
	<br>
	<br>
	<br>
	<form id="frm" action="/matna/community/write" method="post">
		<input type="hidden" name="type" id="type" value="free"/>
		<input type="hidden" name="writer" id="writer" value="${userNo}"/>
		<table align="center" border="1" style="width:100%; height: 100%;">
			<tr>
				<th>제목</th>
				<td>
					<input type="text"  name="title" style="width: 100%">
					<font color="red" size="2">${errMsgs.e_title }</font>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td rowspan="2">
					<textarea name="content" id="free_content" style="width: 930px; height: 500px;"></textarea>
					<font color="red" size="2">${errMsgs.e_content }</font>
				</td>
			</tr>

		</table>
		<div style="width: 80%; margin: 20px;" align="right">
			<button id="submmit">등록</button>
			<button id="exit" onclick="javascript:location.href='/matna/community/list';">취소</button>
		</div>
	</form>
</body>
</html>