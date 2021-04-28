<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hevj9bqhd5"></script>
<script src="/resources/user/js/exhibition/view.js"></script>

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
				<div
					style="border: 0; margin-left: 130px; width: 75%; height: 270px;"
					id="map"></div>
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
		
		
		var url = '/favorite-exhibitions?uiNum=${userInfo.uiNum}';
		var 
		console.log(url);
		 addEventListener('load',function favoriteList(){
			var xhr = new XMLHttpRequest();
			xhr.open('GET',url);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4 && xhr.status==200){
					var res = JSON.parse(xhr.responseText);
					
					for(favoriteExhibition of res){
						html+='';
						
							}
							
						
						}
						
						
					
				
					}
				
			xhr.send();
		});
			//console.log(fviNums);
			//document.querySelector('#heart').innerHTML = html;
			//html += '<img src="/resources/user/img/sidebtn/icons8-heart-40.png"/>';
	</script>


	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>