<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세정보</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
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
     <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
 <section id="contact" class="contact">
      <div class="container" >

        <div style="border:0; width: 100%; height: 270px;" id="map">
          
        </div>
      </div>
 </section>
  </main>
  
<script>
var giNum = ${param.giNum}
window.onload = function (){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery?giNum='+giNum); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			console.log(res);			
						
			var html = '<div class="col-lg-8">';
			html += '<h2 class="portfolio-title">' + res.giName + '</h2>';
			html += '<div class="entry-img ">';
			// style="width:800px; height:700px" 일부로 사이즈 안 넣었음.
			html += '<img  src=\'/resources/assets/img/gallery/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
			html += '</div></div>';
			html += '<div class="col-lg-4 portfolio-info">';
			html += '<ul>';
			html += '<li><strong>주소</strong>: ' + res.giAddress +'</li>';
			html += '<li><strong>전화번호</strong>: ' + res.giRphoneNumber +'</li>';
			html += '<li><strong>휴일</strong>: ' + res.giHoliday +'</li>';
			html += '<li><strong>홈페이지</strong>: ' + res.giHomepage +'</li>';
			html += '<li><strong>운영시간</strong>: ' + res.giStartTime + '~' + res.giEndTime + '</li>';
			html += '</ul>';
			html += '</div>';
			
			document.querySelector('#exhibition').innerHTML += html;
			
			var mapOptions = {
				    center: new naver.maps.LatLng(res.giAddressY,res.giAddressX),
				    zoom: 16
				};
				var map = new naver.maps.Map('map', mapOptions);				 
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(res.giAddressY, res.giAddressX),
				    title: res.giName,
				    map: map
				});				 
				var contentString = [
				        '<div style="padding:4px 4px;">',
				        '   <div style="font-weight:bold;padding-bottom:3px;">'+ res.giName + '</div>',
				        '</div>'
				    ].join('');				 
				var infowindow = new naver.maps.InfoWindow({
				    content: contentString
				});				 
				naver.maps.Event.addListener(marker, "click", function(e) {
				    if (infowindow.getMap()) {
				        infowindow.close();
				    } else {
				        infowindow.open(map, marker);
				    }
				});				 
				infowindow.open(map, marker);
		}		
	}
	xhr.send();
}
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>