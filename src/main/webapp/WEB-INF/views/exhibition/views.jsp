<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

</head>
<body>

  <main id="main">
  
   <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
        </div>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
        <div class="row" id="exhibition">

        </div>
      </div>
    </section>
    
    <!-- 나중에 지도 바꾸기 -->
     <section id="contact" class="contact">
      <div class="container">
        <div>
          <iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
        </div>
      </div>
    </section>
  </main>
  
<script>
var eiNum = ${param.eiNum}
window.onload = function (){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition?eiNum='+eiNum); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			//console.log(res);			
			//console.log(res.eiName);
			console.log(res.fileInfo['fiPath']);
						
			var html = '<div class="col-lg-8">';
			html += '<h2 class="portfolio-title">' + res.eiName + '</h2>';
			html += '<div class="entry-img ">';
			// style="width:800px; height:700px" 일부로 사이즈 안 넣었음.
			html += '<img  src=\'/resources/assets/img/exhibition/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
			html += '</div></div>';
			html += '<div class="col-lg-4 portfolio-info">';
			html += '<ul>';
			html += '<li><strong>전시회하는 갤러리</strong>:' + res.galleryInfo['giName'] +'</li>';
			html += '<li><strong>갤러리 주소</strong>:' + res.galleryInfo['giAddress'] +'</li>';
			html += '<li><strong>작가</strong>:' + res.eiArtist +'</li>';
			html += '<li><strong>가격</strong>:' + res.eiCharge +'</li>';
			html += '<li><strong>전시회 일정</strong>:' + res.eiStartDate + '~' + res.eiEndDate + '</li>';
			html += '<li><strong>전시회 시간</strong>:' + res.eiStartTime + '~' + res.eiEndTime + '</li>';
			html += '</ul>';
			html += '<p>' + res.eiContent + '</p>';
			html += '</div>';
			
			document.querySelector('#exhibition').innerHTML += html;
		}		
	}
	xhr.send();
}
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>