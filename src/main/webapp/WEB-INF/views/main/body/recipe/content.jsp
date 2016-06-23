<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/matna/resource/css/recipe/content.css">
<!-- header추가  -->
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script>
$(document).ready(function() {
	  
	  var pages = $(".page").length,
	      scrolling = false,
	      curPage = 1;
	  
	  function pagination(page, movingUp) {
	    scrolling = true;
	    var diff = curPage - page,
	        oldPage = curPage;
	    curPage = page;
	    $(".page").removeClass("active small previous");
	    $(".page-" + page).addClass("active");
	    $(".nav-btn").removeClass("active");
	    $(".nav-page" + page).addClass("active");
	    if (page > 1) {
	      $(".page-" + (page - 1)).addClass("previous");
	      if (movingUp) {
	        $(".page-" + (page - 1)).hide();
	        var hackPage = page;
	        setTimeout(function() {
	          $(".page-" + (hackPage - 1)).show();
	        }, 600);
	      }
	      while (--page) {
	        $(".page-" + page).addClass("small");
	      }
	    }
	    console.log(diff)
	    if (diff > 1) {
	      for (var j = page + 1; j < oldPage; j++) {
	        $(".page-" + j + " .half").css("transition", "transform .7s ease-out");
	      }
	    }
	    setTimeout(function() {
	      scrolling = false;
	      $(".page .half").attr("style", "");
	      $(".page")
	    }, 700);
	  }
	  
	  function navigateUp() {
	    if (curPage > 1) {
	      curPage--;
	      pagination(curPage, true);
	    }
	  }

	  function navigateDown() {
	    if (curPage < pages) {
	      curPage++;
	      pagination(curPage);
	    }
	  }
	  
	  $(document).on("mousewheel DOMMouseScroll", function(e) {
	    if (!scrolling) {
	      if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
	        navigateUp();
	      } else { 
	        navigateDown();
	      }
	    }
	  });
	  
	  $(document).on("click", ".scroll-btn", function() {
	    if (scrolling) return;
	    if ($(this).hasClass("up")) {
	      navigateUp();
	    } else {
	      navigateDown();
	    }
	  });
	  
	  $(document).on("keydown", function(e) {
	    if (scrolling) return;
	    if (e.which === 38) {
	      navigateUp();
	    } else if (e.which === 40) {
	      navigateDown();
	    }
	  });
	  
	  $(document).on("click", ".nav-btn:not(.active)", function() {
	    if (scrolling) return;
	    pagination(+$(this).attr("data-target"));
	  });

	  // # 1페이지에 레시피 미리보기 - 사진 출력
	  $('.page:nth-child(1) .left').attr('style','background-image:url("/matna/resource/images/머리넘기는 수지.gif")');
	  $('.page:nth-child(1) .right').attr('style','background-image:url("/matna/resource/images/머리넘기는 수지.gif")');
	}); // # document . ready

</script>
<title>Insert title here</title>
</head>
<body>
<div class="scene">
  <div class="page page-1 active">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Step 1</h2>
      <p>요리 준비하기</p>
      <table>
      	<tr>
      		<td>요리명 :</td>
      		<td>${recipe.foodName }</td>
      	</tr>
      </table>
    </div>
  </div>
  <div class="page page-2">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Step 2</h2>
    </div>
  </div>
  <div class="page page-3">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Step 3</h2>
    </div>
  </div>
  <div class="page page-4">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Step 4</h2>
    </div>
  </div>
  <div class="page page-5">
    <div class="half left"></div>
    <div class="half right withText">
      <h2 class="heading">Step 5</h2>
    </div>
  </div>
</div>
<div class="nav-panel">
  <div class="scroll-btn up"></div>
  <div class="scroll-btn down"></div>
  <nav>
    <ul>
      <li data-target="1" class="nav-btn nav-page1 active"></li>
      <li data-target="2" class="nav-btn nav-page2"></li>
      <li data-target="3" class="nav-btn nav-page3"></li>
      <li data-target="4" class="nav-btn nav-page4"></li>
      <li data-target="5" class="nav-btn nav-page5"></li>
    </ul>
  </nav>
</div>
</body>
</html>