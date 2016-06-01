<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript" src="/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    var obj = [];           
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "editor",
        sSkinURI: "/resource/SE2/SmartEditor2Skin.html", 
        htParams : {
            bUseToolbar : true,             
            bUseVerticalResizer : false,     
            bUseModeChanger : true, 
        }
    });
    $("#savebutton").click(function(){
        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
    })
})
</script>
</head>
<body>
<form action="/submit" method="post" id="frm">
    <textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
    <input type="button" id="savebutton" value="서버전송" />
</form>
</body>
</html>