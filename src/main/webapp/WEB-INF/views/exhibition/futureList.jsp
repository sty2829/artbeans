<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 예정인 목록</title>

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
						    <li id="newest()">전시회 오픈순</li>
	                 	    <li id="deadline()">전시회 마감순</li>
	                    </ul>
					</div>
				</div>
			</div>
		</section>

		<!-- 최신순, 마감순 <div id="exhibitionList"></div> -->
<section id="blog" class="blog">
      <div class="container">
        <div class="row">
          <div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" id="exhibitionList">
          
          </div>
         </div>
       </div>
</section>
</main>

<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<article class="entry">';
			html += '<div class="entry-img">';            
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				console.log(exhibition);
				if(exhibition.eiStatus==0){
					html += '<img src="/resources/assets/img/exhibition/"' + exhibition.fileInfo.fiPath + '"class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate +'</a></li>';
					html += '</ul>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
				}
				
			}
			
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}

function newest(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list-newest'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<article class="entry">';
			html += '<div class="entry-img">';            
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				if(exhibition.eiStatus==0){
					html += '<img src="/resources/assets/img/features-4.png" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate +'</a></li>';
					html += '</ul>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
				}
				
			}
			
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}

function deadline(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list-deadline'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<article class="entry">';
			html += '<div class="entry-img">';            
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				if(exhibition.eiStatus==0){
					html += '<img src="/resources/assets/img/features-4.png" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate +'</a></li>';
					html += '</ul>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
				}
				
			}
			
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}
</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>