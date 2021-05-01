<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 배너 관리</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/admin/board/css/bootstrap.css">
<style>
.allWrap {
	width: 80%;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
}

.left1 {
	width: 45%;
	height: 600px;
	float: left;
	box-sizing: border-box;
	overflow: auto;
}

.right1 {
	width: 45%;
	height: 600px;
	float: right;
	box-sizing: border-box;
	overflow: auto;
}
.tableCSS{
	height:450px;
}

.topImage {
	height: 200px;
}

.headTr {
	background: red;
	font-size: 20px;
	font-style: normal;
	font-weight: bolder;
	color: white;
}

.bodyTd {
	height:40px;
	font-size: 15px;
}

.buttonLeft {
	font-weight: bolder;
	color: white;
	background: red;
}
.buttonRight {
	font-weight: bolder;
	color: white;
	background: gray;
}

.row1{  /*페이징 처리시 위치 센터 지정 */
	margin-left: 120px; 
	margin-right: auto;
	height:100px;
}

.page-link{ /*페이징 처리시 단추 모양 조정 */
	height:30px;
	width: 50px;
	text-align: center;
}

</style>
</head>
<body>
	<div style="height: 100px"></div>

	<div class="allWrap">

		<div class="topImage">
			<img src="/resources/admin/img/admin-banner.jpg" alt="Image" style="display: block; margin: 0px auto;">
		</div>
		<div style="height: 50px;"></div>

		<div class="left1">
			<table class="table table-hover table-bordered table-striped tableCSS">
				<thead>
					<tr class="headTr">
						<th>번호</th>
						<th>전시회 이름</th>
						<th>작가</th>
						<th>배너 허가</th>
					</tr>
				</thead>
				<tbody id="tBodyLeft">

				</tbody>
			</table>
			<div class="row1"><!-- 페이징 처리 -->
				<div class="col-lg-6">
					<nav aria-label="Page navigation example" class="col-lg-6-under">
						<ul class="pagination justify-content-center" id="pastPageList">
						</ul>
					</nav>
				</div>
			</div><!-- 페이징처리 -->
		</div>
		<div class="right1">
			<table class="table table-hover table-bordered table-striped tableCSS">
				<thead>
					<tr class="headTr">
						<th>번호</th>
						<th>전시회 이름</th>
						<th>작가</th>
						<th>배너 허가</th>
					</tr>
				</thead>
				<tbody id="tBodyRight">

				</tbody>
			</table>
			<div class="row1"><!-- 페이징 처리 -->
				<div class="col-lg-6">
					<nav aria-label="Page navigation example" class="col-lg-6-under">
						<ul class="pagination justify-content-center" id="pastPageList2">
						</ul>
					</nav>
				</div>
			</div><!-- 페이징처리 -->
		</div>
	</div>

	<div style="height: 100px"></div>

	<script>

var size = 5; 
window.addEventListener('load', () => {
	getOpenLeftSide(1)
});
window.addEventListener('load', () => {
	getOpenRightSide(1)
});

function getOpenLeftSide(page){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-banner/banner?size=9&page='+(page-1)+'&eiBanner='+0); //ExhibitionController /exhibition-list /exhibition-listDemo
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			let htmlLeft='';
			for (let exhibition of res.content) {
				
				let eiName='';
				let eiArtist='';
				
				if(exhibition.eiName.length>7){
					eiName=exhibition.eiName.substring(0,6)+'...';
				}else{
					eiName=exhibition.eiName;
				}
				
				if(exhibition.eiArtist.length>7){
					eiArtist=exhibition.eiArtist.substring(0,6)+'...';
				}else{
					eiArtist=exhibition.eiArtist;
				}
				
				if(exhibition.eiBanner==0 || exhibition.eiBanner==null){
					htmlLeft+='<tr class="bodyTd">'; 
					htmlLeft+='<td>'+exhibition.eiNum+'</td>';
					htmlLeft+='<td>'+eiName+'</td>';
					htmlLeft+='<td>'+eiArtist+'</td>';
					htmlLeft+='<td><button class="buttonLeft" onclick="getPermissionEiBanner('+exhibition.eiNum+')">사용승인</button></td>';
					htmlLeft+="</tr>";
				}
				}
			let disable = res.first ? 'disabled' : '';
			
			let li = '<li class="page-item ' + disable + '" onclick="getOpenLeftSide(' + res.number + ')">';
			li += '<a class="page-link" href="#" tabindex="-1">이전</a>';
			li += '</li>';
			
			let startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			let endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getOpenLeftSide(' + startPage + ')"><a class="page-link" href="#">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getOpenLeftSide(' + startPage +')"><a class="page-link" href="#">'+ startPage +'</a></li>';
			}
			
			disable = res.last ? 'disabled' : '';
			if(disable!='disabled'){
				li += '<li class="page-item ' + disable +'" onclick="getBeforeConfirm(' + (Number(res.number)+2) +')">';
			    li += '<a class="page-link" href="#">다음</a>';
			  	li += '</li>';
			}else{
				li += '';
			}
			
			document.querySelector('#tBodyLeft').innerHTML = htmlLeft;
			document.querySelector('#pastPageList').innerHTML = li;
			}
		}
	xhr.send();
}

