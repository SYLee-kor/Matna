<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="description" content="">
	<meta name="keywords" content="" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="initial-scale=1">
	
	
	
	
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <!-- finalOrder때 추가 --> <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="/matna/resource/css/animate.css">
	<link rel="stylesheet" href="/matna/resource/css/bootstrap.min.css">
	<link rel="stylesheet" href="/matna/resource/css/font-awesome.min.css">
	<link rel="stylesheet" href="/matna/resource/css/templatemo_misc.css">
	<link rel="stylesheet" href="/matna/resource/css/templatemo_style.css">
    <link rel="stylesheet" href="/matna/resource/css/miniList.css"> 
    <link rel="stylesheet" href="/matna/resource/css/write.css"> 
    <link rel="stylesheet" href="/matna/resource/css/content.css"> 
    <link rel="stylesheet" href="/matna/resource/css/finalOrder.css"> 
    <link rel="stylesheet" href="/matna/resource/css/reviewList.css"> 
    <link rel="stylesheet" href="/matna/resource/css/itemDetail.css"> 
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  
	<script src="/matna/resource/js/jquery-1.10.2.min.js"></script>
	<script src="/matna/resource/js/jquery.singlePageNav.js"></script>
	<script src="/matna/resource/js/jquery.flexslider.js"></script>
	<!-- 절취 선 -->
	<script type="text/javascript" src="/matna/resource/js/login_script.js"></script>
<<<<<<< HEAD
	<link rel="stylesheet" href="/matna/resource/css/login.css">
=======
    <link rel="stylesheet" href="/matna/resource/css/login.css">
>>>>>>> branch 'master' of https://github.com/SYLee-kor/Matna.git
	<!--  절취 선 -->
	<script src="/matna/resource/js/custom.js"></script>
	<script src="/matna/resource/js/jquery.lightbox.js"></script>
	<script src="/matna/resource/js/templatemo_custom.js"></script>
    <script src="/matna/resource/js/jquery-git2.js"></script>

	<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
   
   <%--content부분 --%>
	<script type="text/javascript" src="/matna/resource/js/jquery2.js"></script>
	<script type="text/javascript" src="/matna/resource/js/reply.js"></script>
    
    
    <style type="text/css">
  
/* radio 버튼 css 시작 */
.detail_rb {
  position: absolute;
  opacity: 0;
  z-index: -1;

}

 .detail_lb{
  position: relative;
  display: inline-block;
  margin-right: 10px;
  margin-bottom: 10px;
  padding-left: 30px;
  padding-right: 10px;
  line-height: 36px;
  cursor: pointer;
}

 .detail_lb::before {
  content: " ";
  position: absolute;
  top: 6px;
  left: 0;
  display: block;
  width: 24px;
  height: 24px;
  border: 2px solid #fe957e; 
  border-radius: 4px;
  z-index: -1;
}

.detail_rb +  .detail_lb::before {
  border-radius: 18px;
}

.detail_rb:checked +  .detail_lb::before{ /* 색깔 씌워지는 코드 */
  top: 0;
  width: 100%;
  height: 100%;
  background: #fe957e; 
  color: white;
}
.detail_rb:checked +  .detail_lb{ /* 색깔 씌워지는 코드 */
  
  color: white;
}

/* Transition */
 .detail_lb,  .detail_lb::before {
  -webkit-transition: .25s all ease;
  transition: .25s all ease;
}

