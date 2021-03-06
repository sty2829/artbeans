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
<style>
input[type="image"]{
height: 40px;
text-align: cencter;
}
</style>
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
				<input type="hidden" id="fviNum">
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
		var uiNum = ${userInfo.uiNum != null ? userInfo.uiNum : 0};
		function goReservation(){		
			if(!uiNum){
				alert('예약하시려면 로그인이 필요합니다');
				return;
			}
			location.href='/views/reservation/reservation-view?eiNum=' + eiNum;
		}
		window.addEventListener('load',favoriteList);
		var url = '/favorite-exhibitions?uiNum='+uiNum;
		 function favoriteList(){
				var xhr = new XMLHttpRequest();
				xhr.open('GET',url);
				xhr.onreadystatechange = function(){
					if(xhr.readyState==4 && xhr.status==200){
						var res = JSON.parse(xhr.responseText);
						var getEiNums =[];
						var html ='';
						console.log(res);
						for(favoriteExhibition of res){	
							getEiNums.push(favoriteExhibition.exhibitionInfo.eiNum);					
								}if(getEiNums.includes(eiNum)){								
									console.log(favoriteExhibition.fviNum);
									document.querySelector('#fviNum').value=favoriteExhibition.fviNum;
									document.querySelector('#fviCheck').src = "/resources/user/img/sidebtn/addHeart.gif";
								}else{
									document.querySelector('#fviCheck').src = "/resources/user/img/sidebtn/removeHeart.gif";							
								}								
							}
					}		
				xhr.send();
		 }	 
		 async function checkFavorite(){
			 await favoriteList();
			 var fviNum = document.querySelector('#fviNum').value;
			saveFavorite(fviNum);
		 }
		 function saveFavorite(getFviNum){
			 var xhr = new XMLHttpRequest();
			 xhr.open('POST',"/favorite-insert");
			 xhr.onreadystatechange= function(){
				 if(xhr.readyState==4 && xhr.status==200){
					 var res = xhr.responseText;
					 console.log(res);
					 if(res==1){
						 
						 return favoriteList();
					 }else if(res==2){
						 alert('로그인 후 이용가능합니다. ');
						 location.href="/views/user/login";
					 }else if(res==0){
						 
						 document.querySelector('#fviNum').value = null;
						 return favoriteList();
						 
						 
					 }
				 }				 
			 }
			 var param = {
					 fviNum : getFviNum,
					 exhibitionInfo : {eiNum : eiNum},
					userInfo: {uiNum : uiNum}					 
						 };			 
			 xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
				xhr.send(JSON.stringify(param));
			console.log(param);
		 }
		 
		 window.addEventListener('load',getExhibition);
	</script>


	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>