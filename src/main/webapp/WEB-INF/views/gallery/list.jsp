<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
					    <ul id="portfolio-flters">
					        <li onclick="nameAsc()">이름 오름차순</li>
	                 	    <li onclick="nameDesc()">이름 내림차순</li>					        
						    <li onclick="areaAsc()">지역 오름차순</li>
	                 	    <li onclick="areaDesc()">지역 내림차순</li>
	                    </ul>
					</div>
				</div>
			</div>
		</section>

		<!-- 최신순, 마감순 <div id="exhibitionList"></div> -->
<section id="blog" class="blog">
      <div class="container">
        <div class="row" id="galleryList">
          
        </div>
      </div>
</section>
</main>



<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res){
				console.log(galleryInfo.fileInfo.fiPath);
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div class="read-more">';					
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer">상세정보</a>';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function areaAsc(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-areaAsc'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res){
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div class="read-more">';					
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer">상세정보</a>';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function areaDesc(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-areaDesc'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res){
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div class="read-more">';					
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer">상세정보</a>';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function nameAsc(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-nameAsc'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res){
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div class="read-more">';					
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer">상세정보</a>';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}

function nameDesc(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-nameDesc'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var galleryInfo of res){
				html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
				html += '<article class="entry">';
				html += '<div class="entry-img">';
				html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +galleryInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
				html += '</div>';
				html += '<h2 class="entry-title">';
				html += '<a>' + galleryInfo.giName + '</a>';
				html += '</h2>';
				html += '<div class="entry-meta">';
				html += '<ul>';
				html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + galleryInfo.giHomepage + '</a></li>';
				html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ galleryInfo.giStartTime +'</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<div class="entry-content">';
				html += '<div style="HEIGHT: 10pt"></div>';
				html += '<div class="read-more">';					
				html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer">상세정보</a>';
				html += '</div>';
				html += '</div>';
				html += '</article>';
				html += '</div>';
			}
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>