/* select option의 시작 */
@import url(http://fonts.googleapis.com/css?family=Gudea);


.selectholder {
  width:120px;
  background: white; 
  margin-bottom: 1em;
  font-size: 0.9em;
  height: 2.4em;
  -o-transition: .1s ease-out;
  -ms-transition: .1s ease-out;
  -moz-transition: .1s ease-out;
  -webkit-transition: .1s ease-out;
  transition: .1s ease-out;
  cursor: pointer;
  border:1px solid black;
  display: inline-block;
  vertical-align: middle;
  border-color: #dadada;
}

.selectholder .desc {
  display: inline-block;
  vertical-align: middle;
  padding-left: .8em;
  line-height: 2.4em;
}

.selectholder .pulldown {
  float: right;
  vertical-align: middle;
  width: 2em;
  height: 100%;
  background-color: #fe957e; 
  background-image: url("http://supereightstudio.com/img/pulldown.png");
  background-size: cover;
  -o-transition: .1s ease-out;
  -ms-transition: .1s ease-out;
  -moz-transition: .1s ease-out;
  -webkit-transition: .1s ease-out;
  transition: .1s ease-out;
}

.selectholder:hover,
.activeselectholder {
  background-color: #fe795c;
}

.selectholder:hover .pulldown,
.activeselectholder .pulldown {
  background-color: #fe795c;
  background-image: url("http://supereightstudio.com/img/pulldown_hover.png");
}

.selectholder .selectdropdown {
  position: relative;
  top: 0;
  left: 0;
  background: black;
  color: white;
  font-size:10px;
  display: none;
  clear: both;
}

.selectholder .selectdropdown span {
  display: block;
  border-bottom: solid 1px #555;
  padding-left: .8em;
  line-height: 2.4em;
  width: 100%;
  -o-transition: background-color .1s ease-out;
  -ms-transition: background-color .1s ease-out;
  -moz-transition: background-color .1s ease-out;
  -webkit-transition: background-color .1s ease-out;
  transition: background-color .1s ease-out;
}

.selectholder .selectdropdown span:last-child {
  border-bottom: none;
}

.selectholder .selectdropdown span.active {
  background-color: #fe795c;
  background-image: url("http://supereightstudio.com/img/radio_tick.png");
  background-repeat: no-repeat;
  background-size: 1.6em 1.6em;
  background-position: 98% 50%;
}

.selectholder .selectdropdown span:hover {
  background-color: #fe795c; 
}

.selectH{
   width: 100%;
   text-align: center;
}

 /* select option 의 끝 */
 #searchBt {
   background: #fe957e; /* tomato button color */
   border: none;
   text-transform: uppercase;
   color: #eee;
   cursor: pointer;
   font-size: 20px;
   margin: 5px 0;
   padding: 5px 22px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-border-radius: 4px;
   -webkit-box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
   margin-right: 30px;
}
</style>
   
    
    

        <%--상세 검색 --%>
    <script type="text/javascript">
    var cc=0
    function showHide(id) {//select detail button menu 생성
        if (cc==0) {
            cc=1
            document.getElementById(id).style.display="block";
        } else {
            cc=0
            document.getElementById(id).style.display="none";
        }
    }
    
    $(document).ready(
            function() {//class="dropdown-menu"
               $('div.main_menu div.col-md-2').hover(
                     function() {
                        $(this).children('.dropdown-menu').stop(true, true)
                              .delay(50).fadeIn(100);
                     },
                     function() {
                        $(this).children('.dropdown-menu').stop(true, true)
                              .delay(50).fadeOut(100);
                     });
                $('div.main_menu div.col-md-2 ul.dropdown-menu').hover(
                     function() {
                        $(this).children('.dropdown-menu').stop(true, true)
                              .delay(50).fadeIn(100);
                     },
                     function() {
                        $(this).children('.dropdown-menu').stop(true, true)
                              .delay(50).fadeOut(100);
                     }); 
                
                
                
                //select버튼
                $(':selected').each(function(){
                    var pp =$(this).parent().parent();
                    pp.text($(this).val())
                 })
                 // set up select boxes
                 $('.selectholder').each(function(){
                    $(this).children().hide();
                    var description = $(this).children('label').text();
                    $(this).append('<span class="desc">'+description+'</span>');
                    $(this).append('<span class="pulldown"></span>');
                    // set up dropdown element
                    $(this).append('<div class="selectdropdown"></div>');
                   $(this).children('select').children('option').each(function(){
                       if($(this).attr('value') != '0') {
                          $drop = $(this).parent().siblings('.selectdropdown');
                          var name = $(this).attr('value');
                          $drop.append('<span>'+name+'</span>');
                       }
                    });
                    // on click, show dropdown
                    $(this).click(function(){
                       if($(this).hasClass('activeselectholder')) {
                          // roll up roll up
                          $(this).children('.selectdropdown').slideUp(200);
                          $(this).removeClass('activeselectholder');
                          // change span back to selected option text
                          if($(this).children('select').val() != '0') {
                             $(this).children('.desc').fadeOut(100, function(){
                                $(this).text($(this).siblings("select").val());
                                $(this).fadeIn(100);
                             });
                          }
                       }
                       else {
                          // if there are any other open dropdowns, close 'em
                          $('.activeselectholder').each(function(){
                             $(this).children('.selectdropdown').slideUp(200);
                             // change span back to selected option text
                             if($(this).children('select').val() != '0') {
                                $(this).children('.desc').fadeOut(100, function(){
                                   $(this).text($(this).siblings("select").val());
                                   $(this).fadeIn(100);
                                });
                             }
                             $(this).removeClass('activeselectholder');
                          });         
                          // roll down
                          $(this).children('.selectdropdown').slideDown(200);
                          $(this).addClass('activeselectholder');
                          // change span to show select box title while open
                          if($(this).children('select').val() != '0') {
                             $(this).children('.desc').fadeOut(100, function(){
                                $(this).text($(this).siblings("select").children("option[value=0]").text());
                                $(this).fadeIn(100);
                             });
                          }
                       }
                    });
                 });
                 // select dropdown click action
                 $('.selectholder .selectdropdown span').click(function(){
                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');
                    var value = $(this).text();
                    $(this).parent().siblings('select').val(value);
                    $(this).parent().siblings('.desc').fadeOut(100, function(){
                       $(this).text(value);
                       $(this).fadeIn(100);
                    });
                 });
                 
                 // preload hover images
                preload([
                  'http://supereightstudio.com/img/radio_tick.png',
                  'http://supereightstudio.com/img/pulldown.png',
                  'http://supereightstudio.com/img/pulldown_hover.png'
                ]);

            });
    </script>
    
    <title>우리지금 Matna!!</title>
