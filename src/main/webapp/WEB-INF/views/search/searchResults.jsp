<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 검색</title>
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
		<div class="col-lg-12 d-flex justify-content-center">
		<h1>통 합 검 색</h1>
		</div><br>
		<form action="/search" method="get">
		<div class="col-lg-12 d-flex justify-content-center">	
	<input type=text name = "keyword" class="col-md-6 d-flex justify-content-center">
            <button>검색</button>           
       </div> </form><br>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
					    <ul id="portfolio-flters">
					        <li>A L L</li>
	                 	    <li>전 시 회</li>					        
						    <li>전 시 관</li>
	                    </ul>
					</div>
				</div>
			</div>
		</section>
<section id="blog" class="blog">
<div class="col-lg-12 d-flex justify-content-center">
<h2>전시회</h2>
</div>
      <div class="container">
        <div class="row" id="exhibitionList">
          </div>
        </div>
 
</section>
<section id="blog" class="blog">
<div class="col-lg-12 d-flex justify-content-center">
<h2>전시관</h2>
</div>
      <div class="container">
        <div class="row" id="galleryList">
          </div>
        </div>
 
</section>
</main>
<script>
var keyword ='${keyword}';// header부분 검색 keyword
function topSearch(){
	var xhr = new XMLHttpRequest();
	var param = '?';

	if(keyword.trim()){
		param += 'eiName='+keyword.trim()+'&'+'giName='+ keyword.trim();	
	}
	getGallery();
	console.log('param1=>{}',param);
	xhr.open('GET','/exhibition-list'+param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '<div><h4>검색결과 : '+res.length+'개</h4></div><br>';
			
			console.log(res.length);
			for(var exhibition of res){
				if(res.length!= 0){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				} 
			}
			if( res.length==0){
				html += '<div class="col-lg-12 d-flex justify-content-center">';
				html += '<h3>검색 결과가 없습니다.</h3>';
				html += '</div>';
			}
			
			document.querySelector('#exhibitionList').innerHTML = html;			
		}		
	}
	xhr.send();
}
window.onload = topSearch;


/* function totalSearch(){
	var search = document.querySelector('#search').value.trim(); //통합검색 페이지 검색
	var xhr = new XMLHttpRequest();
	var param = '?';
	if(search){
		param += 'eiName='+ search;
		getGallery(search);
	}
	
	console.log(param);
	xhr.open('GET','/exhibition-list'+param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res){
				if(exhibition.eiNum!= 0){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibition.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				}
			}
			if( res.length==0){
				html += '<div class="col-lg-12 d-flex justify-content-center">';
				html += '<h3>검색 결과가 없습니다.</h3>';
				html += '</div>';
			}
			document.querySelector('#exhibitionList').innerHTML = html;			
		}		
	}
	xhr.send();
} */

function getGallery(obj){
	var param = '?';
	var search = obj; 
	if(keyword.trim()!=null){
		param += 'giName='+ keyword.trim();	
	}else{
		param += 'giName='+ search;
	}
	console.log('param2=>',param);
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'+param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var get = JSON.parse(xhr.responseText);
			console.log(get);
			var html ='<div><h4>검색결과 : '+get.length+'개</h4></div><br>';
			for(var gallery of get){
				if(gallery.giNum!=0){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +gallery.fileInfo.fiPath+ '\'" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + gallery.giName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + gallery.giAddress + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ gallery.giRphoneNumber +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/gallery/views?giNum=' + gallery.giNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
					
				}
			}
			if( get.length==0){
				html += '<div class="col-lg-12 d-flex justify-content-center">';
				html += '<h3>검색 결과가 없습니다.</h3>';
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