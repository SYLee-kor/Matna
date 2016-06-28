<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- =======================css시작======================= -->
<style type="text/css">
select[name="per"], select[name="difficulty"] {
	padding: .3em .5em; /* �뿬諛깆쑝濡� �넂�씠 �꽕�젙 */
	font-family: inherit; /* �룿�듃 �긽�냽 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* �꽕�씠�떚釉� �솕�궡�몴 ��泥� */
	border: 1px solid #999;
	border-radius: 4px; /* iOS �뫁洹쇰え�꽌由� �젣嫄� */
	-webkit-appearance: none; /* �꽕�씠�떚釉� �쇅�삎 媛먯텛湲� */
	-moz-appearance: none;
	appearance: none;
	width: 150px;
}

.recipetext {
	border-radius: 5px;
	-moz-border-radius: 5px;
	height: 18px;
	width: 280px;
}

#submit:hover, #ingr:hover { /*마우스 올라가면 색변경 */
	background-color: #777;
}

#submit, #cancel, #modify, #delete, #ingr { /* 등록 취소버튼 이름변경 */
	display: inline;
	width: 50px;
	font-size: 14px;
	background-color: #6cb4ce;
	color: #fff;
	padding: 5px 0px;
	margin: 10px 0px 0px 0px;
	border-radius: 7px;
	-moz-border-radius: 5px;
}

.inputfield { /* 재료 같은 이름명 파랑 */
	font-family: 'Lato', sans serif;
	font-weight: 300;
	color: #5DACCA;
	font-size: 13px;
}

.book {
	width: 1000px;
	height: 640px;
	border: 2px solid #dddddd;
	-webkit-perspective: 1400px;
	-moz-perspective: 1400px;
	perspective: 1400px;
	/*
  -webkit-transform: perspective(1400);
     -moz-transform: perspective(1400);
          transform: perspective(1400);*/
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
	font-family: Arial;
	margin: 0px auto;
}

.page {
	width: 100%;
	height: 100%;
	position: absolute;
	transition: transform 1s;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.page>div {
	width: 50%;
	height: 100%;
	position: absolute;
	transform: translateX(500px) translateY(2%);
	transform-style: preserve-3d;
}

.page>div>div {
	width: 98%;
	height: 96%;
	background-color: #ffffff;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	position: absolute;
	padding: 10px 20px;
	box-sizing: border-box;
	border: 1px solid #dddddd;
	-webkit-transform-style: flat;
	-moz-transform-style: flat;
	transform-style: flat;
}

.page>div>div.back {
	transform: rotateY(180deg) translateZ(1px);
}

.page.listed {
	transform: rotateY(-180deg);
}

#page1 {
	z-index: 4;
}

#page2 {
	z-index: 3;
}

#page3 {
	z-index: 2;
}

#page4 {
	z-index: 1;
}

#page1.page.listed {
	z-index: 1;
}

#page2.page.listed {
	z-index: 2;
}

#page3.page.listed {
	z-index: 3;
}

#page4.page.listed {
	z-index: 4;
}

.controls {
	margin-bottom: 80px;
}

.controls .book {
	float: left
}

.page .header {
	margin: 6px 0px;
	padding: 0px;
	text-align: center;
}

.page .content {
	text-indent: 20px;
}

.page .pageNumber {
	position: absolute;
	bottom: 20px;
	font-size: 12px;
}

.page .front .pageNumber {
	right: 20px;
}

.page .back .pageNumber {
	left: 20px;
}

