<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>통합 검색</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>

.searchInput {
  height: 3em;
  width: 400px;
  padding: 0 10px;
  box-shadow: 3px 3px 10px #566270;
  outline: none;
  border: none;
  border-radius: 6px;
}
.searchInput::placeholder {
	color: #d2d2d2;
}


#totalSuggestListDiv {
	width: 400px;
	margin-top: 50px;
	position: absolute;
	background: white;
	padding: 0 2px;
	border-radius: 6px;
}

.totalItem {
	height: 1.8em;
	width: 400px;
	outline: none;
}

.totalItem:hover {
	color: #black;
	background: #dcdcdc;
	width: 400px;
}


</style>
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
			<div class="col-lg-12 d-flex justify-content-center">
				<h1>통 합 검 색</h1>
			</div>
			<br>

			<form action="/search" method="get" name="frm" onsubmit="return check('searchInput')">
				<div>
					<div>
						<div class="col-lg-12 d-flex justify-content-center">
							<input autocomplete="off" type=text name="keyword" placeholder="전시관,전시회 검색"
								class="searchInput" onkeyup="startSuggest(this);" id="searchInput">
							<div style="display: none;">
								<button id="btn_search">검색</button>
							</div>
							<div id="totalSuggestListDiv"></div>
						</div>
					</div>
				</div>
			</form>
			<br>

		</section>
		<section id="blog" class="blog">
			<div class="col-lg-12 d-flex justify-content-center">
				<h2>전시회</h2>
			</div>
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>

		</section>
		<section id="blog" class="blog">
			<div class="col-lg-12 d-flex justify-content-center">
				<h2>전시관</h2>
			</div>
			<div class="container">
				<div class="row" id="galleryList"></div>
			</div>

		</section>
	</main>
	<script>
function startSuggest(target){
	console.log(target.value);
	if(target.value.trim()==''){
		return hide();		
	}
	totalSuggestGallery(target);
	if(!target.value.trim()) return;
var tKeyword ='?eiName='+ target.value;
var encodeWord = encodeURI(tKeyword);
var xhr = new XMLHttpRequest();
xhr.open('GET','/exhibition-search'+tKeyword);
xhr.onreadystatechange = function(){
	if(xhr.readyState==4&& xhr.status==200){
		var res = JSON.parse(xhr.responseText);
		console.log(res);
		html = '';
		for(var exhibition of res){
			html +=	'<div class="totalItem">'; 
			html +='<a style="cursor: pointer" onclick="location.href=\'/search?keyword='+ exhibition.eiName +'\'">'+exhibition.eiName+'</a>';
			html +=	'<span class="text"></span>';
			html += '</div>';
		}
		document.querySelector('#totalSuggestListDiv').innerHTML = html;
		show();
		}
	}
	xhr.send();
}

function totalSuggestGallery(obj){ 
	if(obj.value.trim()==''){
		return hide();		
	}
	var gKeyword ='?giName='+ obj.value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-lists'+gKeyword);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var get = JSON.parse(xhr.responseText);
			
			console.log(get);
			var html ='';
			for(var gallery of get){
			
					html +=	'<div class="totalitem">'; 
					html +='<a style="cursor: pointer" onclick="location.href=\'/search?keyword='+ gallery.giName +'\'">'+gallery.giName+'</a>';
					html +=	'<span class="text"></span>';
					html += '</div>';		
		}
			document.querySelector('#totalSuggestListDiv').innerHTML = html;
			show();
		}
	}
	xhr.send();
}

function hide(){
	var suggestListDiv = document.querySelector('#suggestListDiv');
	suggestListDiv.style.display='none';
}
function show(){
	var suggestListDiv = document.querySelector('#suggestListDiv');
	suggestListDiv.style.display='block';
}

</script>


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
	xhr.open('GET','/exhibition-search'+param);
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
	xhr.open('GET','/Gallery-lists'+param);
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