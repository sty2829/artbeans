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
		<div class="col-lg-12 d-flex justify-content-center"><h1>통 합 검 색</h1></div><br>
		<input type=text id = "search" class="col-md-6 d-flex justify-content-center">
		<button onchange = "totalSearch()">검색</button>
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

		<!-- 최신순, 마감순 <div id="exhibitionList"></div> -->
<section id="blog" class="blog">
      <div class="container">
        <div class="row" id="exhibitionList">
          
        </div>
      </div>
</section>
</main>



<script>
var keyword ='${keyword}';// header부분 검색 keyword
var search = document.querySelector('#search').value; //통합검색 페이지 검색
function searchFunc(){
	var xhr = new XMLHttpRequest();
	var param = '?';
	if(search.trim()){
		param += 'eiName='+ document.querySelector('#search').value.trim()+'&';	
	}
	if(keyword.trim()){
		param += keyword.trim();	
	}
	xhr.open('GET','/exhibition-list'+param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
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
			document.querySelector('#exhibitionList').innerHTML = html;			
		}		
	}
	xhr.send();
}
window.onload = searchFunc;
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>