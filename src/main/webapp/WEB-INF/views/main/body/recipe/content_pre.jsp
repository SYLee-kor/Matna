<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/matna/resource/css/recipe/content.css" rel="stylesheet">
<script src="/matna/resource/js/jquery2.js"></script>
<script>
	window.onload = function() {
		document.querySelector('.cont_modal').className = "cont_modal";
		showTab_recipe('pre');
		
		// # 수정버튼 눌렀을때..
		$('#btnUp').click(function() {
			window.opener.location.href = 
				'/matna/recipe/modify?page=${page}&pageType=${pageType}';
			window.close();
		})
		
		// # 삭제버튼 눌렀을때.. 
		$('#btnDel').submit(function() {
			$('#delForm').submit();
			window.opener.location.href = '/matna/recipe/list?page=${page}&pageType=${pageType}';
			window.close();
		})
	}

	var c = 0;
	function open_close() {
		if (c % 2 == 0) {
			$('.cont_photo').hide('fast');
			$('.cont_central').attr("style","top:31%; height=90%");
			document.querySelector('.cont_modal').className = "cont_modal cont_modal_active";
			c++;
		} else {
			document.querySelector('.cont_modal').className = "cont_modal";
			c++;
			$('.cont_central').attr("style","");
			$('.cont_photo').show('fast');
		}
	}

	function showTab_recipe(id) {
		var otherId = (id == 'con') ? 'pre' : 'con';
		$('#' + otherId + "Tab").hide('fast');
		$('#' + otherId + "Li").attr('class', 'deactive');

		$('#' + id + "Tab").show('fast');
		$('#' + id + "Li").attr('class', 'active');
	}
</script>
<div class="cont_principal">
	<div class="cont_central">
		<div class="cont_modal">
			<div class="cont_photo">
				<div class="cont_img_back" onclick="open_close()"
					style="cursor: pointer;">${recipe.photo }</div>
				<div class="cont_mins">
					<div class="sub_mins">
						<h4>${recipe.time }</h4>
						<span>분</span>
					</div>
				</div>
				<div class="cont_servings">
					<h4>${recipe.per }</h4>
					<span>명</span>
				</div>
				<div class="cont_detalles">
					<h3>${recipe.foodName }</h3>
					<p>${recipe.foodDetail }</p>
				</div>
			</div>
			<div class="cont_text_ingredients">
				<div class="cont_over_hidden">

					<div class="cont_tabs">
						<ul>
							<li><a href="javaScript:showTab_recipe('pre')" id="preLi"><h4>준비하기</h4></a></li>
							<li><a href="javaScript:showTab_recipe('con')" id="conLi"><h4>요리하기</h4></a></li>
						</ul>
					</div>
					<!-- 준비하기 내용 -->
					<div class="cont_text_det_preparation" id="preTab"
						style="display: none">
						<c:forEach begin="0" end="3" varStatus="stat">
							<div class="cont_title_preparation">
								<p>${romeNum[stat.index]} ) ${titles[stat.index] }:${values[stat.index] }</p>
							</div>
						</c:forEach>
					</div>
					<!-- 요리하기 내용 -->
					<div class="cont_text_det_preparation" id="conTab"
						style="display: none">
						<div class="cont_title_preparation">
							<font size="2">작성자 : <b>${recipe.nickName }</b></font> <font
								size="2">등록일자 : <b>${recipe.regdate }</b></font>
							<p>${recipe.title }</p>
							&nbsp;&nbsp;&nbsp;
						</div>
						<div class="cont_info_preparation">
							<p>${recipe.content }</p>
						</div>
					</div>
				</div>
				<div class="cont_btn_open_dets">
					<a href="javascript:open_close()"><i class="material-icons">보기</i></a>
				</div>
			</div>
		</div>
	</div>
</div>
<form method="post" action="/matna/recipe/remove" id="delForm">
	<input type="hidden" name="page" value="${page }"> 
	<input type="hidden" name="pageType" value="${pageType }"> 
	<input type="hidden" name="no" value="${recipe.no }">
	<div class="cont_btn_mas_dets">
		<input type="submit" class="btn" value="삭제" id="btnDel">
	</div>
		<input type="button" class="btn" value="수정" id="btnUp">
</form>