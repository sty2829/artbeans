<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

 <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
      <div  id="mainSlide" class="carousel-inner" role="listbox">
<!--         Slide 1
        <div id="mainSlide" class="carousel-item active" style="background-image: url(/resources/assets/img/slide/slide-1.jpg)">
        </div> -->
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
						html += '<div class="container">';
						html += '</div>';
						html += '</div>';
						html += '</div>';
					}
					html += '<div class="carousel-item active" style="background-image: url(/resources/assets/img/exhibition/' + slideExhibitions['fileInfo']['fiPath']+'">';
					html += '<div class="carousel-item" style="background-image: url(/resources/assets/img/exhibition/' + slideExhibitions['fileInfo']['fiPath']+'">';
					html += '<div class="carousel-container">';
					html += '<div class="container">';
					html += '</div>';
					html += '</div>';
					html += '</div>';
				}
				document.querySelector('#mainSlide').innerHTML = html;
			}
			window.onload = slideExhibition;
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

<script>

    var html = '';
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list?size=9&sort=eiStartDate,asc'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){			
			var res = JSON.parse(xhr.responseText);
			// exhibition.eiStatus=0 수락전
			for(var exhibition of res.data){
				if(exhibition.eiStatus==0){
						
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-app">';					
					html += '<div alt="" class="portfolio-wrap" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '<img src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.eiName + '</h4>';
					html += '<p>' + exhibition.eiArtist + '</p>';					
					html += '</div></div></div>';
					html += '<div class="col-lg-4 col-md-6 portfolio-item filter-card">';
					html += '<div class="portfolio-wrap" onclick="location.href=\'/views/gallery/views?giNum=' + exhibition.galleryInfo.giNum + '\'">';
					html += '<img src=\'/resources/assets/img/gallery/' + exhibition.galleryInfo.fileInfo.fiPath + '\'" class="img-fluid" >';
					html += '<div class="portfolio-info">';
					html += '<h4>' + exhibition.galleryInfo.giName + '</h4>';
					html += '<p>' + exhibition.galleryInfo.giAddress + '</p>';					
					html += '</div></div></div>';
				}
			}
			
			document.querySelector('#exhibitionList').innerHTML += html;
		}		
	}
	xhr.send();

</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>