function getOpenRightSide(page){
	let xhr = new XMLHttpRequest();
	xhr.open('GET',  '/exhibition-banner/banner?size=9&page='+(page-1)+'&eiBanner='+1); //ExhibitionController /exhibition-list /exhibition-listDemo
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			let htmlRight='';
			for (let exhibition of res.content) {
				
				let eiName='';
				let eiArtist='';
				
				if(exhibition.eiName.length>7){
					eiName=exhibition.eiName.substring(0,6)+'...';
				}else{
					eiName=exhibition.eiName;
				}
				
				if(exhibition.eiArtist.length>7){
					eiArtist=exhibition.eiArtist.substring(0,6)+'...';
				}else{
					eiArtist=exhibition.eiArtist;
				}
				
				if(exhibition.eiBanner==1 || exhibition.eiBanner==2){
					htmlRight+='<tr class="bodyTd">'; 
					htmlRight+='<td>'+exhibition.eiNum+'</td>';
					htmlRight+='<td>'+eiName+'</td>';
					htmlRight+='<td>'+eiArtist+'</td>';
					htmlRight+='<td><button class="buttonRight" onclick="getDeniedEiBanner('+exhibition.eiNum+')">사용철회</button></td>';
					htmlRight+="</tr>";
				}
				}
			let disable = res.first ? 'disabled' : '';
			
			let li = '<li class="page-item ' + disable + '" onclick="getOpenRightSide(' + res.number + ')">';
			li += '<a class="page-link" href="#" tabindex="-1">이전</a>';
			li += '</li>';
			
			let startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			let endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getOpenRightSide(' + startPage + ')"><a class="page-link" href="#">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getOpenRightSide(' + startPage +')"><a class="page-link" href="#">'+ startPage +'</a></li>';
			}
			disable = res.last ? 'disabled' : '';
			
			if(disable!='disabled'){
				li += '<li class="page-item ' + disable +'" onclick="getBeforeConfirm(' + (Number(res.number)+2) +')">';
			    li += '<a class="page-link" href="#">다음</a>';
			  	li += '</li>';
			}else{
				li += '';
			}
			
			document.querySelector('#tBodyRight').innerHTML = htmlRight;
			document.querySelector('#pastPageList2').innerHTML = li;
			}
		}
	xhr.send();
}

function getPermissionEiBanner(obj){//exhibition-banner-update
	let xhr = new XMLHttpRequest();
	xhr.open('POST', '/exhibition-banner-update'); //ExhibitionController /exhibition-list /exhibition-listDemo
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
				location.href='/views/admin/admin-banner';
			
		}
	}
	
	var formData = new FormData();
	formData.append('eiNum',obj);
	formData.append('eiBanner',1);
	xhr.send(formData);
}

function getDeniedEiBanner(obj){//exhibition-banner-update
	let xhr = new XMLHttpRequest();
	xhr.open('POST', '/exhibition-banner-update'); //ExhibitionController 
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
				location.href='/views/admin/admin-banner';
			
		}
	}
	var formData = new FormData();
	formData.append('eiNum',obj);
	formData.append('eiBanner',0);
	xhr.send(formData);
}
</script>
	<script src="/resources/admin/board/js/jquery-3.1.1.js"></script>
	<script src="/resources/admin/board/js/bootstrap.js"></script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>