<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>



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
					<div class="col-lg-12 d-flex justify-content-center">
						<h2 class='date_text' style="text-align: center; padding: 2rem 0">일자별
							리스트</h2>
					</div>
				</div>
			</div>
		</section>

		<!-- 최신순, 마감순 <div id="exhibitionList"></div> -->
		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>
		</section>
	</main>




	<script>
window.onload = get;

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


var getValue = getParameterByName("eiStartDate");
//get 방식의 value 값임

/*
var count = 0;
window.onscroll = function(e) {
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        count++;
        get();
    }
};
*/

function get(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-calendar-oneday?size=99&eiStartDate='+getValue); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			
			for(var exhibitionInfo of res.data){
				console.log(exhibitionInfo.eiStatus); ///exhibition-list 로 했을때 21번부터 40번까지밖에 출력안됨
				if(exhibitionInfo.eiStatus==1){
					
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/gallery/' +exhibitionInfo.fileInfo.fiPath+ '\'" class="img-fluid">';
					html += '</div>';
					html += '<h2 class="entry-title">';
					html += '<a>' + exhibitionInfo.eiName + '</a>';
					html += '</h2>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibitionInfo.eiArtist + '</a></li>';
					html += '<li class="d-flex align-items-center"><i class="icofont-money-bag"></i><a>요금: '+ exhibitionInfo.eiCharge +'</a></li>';
					html += '</ul>';
					html += '</div>';
					html += '<div class="entry-content">';
					html += '<div style="HEIGHT: 10pt"></div>';
					html += '<div class="read-more">';					
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibitionInfo.eiNum + '\'" style="cursor:pointer">상세정보</a>';
					html += '</div>';
					html += '</div>';
					html += '</article>';
					html += '</div>';
				}else{
					html += '';
				}
			}
			document.querySelector('#exhibitionList').innerHTML += html;
		}		
	}
	xhr.send();
}
</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>