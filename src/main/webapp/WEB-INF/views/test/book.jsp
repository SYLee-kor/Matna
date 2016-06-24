<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- =======================css시작======================= -->
<style type="text/css">

select[name="per"],select[name="difficulty"]{
  padding: .3em .5em; /* �뿬諛깆쑝濡� �넂�씠 �꽕�젙 */
  font-family: inherit;  /* �룿�듃 �긽�냽 */
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* �꽕�씠�떚釉� �솕�궡�몴 ��泥� */  
  border: 1px solid #999; 
  border-radius: 4px; /* iOS �뫁洹쇰え�꽌由� �젣嫄� */
  -webkit-appearance: none; /* �꽕�씠�떚釉� �쇅�삎 媛먯텛湲� */
  -moz-appearance: none;
  appearance: none;
  width: 150px;
}

.recipetext{
  border-radius: 5px;
  -moz-border-radius: 5px;
  height: 18px;
  width:280px;
}

#submit:hover, #ingr:hover { /*마우스 올라가면 색변경 */
   background-color:#777;
}

#submit,#cancel, #ingr{/* 등록 취소버튼 이름변경 */
   display: inline;
   width: 50px;
  font-size: 14px;
   background-color:#6cb4ce;
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
.page > div {
  width: 50%;
  height: 100%;
  position: absolute;
  transform: translateX(500px) translateY(2%);
  transform-style: preserve-3d;
}
.page > div > div {
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
.page > div > div.back {
  transform:  rotateY(180deg) translateZ(1px);
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
.controls .book{
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

/* .page .front {
  background:-webkit-gradient(linear, right top, left top, color-stop(0.95, #fff), color-stop(1, #cacaca));
    background-image:-webkit-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-moz-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-ms-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-o-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:linear-gradient(right, #fff 95%, #cacaca 100%);
} */

.page .back {
  background:-webkit-gradient(linear, left top, right top, color-stop(0.95, #fff), color-stop(1, #dadada));
    background-image:-webkit-linear-gradient(left, #fff 95%, #dadada 100%);
    background-image:-moz-linear-gradient(left, #fff 95%, #dadada 100%);
    background-image:-ms-linear-gradient(left, #fff 95%, #dadada 100%);
    background-image:-o-linear-gradient(left, #fff 95%, #dadada 100%);
    background-image:linear-gradient(left, #fff 95%, #dadada 100%);
}

</style>
<!-- =======================css끝======================= -->

<!-- =======================JS시작======================= -->
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var Pages = function() {
		  var pages = document.getElementsByClassName("page"),
		      currentPage = 0,

		      next = function() {
		        var page = pages[currentPage];
		        console.log(pages, page);
		        if (page) {
		          page.className += " listed";
		        }
		        if (currentPage < pages.length - 1) {
		          currentPage++;
		        }
		      },
		      prev = function() {
		        var page = pages[currentPage];
		        if (page) {
		          page.className = page.className.replace(/ listed/g, "");
		        }
		        if (currentPage > 0) {
		          currentPage--;
		        }
		      };
		  
		  return {
		    prev: prev,
		    next: next
		  };
		};

		var pages = Pages();
		document.getElementById("nextPage").addEventListener("click", function() {
		  pages.next();
		}, false);
		document.getElementById("prevPage").addEventListener("click", function() {
		  pages.prev();
		}, false);

});
</script>
<!-- =======================JS끝======================= -->

<body>

<!-- =======================HTML시작======================= -->

<div class="book" style="background:url('/matna/resource/images/도마2.png');  background-size : 100% 100%;"><!-- 북전체 시작 -->

  <div class="page" id="page1">
      <div class="subpage">
      
        <div class="front"  style="background:url('/matna/resource/images/book_front.jpg');  background-size : 100% 100%;">
          <h2 class="header"> 쉑쉑버거 요리법</h2><br><br>
          <div class="content">
          	<center>
            <p> <img alt="완성사진" src="/matna/resource/images/쉑쉑.png" width="50%" height="50%"></p>
            <p> 쉑쉑버거</p>
            <p> 조리시간: 5분 양: 3인분 좋아요: 99</p>
          	</center>
          </div>
        </div>
        
        <div class="back"  style="background:url('/matna/resource/images/book_left.jpg');  background-size : 100% 100%;">
          <h4 class="header">완성 사진</h4>
          <div class="content">
          	<center>
          	 <p> <img alt="완성사진" src="/matna/resource/images/쉑쉑.png" width="400px" height="400px">
          	 <input type="file"> </p>
          	</center>
           </div>
          <div class="pageNumber">1</div>
        </div>
        
      </div>
  </div>
  
    <div class="page" id="page2">
      <div class="subpage">
      
        <div class="front"  style="background:url('/matna/resource/images/book_right.jpg');  background-size : 100% 100%;">
          <h4 class="header">프리뷰</h4>
          <div class="content">
          
          	<!-- 재료입력란 -->
      		<p class="inputfield"><label for="item">재료</label></p> 
            <p> 
            	<input type="text" class="recipetext" id="addr" name="item" required tabindex="4" style="margin-bottom: 10px;" placeholder="재료입력">
      			<input type="button" value="등록" onclick="registItem()" id="ingr"/>
      		</p>
      		
      		 <!-- 가격 입력란 -->
            <p class="inputfield"><label for="price">가격 </label></p>
  	  		<p><input type="text" class="recipetext" name="price" placeholder="가격을 입력해주세요."> 원</p>
  	  		
        	 <!-- 조리시간 입력란 -->
  	  		<p class="inputfield"><label for="time">조리 시간(분 단위) </label></p>
  	 		<p><input type="text" class="recipetext" name="time" placeholder="조리 시간을 분 단위로 입력해주세요."> 분</p>
        	
  	  		<!-- 난이도 선택란 -->
  	  		<p class="inputfield"><label for="difficulty">난이도 </label></p>
  	  		<p><select name="difficulty">
  	  			<option value="상">복잡</option>
  	  			<option value="중">보통</option>
  	  			<option value="하" selected="selected">간단</option>
  	  		</select></p>
            
      		<!-- 인분 선택란 -->  
      		<p class="inputfield"><label for="per">인분 </label></p> 
      		<p><select name="per">
              		<option value="1" selected="selected">1인분</option>
              		<option value="2">2인분</option>
              		<option value="3">3인분</option>
              		<option value="4">4인분</option>
      		</select></p>
            
  	 		<!-- 요리이름 입력란 -->
  	  		<p class="inputfield"><label for="foodName">요리이름 </label></p>
  	  		<p><input type="text" class="recipetext" name="foodName" placeholder="요리 이름을 입력해주세요."></p>
            
  	  		<!-- 요리 상세내용 입력란 -->
  	  		<p class="inputfield"><label for="foodDetail">요리설명 </label></p>
  	  		<p><input type="text" class="recipetext" name="foodDetail" placeholder="요리 설명을 입력해주세요."></p>
  	  
          </div>
          <div class="pageNumber">2</div>
        </div>
        
        <div class="back" style="background:url('/matna/resource/images/book_left.jpg');  background-size : 100% 100%;">
          <h4 class="header">완 성 사 진</h4>
          <div class="content">
          	<center>
          	 <p> 
          	 	<img alt="완성사진" src="/matna/resource/images/쉑쉑.png" width="400px" height="400px">
          		<input type="file"> 
          	 </p>
          	</center>
           </div>
          <div class="pageNumber">3</div>
        </div>
        
      </div>
  </div>

		<div class="page" id="page3">
			<div class="subpage">

				<div class="front" style="background:url('/matna/resource/images/book_right.jpg');  background-size : 100% 100%;">
					<h4 class="header">만드는 법</h4>
					<div class="content">
					
						<!--제목입력란 -->       
       					<p class="inputfield"><label for="recipe_title">제목</label></p> 
       					<input type="text" class="recipetext" id="recipe_title" name="title" placeholder="제목을 입력해주세요~" 
              			required tabindex="4" style="margin-bottom: 10px;"/> <br/>
  
       					<!--SmartEditor입력란 -->
       					<textarea cols="100" rows="35" name="content"
						id="recipe_content" style="width: 400px; height: 350px;"></textarea>
	  
       					 <!-- 버튼 -->
       					<input name="submit" type="submit" id="submit" tabindex="5" value="등록" />
      					 <input type="button" id="cancel" value="  취소  ">
										
					</div>
					<div class="pageNumber">4</div>
				</div>

				<div class="back" style="background:url('/matna/resource/images/book_back.jpg');  background-size : 100% 100%;">
					<h4 class="header"></h4>
					<div class="content">
					<p>뒷표지</p>
					</div>
				</div>

			</div>
		</div>

	</div><!-- 북전체 끝 -->
<center>
<br><br>
<div class="controls">
  <input type="image" id="prevPage" src="/matna/resource/images/previous.png">
  <input type="image" id="nextPage" src="/matna/resource/images/next.png">
</div>
</center>

<!-- =======================HTML끝======================= -->

</body>
</html>