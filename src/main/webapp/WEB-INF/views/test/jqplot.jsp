<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/matna/resource/jqplot/jquery.jqplot.min.css">

<script src="/matna/resource/jquery/jquery-2.2.3.js"/></script>
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script src="/matna/resource/jqplot/jquery.jqplot.min.js"/></script>
<script type="text/javascript" src="/matna/resource/jqplot/plugins/jqplot.pieRenderer.min.js"></script>


<script>

$(document).ready(function(){
	
	var man=${mcount};
	var woman=${wcount};
	
	$.jqplot ('graph', [[['남자', man], ['여자', woman]]], 
	        { 
	          seriesDefaults: {
	            //원형으로 렌더링
	            renderer: $.jqplot.PieRenderer,
	            //원형상단에 값보여주기(알아서 %형으로 변환)
	            rendererOptions: {
	              showDataLabels: true
	            }
	          },
	          //우측 색상별 타이틀 출력
	          legend: { show:true, location: 'n' }
	        }
	);

});

</script>

</head>
<body>
	<div id="graph" style="width:300px; height:300px;"></div>
	

</body>
<%@include file="/WEB-INF/views/main/body/review/replyPage.jsp" %>
	<%@include file="/WEB-INF/views/footer.jsp" %>

</html>
