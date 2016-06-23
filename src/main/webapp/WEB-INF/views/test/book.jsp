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

.page .front {
  background:-webkit-gradient(linear, right top, left top, color-stop(0.95, #fff), color-stop(1, #cacaca));
    background-image:-webkit-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-moz-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-ms-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:-o-linear-gradient(right, #fff 95%, #cacaca 100%);
    background-image:linear-gradient(right, #fff 95%, #cacaca 100%);
}

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

<div class="book" style="background-image: url(/matna/resource/images/과일.jpg)"><!-- 북전체 시작 -->

  <div class="page" id="page1">
      <div class="subpage">
      
        <div class="front" style="background-color: #ff6666;">
          <h2 class="header"> 쉑쉑버거 요리법</h2><br><br>
          <div class="content">
          	<center>
            <p> <img alt="완성사진" src="/matna/resource/images/쉑쉑.png" width="50%" height="50%"></p>
            <p> 쉑쉑버거</p>
            <p> 조리시간: 5분 양: 3인분 좋아요: 99</p>
          	</center>
          </div>
        </div>
        
        <div class="back">
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
      
        <div class="front">
          <h4 class="header">프리뷰</h4>
          <div class="content">
            <p> 재료: 상추, 토마토, 빵, 고기</p>
            <p> 가격: 5000원</p>
            <p> 조리시간: 5분</p>
            <p> 난이도 
            	<select>
            		<option>상</option>
            		<option>중</option>
            		<option>하</option>
            	</select>
            </p>
            <p> 양 
            	<select>
            		<option>1인분</option>
            		<option>2인분</option>
            		<option>3인분</option>
            	</select>
            </p>
            <p>요리 이름: 쉑쉑버거</p>
            <p>요리 설명: 수제햄버거</p>
            <p>내용: 집에서도 간단한 수제 햄버거를!!!</p>
          </div>
          <div class="pageNumber">2</div>
        </div>
        
        <div class="back">
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

				<div class="front">
					<h4 class="header">만드는 법</h4>
					<div class="content">
						<p>여기에다가 진도 스마트에디터 놓으면됨</p>
					</div>
					<div class="pageNumber">4</div>
				</div>

				<div class="back" style="background: #ff6666">
					<h4 class="header"></h4>
					<div class="content">
						<p>
							책뒷표지
						</p>
					</div>
				</div>

			</div>
		</div>

	</div><!-- 북전체 끝 -->
<center>
<br><br>
<div class="controls">
  <button id="prevPage">이전</button>
  <button id="nextPage">다음</button>
</div>
</center>

<!-- =======================HTML끝======================= -->

</body>
</html>