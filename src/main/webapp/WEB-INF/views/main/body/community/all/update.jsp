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
	});

</script>
</head>
<body>
	<br>
	<br>
	<br>
	<form id="frm" action="/matna/community/modify" method="post">
		<input type="hidden" name="type" id="type" value="free"/>
		<input type="hidden" name="no" id="no" value="${free.no }"/>
		<table align="center" border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 650px" name="title" value="${free.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td rowspan="2"><textarea name="content" id="free_content"style="width: 650px; height: 350px;">
				${free.content }</textarea></td>
			</tr>

		</table>
		<div style="width: 80%; margin: 20px;" align="right">
			<button id="submmit">수정</button>
			<button id="exit" onclick="javascript:location.href='/matna/community/list';">취소</button>
		</div>
	</form>
</body>
</html>