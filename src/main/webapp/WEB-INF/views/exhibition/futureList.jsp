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
				//html += '<td><img src="/resources/' + fi.fiiFilePath + '" width="50"></td>';
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