.page .back {
	background: -webkit-gradient(linear, left top, right top, color-stop(0.95, #fff),
		color-stop(1, #dadada));
	background-image: -webkit-linear-gradient(left, #fff 95%, #dadada 100%);
	background-image: -moz-linear-gradient(left, #fff 95%, #dadada 100%);
	background-image: -ms-linear-gradient(left, #fff 95%, #dadada 100%);
	background-image: -o-linear-gradient(left, #fff 95%, #dadada 100%);
	background-image: linear-gradient(left, #fff 95%, #dadada 100%);
}
</style>
<!-- =======================css끝======================= -->

<!-- =======================JS시작======================= -->
<script type="text/javascript"
	src="/matna/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var Pages = function() {
		var pages = document.getElementsByClassName("page"), currentPage = 0,
		next = function() {
			var page = pages[currentPage];
			console.log(pages, page);
			if (page) {
				page.className += " listed";
			}
			if (currentPage < pages.length - 1) {
				currentPage++;
			}
		}, prev = function() {
			var page = pages[currentPage];
			if (page) {
				page.className = page.className.replace(/ listed/g, "");
			}
			if (currentPage > 0) {
				currentPage--;
			}
		};

		return {
			prev : prev,
			next : next
		};
	};

		var pages = Pages();
		document.getElementById("nextPage").addEventListener("click", function() {
			pages.next();
		}, false);
		document.getElementById("prevPage").addEventListener("click", function() {
			pages.prev();
		}, false);

		// # 스마트 에디터
		var oEditors = [];
		$(function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "recipe_content",	
				sSkinURI : "/matna/resource/SE2/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : true,
					bUseModeChanger : true,
					fOnBeforeUnload : function() {
				}
			},fOnAppLoad : function() {
				if ('${action}' == 'regist')
					oEditors.getById["recipe_content"].exec("PASTE_HTML",
							[ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요<br>" ]);
			},fCreator : "createSEditor2"});

			$("#submit").click(function() {
				event.preventDefault();
				oEditors.getById["recipe_content"].exec("UPDATE_CONTENTS_FIELD",[]);
				
				getItems();
				var fData = new FormData($('#recipeForm')[0])
				$.ajax({
					url : '/matna/recipe/${action}',
					type : 'post',
					data : fData,
					dataType:"json",
					async : false,
					cache : false,
					contentType : false,
					processData : false,
					success : function(result) {
						var errMsgs = result.errMsgs;
						var recipe = result.recipe;
						
						if (errMsgs == null) { // # 유효성 검사 통과시...
							alert('성공!!');
							window.opener.location.href = "/matna/recipe/list";
							window.close();
						}else{ // # 유효성 검사에 걸렸을 때...
							alert('실패!! - 입력하신 데이터를 확인해 주세요.');
							var errs = [errMsgs.e_ingredient, errMsgs.e_foodName, errMsgs.e_price,
							            errMsgs.e_time, errMsgs.e_per, errMsgs.e_difficulty,
							            errMsgs.e_title,errMsgs.e_content];
							var errNames = ['ingredient','foodName','price',
							                'time','per','difficulty',
							                'title','content'];
							var recipes=[recipe.ingredient, recipe.foodName, recipe.price
							             ,recipe.time, recipe.per, recipe.difficulty,
							             recipe.title, recipe.content];
							for (var int = 0; int < objs.length; int++) {
								objs[int].val( recipes[int] );
								if(errs[int]!=null && errs[int]!='undefined'){ // # 에러메시지가 있다면...
								alert('errs[int] : '+ errs[int]);
									objs[int].val('');
									objs[int].focus();
									$('#e_'+errNames[int]).html(errs[int]);
								}
							}
						
						}
					},
					error : function(xhr,errorT,error) {
						alert('errorT : '+ errorT);
						alert('xhr : '+ xhr.status);
						alert('error : '+ error);
					}
			})
	});

			$("#cancel").click(function() {
				window.close();
			})
	});

		var objs = [ $('[name=ingredient]'),$('[name=foodName]'), $('[name=price]'),
					 $('[name=time]'), $('[name=per]'),$('[name=difficulty]'), 
					 $('[name=title]'),$('[name=content]') ];
	
	if ('${action}' == 'modify') {
		var values = [ '${recipe.ingredient}','${recipe.foodName}', '${recipe.price}',
					   '${recipe.time}', '${recipe.per}','${recipe.difficulty}', 
					   '${recipe.title}','${recipe.content}' ]
		for (var int = 0; int < objs.length; int++) {
			objs[int].val(values[int]);
		}
		
		var ingredients = '${recipe.ingredient}'.split(',');
		for (var i = 0; i < ingredients.length; i++) {
			var option = '<option value="'+ingredients[i]+'">'+ingredients[i]+'</option>';
			$('#itemList').append(option);
		}
	}
	
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#file").change(function(){
	    //alert(this.value); //선택한 이미지 경로 표시
	    readURL(this);
	});
});// # document.ready
	
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        var file = input.files[0].name;
        var img_format = "\.(bmp|gif|jpg|jpeg|png)$";
        if(!(new RegExp(img_format, "i")).test(file)){
        	alert("이미지 파일만 올려주세요");
            $('#file').val('');
            return;
        }
        reader.onload = function (e) {
        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            $('.photo').attr('src', e.target.result);
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
            //(아래 코드에서 읽어들인 dataURL형식)
        }                   
        reader.readAsDataURL(input.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    }
}//readURL()--
	
	//# read 일때 수정화면 호출버튼 및 삭제기능
	function upDel(type) {
		if('${userNo}'==''){
			alert('먼저 로그인 해주세요.');
			return false;
		}
	 	if(type=='modify')	
			document.location.href = "/matna/recipe/"+type+"?no=${recipe.no}";
		else if(type=='remove'){
			$.ajax({
				url:'/matna/recipe/remove',
				data:{
					no:'${recipe.no}'
				},
				success:function(result){
					if(result=='success'){
						alert('삭제 되었습니다.');
						window.opener.location.href="/matna/recipe/list";
						window.close();
					}
				},
				error:function(xhr,error,msg){
					alert('에러발생 : '+error);
				}
			})
		}
	}

	var items = '';
	function getItems() {
		$('#itemList option').each(function(idx) {
			items += $(this).val();
			if (idx < itemCnt-1) items += ",";
		})
		$('[name=ingredient]').val(items);
	}
	var itemCnt = 0;
	function registItem() {
		var newItem = $('[name=item]').val();
		$('[name=item]').val('');
		$('#itemList').prepend("<option value="+newItem+">" + newItem + "</option>");
		itemCnt++;
	}
	
	function clearList() {
		$('#itemList').empty();
	}
