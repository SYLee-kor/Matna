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
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  
	<script src="/matna/resource/js/jquery-1.10.2.min.js"></script>
	<script src="/matna/resource/js/jquery.singlePageNav.js"></script>
	<script src="/matna/resource/js/jquery.flexslider.js"></script>
	<!-- 절취 선 -->
	<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
	<script type="text/javascript" src="/matna/resource/js/login_script.js"></script>
<link rel="stylesheet" href="/matna/resource/css/login.css">
	<!--  절취 선 -->
	<script src="/matna/resource/js/custom.js"></script>
	<script src="/matna/resource/js/jquery.lightbox.js"></script>
	<script src="/matna/resource/js/templatemo_custom.js"></script>
    <script src="/matna/resource/js/jquery-git2.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
   
   <%--content부분 --%>
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9f63f7a70411f9756f65fdec8b2face8&libraries=services"></script>
	<script type="text/javascript" src="/matna/resource/js/jquery2.js"></script>
	<script type="text/javascript" src="/matna/resource/js/daumMap.js"></script>
	<script type="text/javascript" src="/matna/resource/js/reply.js"></script>
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
        	<div class="col-md-2 col-sm-2">
            	<button id="search_detail">search detail</button>
            </div>
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
                   <a href="#" class="menu-toggle-btn">
                    <i class="fa fa-bars fa-2x"></i>
                  </a>
       			 <div class="navigation responsive_menu">
          			 <ul>
					<li><a class="show-1 templatemo_home" href="#">공지사항</a></li>
					<li><a href="/matna/resource/review/menu/all/list.jsp">리뷰</a></li>
					<li><a class="show-3 templatemo_page3" href="#">게시판</a></li>
					<li><a class="show-4 templatemo_page4" href="#">상품</a></li>
					<li><a class="show-5 templatemo_page5" href="#">고객지원</a></li>
				</ul>
    	    </div> <!-- /.responsive_menu -->
   		 </div> <!-- /responsive_navigation -->
                </div>
            </div>
            </div>
			<div class="container">
				<div class="row">
                     <div class="col-md-12 navigation">
						<div class="row main_menu">
                    		<!-- <div class="col-md-2"><a id="prev">Prev</a></div> -->
							<div class="col-md-2"><a class="show-1 templatemo_home" href="#"><div class="fa fa-volume-up"></div></a></div>
							<div class="col-md-2"><a class="show-2 templatemo_page2"href="/matna/home"><div class="fa fa-cutlery"></div></a></div>
							<div class="col-md-2"><a class="show-3 templatemo_page3" href="#"><div class="fa fa-comments-o"></div></a></div>
							<div class="col-md-2"><a class="show-4 templatemo_page4" href="#"><div class="fa fa-shopping-cart"></div></a></div>
							<div class="col-md-2"><a class="show-5 templatemo_page5" href="#"><div class="fa fa-users"></div></a></div>
                            <div class="col-md-2"><a id="next">Next</a></div>
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
					<ul class="slides">
						<li>
							<div class="slider-caption">
							</div>
							<img src="/matna/resource/images/AD_chicken.jpg" alt="Slide 1">
						</li>

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

					</ul>
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
            
</body>
</html>