</head>
<body>

<!-- title start -->
  	<div class="container">
    	<div class="row">
        	<div class="col-md-4 col-sm-4">
            	<div class="templatemo_title"><a href="/matna/home">Matna</a></div>
                <div class="templatemo_subtitle">우리지금맛나</div>
            </div>
        	
        	<%--상세검색 --%>
        	<div class="col-md-2 col-sm-2">
                <a href="#layer" onclick="showHide('layer');return false;">
                <button id="search_detail">search detail</button></a>
               
               <%-- 전체보기 레이어띄우는 창 --%>
               
      <div id="layer" style="position:absolute; background-color:white; left:15px; top:100px; z-index:1;display:none; width:400px; height:250px; border:3px solid #ff7359;">
      
      
      
      <div class="center-on-page" align="center" style="margin-top:2%;">
         <input type="radio" name="rb" id="rb1" class="detail_rb" checked="checked" />
         <label for="rb1" class="detail_lb">전체</label>
         <input type="radio" name="rb" id="rb2" class="detail_rb"/>
         <label for="rb2" class="detail_lb">식사</label>
         <input type="radio" name="rb" id="rb3" class="detail_rb" />
         <label for="rb3" class="detail_lb">디저트</label>
         <input type="radio" name="rb" id="rb4" class="detail_rb" />
         <label for="rb4" class="detail_lb">주류</label>
      </div>
      
      <div class="selectH" style="position: relative;z-index:2;">
      <div class="selectholder" align="center">
      <select class="select">
        <option value="구" ></option>
        <option value="강서구"></option>
        <option value="양천구"></option>
        <option value="영등포구"></option>
      </select>
      </div>
      
      <div class="selectholder" align="center" >
      <select class="select">
        <option value="동"></option>
        <option value="신월동"></option>
        <option value="화곡동"></option>
        <option value="여의도동"></option>
      </select>
      </div>
      
      <div class="selectholder" align="center" >
      <select class="select">
        <option value="가격대" ></option>
        <option value="5000~10000"></option>
        <option value="10000~20000"></option>
        <option value="20000~30000"></option>
      </select>
      </div>
      </div>
      
      <div class="center-on-page" align="center" >
         <input type="radio" name="parking" id="parkinglot1" class="detail_rb" checked="checked"/>
         <label for="parkinglot1" class="detail_lb">전체</label>&nbsp;
         <input type="radio" name="parking" id="parkinglot2" class="detail_rb" />
         <label for="parkinglot2" class="detail_lb">주차장있음</label>&nbsp;
         <input type="radio" name="parking" id="parkinglot3" class="detail_rb" />
         <label for="parkinglot3" class="detail_lb">주차장없음</label>
      </div>
      
      <div class="center-on-page" align="center">
         <input type="radio" name="date" id="date1" class="detail_rb" checked="checked"/>
         <label for="date1" class="detail_lb">전체</label>&nbsp;
         <input type="radio" name="date" id="date2" class="detail_rb" />
         <label for="date2" class="detail_lb">최근 일주일</label>&nbsp;
         <input type="radio" name="date" id="date3" class="detail_rb" />
         <label for="date3" class="detail_lb">한달</label>
      </div>

      <input name="search_detail bt" id="searchBt" type="submit" value="검색" style="margin-left:80%; padding-top:2px; padding-down:2px; padding-left:10px; padding-right:10px;"/>
      </div>
      </div>
		     <%-- 전체보기 레이어 } --%>
				        	
        	
        	
            <div class="col-md-4 col-sm-4">
            	<form id="search_form">
            		<div class="templatemo_search">
                    	<input name="search" type="text" placeholder="Search here .... " id="search">
                    </div>
                </form>
            </div>
            <div class="col-md-2 col-sm-2">
            	<div class="search_bt">
				  <button class="icon-search"><div class="fa fa-search"></div></button>
				</div>
            </div>
        </div>
    </div>
  <!-- title end -->
  
  	<div class="site-header">
		<div class="main-navigation">
			
			
		 <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <!-- This one in here is responsive menu for tablet and mobiles -->
                  <div class="responsive-navigation visible-sm visible-xs">
                     <a href="#" class="menu-toggle-btn"> <i
                        class="fa fa-bars fa-2x"></i>
                     </a>
                     <div class="navigation responsive_menu">
                        <ul>
                           <li><a class="show-1 templatemo_home" href="#">Main
                                 Page</a></li>
                           <li><a class="show-2 templatemo_page2" href="#">Service</a></li>
                           <li><a class="show-3 templatemo_page3" href="#">Portfolio</a></li>
                           <li><a class="show-5 templatemo_page5" href="#">Contact</a></li>
                        </ul>
                     </div>
                     <!-- /.responsive_menu -->
                  </div>
                  <!-- /responsive_navigation -->
               </div>
            </div>
         </div>

         <!-- 버튼의 시작2 (Header 버튼 5개 hover로 작동) -->
         <div class="container">
            <div class="row">
               <div class="col-md-12 navigation">
                  <div class="row main_menu">
                     <!-- <div class="col-md-2"><a id="prev">Prev</a></div> -->

                     <div class="dropdown">
                        <div class="col-md-2">
                           <button class="btn btn-primary dropdown-toggle" type="button"
                              data-toggle="dropdown">
                              <div class="fa fa-volume-up"></div>
                              <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu">
                              <li><a href="#">공지사항</a></li>
                           </ul> 
                        </div>
                     </div>

                     <div class="dropdown">
                        <div class="col-md-2">
                           <button class="btn btn-primary dropdown-toggle" type="button"
                              data-toggle="dropdown">
                              <div class="fa fa-cutlery"></div>
                              <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu">
                              <li class="dropdown dropdown-submenu">
                              <a class="dropdown-toggle" data-toggle="dropdown">메뉴</a>
                                 <ul id="submenu" class="dropdown-menu">
                                    <li><a href="#">식사</a></li>
                                    <li><a href="#">디저트</a></li>
                                    <li><a href="#">주류</a></li>
                                 </ul>
                                 <li><a href="#">랭킹</a></li>
                                 <li><a href="#">레시피</a></li>
                           </ul>
                       </div>
                    </div>

                     <div class="dropdown">
                        <div class="col-md-2">
                           <button class="btn btn-primary dropdown-toggle" type="button"
                              data-toggle="dropdown">
                              <div class="fa fa-comments-o"></div>
                              <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu">
                              <li><a href="#">자유 게시판</a>
                              <li><a href="#">만남 게시판</a>
                              <li><a href="#">익명 게시판</a>
                           
                           </ul>
                        </div>
                     </div>

                     <div class="dropdown">
                        <div class="col-md-2">
                           <button class="btn btn-primary dropdown-toggle" type="button"
                              data-toggle="dropdown">
                              <div class="fa fa-shopping-cart"></a></div>
                              <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu">
                              <li><a href="#">POINT SHOP ♥</a></li>
                           </ul>
                        </div>
                     
                     <div class="dropdown">
                        <div class="col-md-2">
                           <button class="btn btn-primary dropdown-toggle" type="button"
                              data-toggle="dropdown">
                              <div class="fa fa-users"></div>
                              <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu">
                              <li><a href="#">FAQ</a></li>
                              <li><a href="#">건의사항</a></li>
                           </ul>
                        </div>
                     </div>
                     <!-- 메뉴늘리려면 grid다시잡아야함 -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
	</div>
	
	
	  <div id="menu-container">

	<div class="divs">

    <!--========================= 광고페이지 ===================================-->
	<div class="content homepage" id="menu-1"> 
	<div class="container">
    	<div class="row">
        	<div class="col-md-7 col-sm-7">
            	<div class="main-slider">
				<div class="flexslider">
					<!-- <ul class="slides">
						<li> -->
							<div class="slider-caption">
							</div>
							<img src="/matna/resource/images/AD_chicken.jpg" alt="Slide 1">
						<!-- </li>

						<li>
							<div class="slider-caption"></div>
							<img src="/matna/resource/images/AD_bugerking.jpg" alt="Slide 2">
						</li>

                        <li>
							<div class="slider-caption"></div>
							<img src="/matna/resource/images/AD_pizza.jpg" alt="Slide 3">
						</li>
                        
                        <li>
							<div class="slider-caption"></div>
							<img src="/matna/resource/images/slide4.jpg" alt="Slide 4">
						</li>

					</ul> -->
				</div>
			</div>
            </div>
			
			<!--================== 로그인폼  =============================================-->
           <!--  <div class="col-md-5 col-sm-5" id="loginForm">
                <div id="box">
			        <form id="login_frm">
			           <input type="text" name=login_id placeholder="USERNAME" />
			           <input type="text" name=login-pass placeholder="PASSWORD" />
			        </form>
			         <a href="#" name="find_idpass">forgot ID / PASS ?</a>
			         <input name="login_bt" type="submit" value="LOGIN !"/>
				<div class="signup">
				<p>not a member ? <a href="#">sign up</a></p>
				</div>
			   <div class="panel"> -->
			   <!-- 절취 선 -->
  <%@include file="/WEB-INF/views/main/header/login/login.jsp" %>
 <!-- 절취 선 -->
			   </div>
		    </div>
           </div>
          </div>
         </div>