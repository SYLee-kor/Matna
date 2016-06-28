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
     <!-- 상세 검색 -->
    <script src="/matna/resource/js/searchDetail.js"></script> 
    <!-- 광고 -->
   <script src="/matna/resource/js/ad.js"></script>    
   <script src="/matna/resource/js/tab.js"></script>    

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

/* 추가 부분 */
.selectH{
   width: 100%;
   text-align: center;
}
select[name="money"], #guSel, #dongSel{
   font-family: inherit;
   background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
   border: 1px solid #999; 
   background: white; 
   margin-bottom: 1em;
   font-size: 1em;
   height: 2.5em;
   border:2px solid #fe957e;
   width: 110px;
}

.holder{
   display: inline-block;
}
</style>

        <%--상세 검색 --%>
  <script type="text/javascript">
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
             
                 $(document).mousedown(function(e){
                     $('.layer').each(function(){
                             if( $(this).css('display') == 'block'){
                                 var l_position = $(this).offset();
                                 l_position.right = parseInt(l_position.left) + ($(this).width());
                                 l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());

                                 if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
                                     && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
                                 {
                                     //alert( 'popup in click' );
                                 }
                                 else
                                 {
                                     //alert( 'popup out click' );
                                     $(this).hide();
                                 }
                             }
                         });
                     }); 

                 printGu();             
             });
    
    function show_popup(){
        $('.layer').show();
    }

    
    </script>
    <title>우리지금 Matna!!</title>
</head>
<body>
<!-- title start -->
    <form action="/matna/main/review/list" method="post">         
     <div class="container">
       <div class="row">
           <div class="col-md-4 col-sm-4">
               <div class="templatemo_title"><a href="/matna/home">Matna</a></div>
                <div class="templatemo_subtitle">우리지금맛나</div>
            </div>
           
           <%--상세검색 --%>
           <div class="col-md-2 col-sm-2">
                <a href="javascript:show_popup();" >
                <label id="search_detail">search detail</label></a>
               
               <%-- 전체보기 레이어띄우는 창 --%>
     <div class="layer" style="position:absolute; background-color:white; left:15px; top:100px; z-index:1; display:none; width:400px; height:210px; border:3px solid #ff7359; border-radius:20px;">
      
      
      
      <div class="center-on-page" align="center" style="margin-top:2%;">
         <input type="radio" name="rb" id="rb1" class="detail_rb" value="" checked="checked" />
         <label for="rb1" class="detail_lb" >전체</label>
         <input type="radio" name="rb" id="rb2" class="detail_rb" value="food"/>
         <label for="rb2" class="detail_lb" >식사</label>
         <input type="radio" name="rb" id="rb3" class="detail_rb" value="desert"/>
         <label for="rb3" class="detail_lb">디저트</label>
         <input type="radio" name="rb" id="rb4" class="detail_rb" value="drink"/>
         <label for="rb4" class="detail_lb">주류</label>
      </div>
      
      
      <!-- 바꾼부분 -->
      <div class="selectH" style="position:relative;z-index:2;">
      <div class="holder" align="center" id="guSel">
      <!--   <span id="guSpan"></span> -->
   <!-- <select class="select">
        <option value="구" ></option>
        <option value="강서구"></option>
        <option value="양천구"></option>
        <option value="영등포구"></option>
      </select> -->
      </div>
      
      <div class="holder" align="center" id="dongSel">
<!--       <span id="dongSpan"></span> -->
<!--      <select class="select">
        <option value="동"></option>
        <option value="신월동"></option>
        <option value="화곡동"></option>
        <option value="여의도동"></option>
      </select> -->
      </div>
      
      <div class="holder" align="center">
      <p class="inputfield"><label for="menu"></label> 
       <select id="money" name="money">
         <option value="==가격==">==가격==</option>
         <option value="5천원 이하">5천원 이하</option>
         <option value="5천원~1만원">5천원~1만원</option>
         <option value="1만원~2만원">1만원~2만원</option>
         <option value="2만원~3만원">2만원~3만원</option>
         <option value="3만원~5만원">3만원~5만원</option>
         <option value="5만원~7만원">5만원~7만원</option>
         <option value="7만원 이상">7만원 이상</option>
        </select>
      </p>
      </div>
      </div>
      <!-- 바꾼부분 -->
      
      <div class="center-on-page" align="center" >
         <input type="radio" name="parking" id="parkinglot1" class="detail_rb" checked="checked" value=""/>
         <label for="parkinglot1" class="detail_lb">전체</label>&nbsp;
         <input type="radio" name="parking" id="parkinglot2" class="detail_rb" value="1"/>
         <label for="parkinglot2" class="detail_lb">주차장있음</label>&nbsp;
         <input type="radio" name="parking" id="parkinglot3" class="detail_rb" value="0"/>
         <label for="parkinglot3" class="detail_lb">주차장없음</label>
      </div>
      
      <div class="center-on-page" align="center">
         <input type="radio" name="date" id="date1" class="detail_rb" checked="checked" value=""/>
         <label for="date1" class="detail_lb">전체</label>&nbsp;
         <input type="radio" name="date" id="date2" class="detail_rb" value="7"/>
         <label for="date2" class="detail_lb">최근 일주일</label>&nbsp;
         <input type="radio" name="date" id="date3" class="detail_rb" value="30"/>
         <label for="date3" class="detail_lb">최근 30일</label>
      </div>
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
    </form>
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
                           <li><a class="show-1 templatemo_home" href="/matna/community/list?type=notice">공지사항</a></li>
                           <li><a class="show-2 templatemo_page2" 
                          		href="/matna/review/list">리뷰</a></li>
                           <li><a class="show-3 templatemo_page3" 
                           		href="/matna/review/list?pageType=ranking">랭킹</a></li>
                           <li><a class="show-5 templatemo_page5" 
                           		href="/matna/recipe/list">레시피</a></li>
                           <li><a class="show-5 templatemo_page5" href="#">게시판</a></li>
                           <li><a class="show-5 templatemo_page5" href="#">상품</a></li>
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
                              <li><a href="/matna/community/list?type=notice">공지사항</a></li>
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
                                    <li><a href="/matna/review/list?tabType=food&pageType=review">식사</a></li>
                                    <li><a href="/matna/review/list?tabType=desert&pageType=review">디저트</a></li>
                                    <li><a href="/matna/review/list?tabType=drink&pageType=review">주류</a></li>
                                 </ul>
                                 <li><a href="/matna/review/list?pageType=ranking">랭킹</a></li>
                                 <li><a href="/matna/recipe/list">레시피</a></li>
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
                              <li><a href="/matna/community/list?type=free">자유 게시판</a>
                              <li><a href="/matna/community/list?type=meeting">만남 게시판</a>
                              <li><a href="/matna/community/list?type=noname">익명 게시판</a>
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
                              <li><a href="/matna/item/itemSearch">POINT SHOP ♥</a></li>
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
                              <li><a href="/matna/community/list?type=faq">FAQ</a></li>
                              <li><a href="/matna/community/list?type=suggest">건의사항</a></li>
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
                     <div class="slider-caption" id="AD">
                     <!-- <img src="/matna/resource/images/AD_chicken.jpg" alt="Slide 1"> -->
                     </div>
            </div>
         </div>
            </div>
         
         <!--================== 로그인폼  =============================================-->
            <div class="col-md-5 col-sm-5" id="loginForm">
            <!-- 절취 선 -->
  <%@include file="/WEB-INF/views/main/header/login/login.jsp" %>
  </div>
 <!-- 절취 선 -->
            </div>
          </div>
           </div>
          </div>
         </div>