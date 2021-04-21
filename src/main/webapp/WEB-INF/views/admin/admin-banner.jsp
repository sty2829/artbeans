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
div.allWrap {
	width: 80%;
	height: 800px;
	margin-left: auto;
	margin-right: auto;
}

div.left {
	width: 45%;
	height: 500px;
	float: left;
	box-sizing: border-box;
	overflow: auto;
}

div.right {
	width: 45%;
	height: 500px;
	float: right;
	box-sizing: border-box;
	overflow: auto;
}

img {
	display: block;
	margin: 0px auto;
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
</style>
</head>
<body>
	<div style="height: 100px"></div>

	<div class="allWrap">

		<div class="topImage">
			<img src="/resources/admin/img/admin-banner.jpg" alt="Image">
		</div>
		<div style="height: 50px;"></div>

		<div class="left">
			<table class="table table-hover table-bordered table-striped">
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
		</div>
		<div class="right">
			<table class="table table-hover table-bordered table-striped">
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
		</div>
	</div>

	<div style="height: 100px"></div>

	<script>
window.onload= function(){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-openinglist'); //ExhibitionController /exhibition-list /exhibition-listDemo
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let res = JSON.parse(xhr.responseText);
			let htmlLeft='';
			let htmlRight='';
			
			for (let exhibition of res.data) {
				
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
					}else{
						htmlRight+='<tr class="bodyTd">'; 
						htmlRight+='<td>'+exhibition.eiNum+'</td>';
						htmlRight+='<td>'+eiName+'</td>';
						htmlRight+='<td>'+eiArtist+'</td>';
						htmlRight+='<td><button class="buttonRight" onclick="getDeniedEiBanner('+exhibition.eiNum+')">사용불허</button></td>';
						htmlRight+="</tr>";	
					}
				}
			document.querySelector('#tBodyLeft').innerHTML = htmlLeft;
			document.querySelector('#tBodyRight').innerHTML = htmlRight;
			}
		}
	xhr.send();
}
function getPermissionEiBanner(obj){//exhibition-banner-update
	let xhr = new XMLHttpRequest();
	xhr.open('POST', '/exhibition-banner-update'); //ExhibitionController /exhibition-list /exhibition-listDemo
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
				alert('배너 승인 완료');
				location.href='/views/admin/admin-banner';
			
		}
	}
	console.log(obj);
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
				alert('배너 불허 완료');
				location.href='/views/admin/admin-banner';
			
		}
	}
	console.log(obj);
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