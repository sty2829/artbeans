<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

전시회명 <input type="text" id="eiName"><button onclick="checkExhibition()">중복확인</button><br>
작가명 <input type="text" id="eiArtist"><br>
전시회 가격 <input type="number" id="eiCharge"><br>
전시회 시작일 <input type="date" id="eiStartDate"><br>
전시회 종료일 <input type="date" id="eiEndDate"><br>
전시회 시작시간 <input type="text" id="eiStartTime"><br>
전시회 종료시간 <input type="text" id="eiEndTime" ><br>
전시회 정보 사진 <input type="file" id="fiFile"><br>
전시회 정보 <textarea  id="eiContent" placeholder="나중에 선생님이 주시면 변경"></textarea><br>

<button type="button" onclick="doUpdate()">전시회 수정 하기</button>

</div>

<script>

var eiNum = '${param.eiNum}';
function doUpdate(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/exhibition-update')
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status ==200){
			if(xhr.responseText&& xhr.responseText!= null){
				alert('전시회 수정이 완료되었습니다.');
				
			}
		}
	}
	var formData = new FormData();
	var eiName = document.querySelector('#eiName');
	var eiArtist = document.querySelector('#eiArtist');
	var eiCharge = document.querySelector('#eiCharge');
	var eiStartDate = document.querySelector('#eiStartDate');
	var eiEndDate = document.querySelector('#eiEndDate');
	var eiStartTime = document.querySelector('#eiStartTime');
	var eiEndTime = document.querySelector('#eiEndTime');	
	formData.append('eiNum',eiNum);
	formData.append('eiName',eiName);
	formData.append('eiArtist',eiArtist);
	formData.append('eiCharge',eiCharge);
	formData.append('eiStartDate',eiStartDate);
	formData.append('eiEndDate',eiEndDate);
	formData.append('eiStartTime',eiStartTime);
	formData.append('eiEndTime',eiEndTime);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('userInfo.uiNum',1); //임시 uiNum
	formData.append('galleryInfo.giNum',5);//galleryInfo.giNum['#giNum']);//임시 giNum
	xhr.send(formData);
}


function getExhibition(){
var xhr = new XMLHttpRequest();
xhr.open('GET','/exhibition?eiNum='+ eiNum);
xhr.onreadystatechange = function(){
	if(xhr.readyState==4 && xhr.status==200){
		var html = '';
		var res = JSON.parse(xhr.responseText);
		for(var key in res){
			if(document.querySelector('#'+key)){
				document.querySelector('#'+key).value=res[key];
			}
		}  	
	}
}
xhr.send();
}
window.onload = getExhibition ;
</script>
</body>
</html>