<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 지역순, 이름순 -->
<button onclick="area()">지역순</button> <button onclick="name()">이름순</button>
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

function area(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-area'); //galleryController
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

function area(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list-name'); //galleryController
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