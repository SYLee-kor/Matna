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
	<link rel="stylesheet" href="/matna/resource/css/login.css">
	<!--  절취 선 -->
	<script src="/matna/resource/js/custom.js"></script>
	<script src="/matna/resource/js/jquery.lightbox.js"></script>
	<script src="/matna/resource/js/templatemo_custom.js"></script>
    <script src="/matna/resource/js/jquery-git2.js"></script>

	<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
   
   <%--content부분 --%>
	<script type="text/javascript" src="/matna/resource/js/jquery2.js"></script>
	<script type="text/javascript" src="/matna/resource/js/reply.js"></script>
    
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
               <div id="layer" 
               style="position:absolute; background-color:#fff7f7; left:15px; top:100px; margin-top:5%; z-index:1;display:none; width:555px; height:250px; /* border:3px solid #ff4a2b; */">
				      <select>
				        <option value="volvo">Volvo</option>
				        <option value="saab">Saab</option>
				        	        <option value="mercedes">Mercedes</option>
				        <option value="audi">Audi</option>
				      </select>
				      <input type="radio" name="chk_info" value="HTML">HTML
				      <input type="radio" name="chk_info" value="CSS">CSS
				      <input type="radio" name="chk_info" value="웹디자인">웹디자인
				      <input type="radio" name="chk_info" value="HTML">HTML
				      <input type="radio" name="chk_info" value="CSS">CSS
				      <input type="radio" name="chk_info" value="웹디자인">웹디자인
				      AudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudiAudi
				            <dt><a href="/map/" target="_blank">맛지도</a></dt>
				            <dd><a href="/map/" target="_blank">맛지도홈</a></dd>
				            <dd><a href="/Map/RestMap/Map_search.asp" target="_blank">맛지도검색</a></dd>
				         <dl class="cate05">
				            <dt>이벤트</dt>
				            <dd><a href="/event/" target="_blank">메뉴판닷컴이벤트</a></dd>
				            <dd><a href="/event/2010/201005_opencast/" target="_blank"><img src="/image/main2011/ico_opencast.gif" align="top" />오픈캐스트</a></dd>
				         </dl>
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