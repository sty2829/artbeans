<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button>검색</button>
<div id="galleryList"></div>

<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<div>';
			
			// exhibition.eiStatus=1 전지중인 전시회
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