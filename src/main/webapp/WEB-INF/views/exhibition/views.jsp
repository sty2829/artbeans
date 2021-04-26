<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
<!-- <script src="/resources/user/js/exhibition/view.js"></script> -->

</head>
<body>

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">
				<div class="row" id="exhibition"></div>
			</div>
		</section>

		<section id="contact" class="contact">
			<div class="container">
				<div style="border: 0; margin-left: 130px; width: 75%; height: 270px;" id="map"></div>
			</div>			
		</section>
		
	</main>

	<script>
		var eiNum = ${param.eiNum};
		//예약하기추가
		function goReservation(){
			var uiNum = ${userInfo.uiNum != null ? userInfo.uiNum : 0};
			if(!uiNum){
				alert('예약하시려면 로그인이 필요합니다');
				return;
			}
			location.href='/views/reservation/reservation-view?eiNum=' + eiNum;
		}
		
		
		window.onload = function (){
			var xhr = new XMLHttpRequest();
			xhr.open('GET','/exhibition?eiNum='+eiNum); //ExhibitionController
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4 && xhr.status==200){
					//console.log(xhr.responseText);
					var res = JSON.parse(xhr.responseText);
					var html = '<div class="col-lg-7">';
					html += '<div style="text-align:center" class="entry-img ">';
					html += '<img style="width:550px; height:500px" src=\'/resources/assets/img/exhibition/' + res.fileInfo['fiPath'] + '\'" class="img-fluid">';
					html += '</div></div>';
					html += '<div class="col-lg-5 portfolio-info">';
					html += '<h2 class="portfolio-title">' + res.eiName + '</h2>';
					html +='<hr>';
					html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>전시 갤러리</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            html +='<h5 id="getGiName" style="padding-top:1px;cursor:pointer" onMouseover="this.style.color=\'red\';" onMouseout="this.style.color=\'black\'" onclick="location.href=\'/views/gallery/views?giNum=' + res.galleryInfo['giNum'] + '\'">' + res.galleryInfo['giName'] +'</h5></div></div>';
		            html +='<hr>';
					html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>전시회 장소</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            html +='<h5 style="padding-top:1px">' + res.galleryInfo['giAddress'] +'</h5></div></div>';
		            html +='<hr>';
					html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>작가</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            html +='<h5 style="padding-top:1px">' + res.eiArtist +'</h5></div></div>';
		            html +='<hr>';
		            html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>전시회 일정</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            html +='<h5 style="padding-top:1px">' + res.eiStartDate + '~' + res.eiEndDate +'</h5></div></div>';
		            html +='<hr>';
					html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>진행시간</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            html +='<h5 style="padding-top:1px">' + res.eiStartTime + '~' + res.eiEndTime +'</h5></div></div>';
		            html +='<hr>';
		            html +='<div class="row faq-item d-flex align-items-stretch">';
		            html +='<div class="col-lg-4">';
		            html +='<h4>가격</h4></div>';
		            html +='<div class="col-lg-1">';
		            html +='<h4>|</h4></div>';
		            html +='<div class="col-lg-7">';
		            if(res.eiCharge==0){
		                html +='<h5 style="padding-top:1px">무료</h5></div></div>';
		            }else{
		                html +='<h5 style="padding-top:1px">' + res.eiCharge +'</h5></div></div>';
		            }
		            
		            html +='<hr>';
		            
					//예약추가
					if(res.reservationInfo != null){
						html += '<button type="button" class="btn btn-primary float-right" onclick="goReservation()">예약하기</button>';
					}else{
						html += '<div style="text-align: center;"><span>예약정보가 없습니다.</sapn></div>'
					}
					
					html += '</div>';
					html += '<section style="padding-top:10px; padding-bottom: 10px; margin-top: 20px; margin-left:15px; margin-right:15px; width:100%;"><div class="container">';
					html += '<div class="section-title">';
					html += '<h2>'+res.eiName+'</h2><p>전시회 설명</p></div>';
					html += '<div style="text-align:center">' + res.eiContent + '</div>';
					html += '<button class="btn btn-info" onclick="map()">지도보기</button>';
					html += '</div></section>';
					
					
					var giY = res.galleryInfo['giAddressY'];
					var giX = res.galleryInfo['giAddressX'];
					html += '<input type="hidden" id="giAddressX" value="'+ giX +'">';
					html += '<input type="hidden" id="giAddressY" value="'+giY+'">';
					
					document.querySelector('#exhibition').innerHTML = html;
					
				}		
			}
			xhr.send();
			
		}
		
		//window.addEventListener("load", map);
		
		
		function map(){
			var addrX = document.querySelector('#giAddressX').value;
			var addrY = document.querySelector('#giAddressY').value;
			var giName = document.querySelector('#getGiName').innerHTML;
			console.log(giName);
		var mapOptions = {
			    center: new naver.maps.LatLng(addrY,addrX),
			    zoom: 16
			};
			var map = new naver.maps.Map('map', mapOptions);				 
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(addrY, addrX),
			    title: giName,
			    map: map
			});				 
			var contentString = [
			        '<div style="padding:4px 4px;">',
			        '   <div style="font-weight:bold;padding-bottom:3px;">'+ giName + '</div>',
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
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>