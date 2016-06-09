<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성 페이지</title>
<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("[name=parking]").val('${preview.parking}');
		if('${preview.parking}'==1){
			$('#pON_up').attr("style",'color:blue; font-weight:bold');
			$('#pOFF_up').attr("style",'color:gray');
		}else{
			$('#pON_up').attr("style",'color:gray');
			$('#pOFF_up').attr("style",'color:blue; font-weight:bold');
		}
		$("[name=score]").val('${preview.score}');
		$("[name=kind]").val('${preview.kind}');
		$("[name=price]").val('${preview.price}');
		$("[name=addr]").val('${preview.addr}');
		$("#upPark${preview.parking}").attr('checked',true);
	})


function pringGu() {
	$.ajax({
		url:"/matna/review/guList",
		dataType:"json",
		success:function(result){ // # result는 Array[String] 형태..
			var gu = '<select id="guList" onchange="printDong()">';
			for (var int = 0; int < result.length; int++) {
				gu+='<option value="'+result[int]+'">'+result[int]+'</option>';
			}
			gu += '</select>';
			$('#guSpan').html(gu);
			printDong();
		},
		error:function(xhr,status,error){
			alert('error : '+error);
		}
	})
}

function printDong() {
	$.ajax({
		url:"/matna/review/dongList",
		data:"gu="+$('#guList').val(),
		dataType:"json",
		success:function(result){ // # result는 Array[String] 형태..
			var dong = '<select id="dongList">';
			for (var int = 0; int < result.length; int++) {
				dong+='<option value="'+result[int]+'">'+result[int]+"</option>";
			}
			dong += '</select>';
			$('#dongSpan').html(dong);
		},
		error:function(xhr,status,error){
			alert('error : '+error);
		}
	})
}	
	
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "review_content",
          sSkinURI: "/Matna/SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				oEditors.getById["review_content"].exec("PASTE_HTML",
						[ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요" ]);
			},
			fCreator : "createSEditor2"
		});
		$("#submmit").click(function() {
			oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#action").val("updateSubmit");
			$("#review_writeForm").submit();
		});
	});
//# 주차 공간 라디오 박스 눈에 잘 띄도록 색입히기
function color_parking(type) {
	if(type==1){
		$('#pON_up').attr("style",'color:blue; font-weight:bold;');
		$('#pOFF_up').attr("style",'color:gray');
	}else if(type==0){
		$('#pON_up').attr("style",'color:gray');
		$('#pOFF_up').attr("style",'color:blue; font-weight:bold;');
	}
}

</script>
<style type="text/css">
.reviewF {
	font-style: oblique;
}
</style>
</head>
<body>
<center>
	<h3>리뷰 작성</h3>
	<hr>
	<form name="review_writeForm" class="reviewF" id="frm" action="/matna/review/modify" method="post">
		<input type="hidden" name="action" id="action"/>
		<input type="hidden" name="writer" value="${review.writer }">
		<input type="hidden" name="idx" id="idx" value="${review.no }"/>
		<table cellpadding="5" bordercolor="#00bbdd" style="width:100%; padding-left:10%">
			<tr>
				<td>지역</td>
				<td><span id="guSpan"></span><span id="dongSpan"></span></td>
			</tr>
			<tr>
				<td>주차장 여부</td>
				<td><span id="pON_up">있음</span>
				<input type="radio" name="parking" value="1" id="upPark1" onclick="color_parking(1)">
					<span id="pOFF_up">없음</span>
					<input type="radio" name="parking" value="0" id="upPark0" onclick="color_parking(0)"> 
				</td>
			</tr>
			<tr><td>메뉴</td>
				<td>
					<select name="kind" style="color:green; ">
						<option value="식사">식사</option>
						<option value="디저트">디저트</option>
						<option value="주류">주류</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>평점</td>
				<td id="score">
					<select name='score' style="color: orange;">
						<option value="1">★</option>
						<option value="2">★★</option>
						<option value="3">★★★</option>
						<option value="4">★★★★</option>
						<option value="5">★★★★★</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>1인비용</td>
				<td><select name="price">
						<option value="0,5">5천원 이하</option>
						<option value="5,10">5천원~1만원</option>
						<option value="10,20">1만원~2만원</option>
						<option value="20,30">2만원~3만원</option>
						<option value="30,50">3만원~5만원</option>
						<option value="50,70">5만원~7만원</option>
						<option value="70,100">7만원 이상</option>
				</select></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="${preview.phone }"></td>
			</tr>
			<tr>
				<td>추천메뉴</td>
				<td><textarea id="recommend" rows="2" cols="50" name="recommend">
				${preview.recommend }</textarea></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="review_title" id="review_title" size="80" value="${review.title }"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="100" rows="35" name="review_content"
						id="review_content" style="width: 700px; height: 350px;">${review.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><center>
						<button id="submmit" name="submmit">  등록  </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="  취소  " onclick="javascript:history.back()">
					</center></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>