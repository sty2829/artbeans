<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/exhibition/mainList.js"></script>
</head>
<body>

 <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
      <div  id="mainSlide" class="carousel-inner" role="listbox">
<!--         Slide 1
        <div id="mainSlide" class="carousel-item active" style="background-image: url(/resources/assets/img/slide/slide-1.jpg)">-->
         
      </div> 
      
      <div id ="slide" class="carousel-inner" role="listbox">
      </div>
      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </section><!-- End Hero -->
  
  <script>
			function slideExhibition() {
				
				for (var i = 0; i < 3; i++) {
					if (i = 0) {

						html += '<div class="carousel-item active" style="background-image: url(/resources/assets/img/exhibition/' + slideExhibitions['fileInfo']['fiPath']+'">';
						html += '<div class="carousel-item" style="background-image: url(/resources/assets/img/exhibition/' + slideExhibitions['fileInfo']['fiPath']+'">';
						html += '<div class="carousel-container">';

		function bannerExhibition() {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '/exhibition-banner');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					console.log(res);
					var html ='';
					for(var i=0;i<res.length;i++){
						if(res[i]==res[0]){
						html +='<div class="carousel-item active" style="background-image: url(resources/assets/img/exhibition/'+res[i].fileInfo.fiPath+')">';
						html +='<div class="carousel-container">';
						html += '<div class="container">';
						html +='<h2 class="animate__animated animate__fadeInDown"><span>'+res[i].eiName+'</span></h2>';
						html +=' <p class="animate__animated animate__fadeInUp"></p>';
						html += '<a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">상세보기</a>';
						html +='</div>';
						html += '</div>';
						html += '</div>';
						}
						html +='<div class="carousel-item" style="background-image: url(resources/assets/img/exhibition/'+res[i].fileInfo.fiPath+')">';
						html +='<div class="carousel-container">';
						html += '<div class="container">';
						html +='<h2 class="animate__animated animate__fadeInDown"><span>'+res[i].eiName+'</span></h2>';
						html +='<p class="animate__animated animate__fadeInUp"></p>';
						html += '<a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">상세보기</a>';
						html +='</div>';
						html += '</div>';
						html += '</div>';
					}document.querySelector('#slide').innerHTML = html;	
								
				}
			}
			xhr.send();
		}
window.onload = bannerExhibition;
</script>

  <main id="main">
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>전시회 목록</h2>
          <p>진행중인 전시회</p>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">전체</li>
              <li data-filter=".filter-app">진행중인 전시회</li>
              <li data-filter=".filter-card">갤러리</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" id="exhibitionList">
        </div>

      </div>
    </section><!-- End Portfolio Section -->
  </main><!-- End #main -->

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>