</script>
<!-- =======================JS끝======================= -->

<body>

	<!-- =======================HTML시작======================= -->

	<form method="post" enctype="multipart/form-data" name="recipeForm" id="recipeForm">
		<c:if test="${action != 'regist' }">
			<input type="hidden" name="no" value="${recipe.no }"> 
			<input type="hidden" name="photo" value="${recipe.photo }">
		</c:if>
		<div class="book"
			style="background: url('/matna/resource/images/도마2.png'); background-size: 100% 100%;">
			<!-- 북전체 시작 -->
<!-- ============================= page 1 ======================================== -->
			<div class="page" id="page1">
				<div class="subpage">

					<div class="front"
						style="background: url('/matna/resource/images/book_front.jpg'); background-size: 100% 100%;">
						<h2 class="header">${recipe.foodName } 요리법</h2>
						<br> <br>
						<div class="content">
							<center>
								<p>
									<c:if test="${action == 'regist' }">
										<img alt="완성사진" src="/matna/resource/images/쉑쉑.png" class="photo"
											width="400px" height="400px">
									</c:if>
									<c:if test="${action != 'regist' }">	
	            						${recipe.photo }
	           						 </c:if>
								</p>
								<c:if test="${action == 'read' }">
									<p>${recipe.foodName }</p>
									<p>
									<font color="orange">조리시간</font>: <b>${recipe.time }</b> 
									<font color="orange">양</font>: <b>${recipe.per } 인분</b> 
									<font color="orange">좋아요</font>: <b>${recipe.likes }</b>
									</p>
								</c:if>
							</center>
						</div>
					</div>
					<div class="back"
						style="background: url('/matna/resource/images/book_left.jpg'); background-size: 100% 100%;">
						<h4 class="header">완성 사진</h4>
						<div class="content">
							<center>
								<p>
									<c:if test="${action == 'regist' }">
										<img alt="완성사진" class="photo" src="/matna/resource/images/쉑쉑.png"
											width="400px" height="400px">
									</c:if>
									<c:if test="${action != 'regist' }">
						          		${recipe.photo }
						          	</c:if>
									<c:if test="${action != 'read' }">
										<input type="file" name="file" id="file" accept="image/*">
						          	</c:if>
								</p>
								<c:if test="${action == 'read' }">
								<!-- 버튼 -->
								<input type="button" id="modify" value="  수정  "
									onclick="upDel('modify')">
								<input type="button" id="delete" value="  삭제  "
									onclick="upDel('remove')">
								<input type="button" id="cancel" value="  닫기  ">
								</c:if>
							</center>
						</div>
						<div class="pageNumber">1</div>
					</div>
				</div>
			</div>
