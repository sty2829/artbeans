<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
  <div class="container">          
       <input type="text" placeholder="전시회, 전시관 검색">
       
       <a href="" style="float:right"  class="get-started-btn ml-auto">로그인/회원가입</a>
      
       
  </div>
      
      
    <div class="container d-flex align-items-center">

      <div onclick="location.href='/'">
      <h1 class="logo"><img src="/resources/assets/img/logo.png" class="img-fluid" ></h1>
      </div>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">

        <ul>          
          <li class="drop-down"><a href="#">전시회 목록</a>
            <ul>                           
              <li><a href="/views/exhibition/openingList">진행중인 전시회</a></li>
              <li><a href="/views/exhibition/closeList">종료된 전시회</a></li>            
              <li><a href="/views/exhibition/futureList">진행 예정 전시회</a></li>   
            </ul>
          </li>
          
          <li class="active"><a href="/views/gallery/list">전시관 목록</a></li>

          <li class="drop-down"><a href="#">커뮤니티 목록</a>
            <ul>
              <li class="drop-down"><a href="#">공지사항</a>
                <ul>
                  <li><a href="#">공지사항</a></li>
                  <li><a href="#">예매/취소 방법</a></li>
                  <li><a href="#">이용방법</a></li>
                </ul>
              </li>              
              <li><a href="#">후기/추천</a></li>
              <li><a href="#">Q&A</a></li>              
            </ul>
          </li>
          
          <li class="drop-down"><a href="#">전시회 등록 및 수정</a>
            <ul>                           
              <li><a href="/views/exhibition/insert">전시회 등록</a></li>
              <li><a href="/views/exhibition/update-main">전시회 수정</a></li>              
            </ul>
          </li>
        </ul>

      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->