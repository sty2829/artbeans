<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 최신순, 마감순  -->
<button onclick="newest()">최신순</button> <button onclick="deadline()">마감순</button> 
<div id="exhibitionList"></div>

<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<div>';
			
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				if(exhibition.eiStatus==0){				
				html += '<h2 onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer"> 전시회명 ' + exhibition.eiName + '</h2>';
				html += '<p> 작가 ' + exhibition.eiArtist + '</p>';
				html += '<p> 가격 ' + exhibition.eiCharge + '</p>';
				}
			}
			html += '</div>';
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
			var html = '<div>';
			
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				if(exhibition.eiStatus==0){				
				html += '<h2 onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer"> 전시회명 ' + exhibition.eiName + '</h2>';
				html += '<p> 작가 ' + exhibition.eiArtist + '</p>';
				html += '<p> 가격 ' + exhibition.eiCharge + '</p>';
				}
			}
			html += '</div>';
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
			var html = '<div>';
			
			// exhibition.eiStatus=0 진행할 전시회
			for(var exhibition of res){
				if(exhibition.eiStatus==0){				
				html += '<h2 onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'" style="cursor:pointer"> 전시회명 ' + exhibition.eiName + '</h2>';
				html += '<p> 작가 ' + exhibition.eiArtist + '</p>';
				html += '<p> 가격 ' + exhibition.eiCharge + '</p>';
				}
			}
			html += '</div>';
			document.querySelector('#exhibitionList').innerHTML = html;
		}		
	}
	xhr.send();
}
</script>
</body>
</html>