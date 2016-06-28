<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kosta.matna.domain.community.BoardVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	function loadFree(){
		$.ajax({
			url:"/matna/community/miniListF",
			data:{
				type1: 'free',			
			},
			type:"POST",
			success:function(result){
				$('#miniFree').html(result);
			}
		})
	}
	function loadMeeting(){
		$.ajax({
			url:"/matna/community/miniListM",
			data:{
				type2: 'meeting',			
			},
			type:"POST",
			success:function(result){
				$('#miniMeeting').html(result);
			}
		})
	}
	loadFree();
	loadMeeting();
});
</script>
</head>
<body>

  	<!--============== free게시판 ================-->
   <div class="col-md-offset-1 col-md-5 col-sm-5" id="miniFree">
       </div>
            
            <!--============== Meeting게시판 ================-->
        	<div class="col-md-5 col-sm-5" id="miniMeeting">
              
           </div>
</body>
</html>