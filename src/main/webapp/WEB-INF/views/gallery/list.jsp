<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 지역순, 이름순 , 나중에 드랍다운으로 바꿔서-->
<button onclick="areaAsc()">지역순 (오름차순)</button>
<button onclick="areaDesc()">지역순 (내림차순)</button>
 <button onclick="nameAsc()">이름순 (오름차순)</button>
 <button onclick="nameDesc()">이름순 (내림차순)</button>
<div id="galleryList"></div>

<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //galleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<div>';
			for(var galleryInfo of res){			
				html += '<h2 onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer"> 갤러리 ' + galleryInfo.giName + '</h2>';
				html += '<p> 주소 ' + galleryInfo.giAddress + '</p>';
			}
			html += '</div>';
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
			var html = '<div>';
			for(var galleryInfo of res){			
				html += '<h2 onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer"> 갤러리 ' + galleryInfo.giName + '</h2>';
				html += '<p> 주소 ' + galleryInfo.giAddress + '</p>';
			}
			html += '</div>';
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
			var html = '<div>';
			for(var galleryInfo of res){			
				html += '<h2 onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer"> 갤러리 ' + galleryInfo.giName + '</h2>';
				html += '<p> 주소 ' + galleryInfo.giAddress + '</p>';
			}
			html += '</div>';
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
			var html = '<div>';
			for(var galleryInfo of res){			
				html += '<h2 onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer"> 갤러리 ' + galleryInfo.giName + '</h2>';
				html += '<p> 주소 ' + galleryInfo.giAddress + '</p>';
			}
			html += '</div>';
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
			var html = '<div>';
			for(var galleryInfo of res){			
				html += '<h2 onclick="location.href=\'/views/gallery/views?giNum=' + galleryInfo.giNum + '\'" style="cursor:pointer"> 갤러리 ' + galleryInfo.giName + '</h2>';
				html += '<p> 주소 ' + galleryInfo.giAddress + '</p>';
			}
			html += '</div>';
			document.querySelector('#galleryList').innerHTML = html;
		}		
	}
	xhr.send();
}
</script>
</body>
</html>