<!-- ============================= page 2 ======================================== -->
			<div class="page" id="page2">
				<div class="subpage">

					<div class="front"
						style="background: url('/matna/resource/images/book_right.jpg'); background-size: 100% 100%;">
						<h4 class="header">프리뷰</h4>
						<div class="content">
							
							<!-- 재료입력란 -->
							<p class="inputfield">
								<label for="item">재료</label> 
							</p>
							<p>
							<c:if test="${action!='read' }">
								재료 목록 : <font color="red" size="2" id="e_ingredient"></font>
								<select id="itemList"></select> <input type="button" value="목록 비우기" onclick="clearList()"> 
								<br>
								<input type="hidden" name="ingredient" /> 
								<input type="text" class="recipetext" id="addr" 
									name="item" required tabindex="4"
									style="margin-bottom: 10px;" placeholder="재료입력"> <br>
								<font color="red" size="2" id="e_ingredient"></font>
								<input type="button" value="등록" onclick="registItem()" id="ingr" />
							</c:if>
							<c:if test="${action=='read' }">
							${recipe.ingredient }
							</c:if>
							</p>

							<!-- 가격 입력란 -->
							<p class="inputfield">
								<label for="price">가격 </label> <font color="red" size="2" id="e_ingredient"></font>
							</p>
							<p>
								<c:if test="${action != 'read' }">
								<input type="text" class="recipetext" name="price"
									placeholder="가격을 입력해주세요."> 원 <br>
								<font color="red" size="2" id="e_price"></font>
  	  							</c:if>
								<c:if test="${action == 'read' }">${recipe.price } 원</c:if>
							</p>

							<!-- 조리시간 입력란 -->
							<p class="inputfield">
								<label for="time">조리 시간(분 단위) </label>
							</p>
							<p>
								<c:if test="${action != 'read' }">
									<input type="text" class="recipetext" name="time"
										placeholder="조리 시간을 분 단위로 입력해주세요."> 분 
										 <br><font color="red" size="2" id="e_time"></font>
  	 							</c:if>
								<c:if test="${action == 'read' }">${recipe.time } 분</c:if>
							</p>


							<!-- 난이도 선택란 -->
							<p class="inputfield">
								<label for="difficulty">난이도 </label>
							</p>
							<p>
								<c:if test="${action != 'read' }">
									<select name="difficulty">
										<option value="상">복잡</option>
										<option value="중">보통</option>
										<option value="하" selected="selected">간단</option>
									</select>
								</c:if>
								<c:if test="${action == 'read' }">${recipe.difficulty }</c:if>
							</p>

							<!-- 인분 선택란 -->
							<p class="inputfield">
								<label for="per">인분 </label>
							</p>
							<p>
								<c:if test="${action != 'read' }">
									<select name="per">
										<option value="1" selected="selected">1인분</option>
										<option value="2">2인분</option>
										<option value="3">3인분</option>
										<option value="4">4인분</option>
									</select>
								 <br><font color="red" size="2" id="e_per"></font>
								</c:if>
								<c:if test="${action == 'read' }">${recipe.per } 인분</c:if>
							</p>

							<!-- 요리이름 입력란 -->
							<p class="inputfield">
								<label for="foodName">요리이름 </label>
							</p>
							<p>
								<c:if test="${action != 'read' }">
									<input type="text" class="recipetext" name="foodName"
										placeholder="요리 이름을 입력해주세요.">
									<br><font color="red" size="2" id="e_foodName"></font>
								</c:if>
								<c:if test="${action == 'read' }">
					  	  			${recipe.foodName }
					  	  		</c:if>
							</p>
						</div>
						<div class="pageNumber">2</div>
					</div>
<!-- ============================= page 3 ======================================== -->
					<div class="back"
						style="background: url('/matna/resource/images/book_left.jpg'); background-size: 100% 100%;">
						<h4 class="header">완 성 사 진</h4>
						<div class="content">
							<center>
								<p>
									<c:if test="${action == 'regist' }">
										<img alt="완성사진" src="/matna/resource/images/쉑쉑.png" class='photo'
											width="400px" height="400px">
									</c:if>
									<c:if test="${action != 'regist' }"> ${recipe.photo }</c:if>
								</p>
							</center>
						</div>
						<div class="pageNumber">3</div>
					</div>

				</div>
			</div>

			<div class="page" id="page3">
				<div class="subpage">

					<div class="front"
						style="background: url('/matna/resource/images/book_right.jpg'); background-size: 100% 100%;">
						<h4 class="header">만드는 법</h4>
						<div class="content">
							<c:if test="${action != 'read' }">
								<!--제목입력란 -->
								<p class="inputfield">
									<label for="recipe_title">제목</label>
								</p>
								<input type="text" class="recipetext" id="recipe_title"
									name="title" placeholder="제목을 입력해주세요~" required tabindex="4"
									style="margin-bottom: 10px;" />
								<br><font color="red" size="2" id="e_title"></font>
								<br />
							</c:if>
							<c:if test="${action == 'read' }">${recipe.title }</c:if>
							<c:if test="${action != 'read' }">
								<!--SmartEditor입력란 -->
								<textarea cols="100" rows="35" name="content"
									id="recipe_content" style="width: 400px; height: 350px;"></textarea>
								<br><font color="red" size="2" id="e_content"></font>
							</c:if>
							<c:if test="${action == 'read' }">${recipe.content }</c:if>
							<br><br>
							<c:if test="${action != 'read' }">
								<!-- 버튼 -->
								<input name="submit" type="submit" id="submit" tabindex="5"
									value="등록" />
								<input type="button" id="cancel" value="  취소  ">
							</c:if>
						</div>
	<!-- ============================= page 4 ======================================== -->					
						<div class="pageNumber">4</div>
					</div>

					<div class="back"
						style="background: url('/matna/resource/images/book_back.jpg'); background-size: 100% 100%;">
						<h4 class="header"></h4>
						<div class="content">
							<p>뒷표지</p>
						</div>
					</div>

				</div>
			</div>

		</div>
		<!-- 북전체 끝 -->
	</form>
	<center>
		<br> <br>
		<div class="controls">
			<input type="image" id="prevPage"
				src="/matna/resource/images/previous.png"> <input
				type="image" id="nextPage" src="/matna/resource/images/next.png">
		</div>
	</center>

	<!-- =======================HTML끝======================= -->

</body>
</html>