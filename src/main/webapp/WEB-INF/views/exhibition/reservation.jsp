<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예정인 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/infinityScroll.js"></script>
</head>
<body>
	<!-- 맨 아래가면 탑가는 버튼 속도 조절해야 됨. -->
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row"> 
					
				</div>
			</div>
		</section>
		
		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>
		</section>
<script>
window.addEventListener("load", get);
function get(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/reservation-list?size=9&sort=riStartDate,asc&page=' + count); //ReservationController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){			
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html = '';
			for(var reservationList of res.content){	
				console.log(reservationList.exhibitionInfo.eiNum);
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/upload/' + reservationList.exhibitionInfo.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + reservationList.exhibitionInfo.eiNum + '\'">';
				html += '</div>';
				html += '<div class="row"><div class="col-sm-10">'
				html += '<h2 class="entry-title">';
				html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + reservationList.exhibitionInfo.eiNum + '\'">' + reservationList.exhibitionInfo.eiName + '</a>';
				html += '</h2></div>';					
				html += '<div class="col-sm-2"><a href=\'/upload/' + reservationList.exhibitionInfo.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + reservationList.exhibitionInfo.eiArtist + '</a></li>';
				html += '</ul>';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ reservationList.exhibitionInfo.eiStartDate + '~'+ reservationList.exhibitionInfo.eiEndDate +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div style="display:none" class="read-more">';
				html += '<input type="checkbox" onclick="sideMap()">';					
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
		}			
		document.querySelector('#exhibitionList').innerHTML += html;
		}
	}
	xhr.send();			
}
</script>
		
	</main>	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>