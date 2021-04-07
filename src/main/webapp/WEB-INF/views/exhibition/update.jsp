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
	
	var uiName = document.querySelector('#uiName');
	if(uiName.value.trim().length<2){
		alert('신청자 성함을 2글자 이상 작성해주세요.');
		uiName.focus();
		return;
	}
	
	var gallery = document.querySelector('#gallery');
	if(gallery.value.trim().length<1){
		alert('갤러리를 선택해주세요.');
		gallery.focus();
		return;
	}
	
	var eiName = document.querySelector('#eiName');
	if(eiName.value.trim().length<1){
		alert('전시회 이름을 1글자 이상 작성해주세요.');
		eiName.focus();
		return;
	}
	
	var eiArtist = document.querySelector('#eiArtist');
	if(eiArtist.value.trim().length<1){
		alert('전시회 작가명을 1글자 이상 작성해주세요.');
		eiArtist.focus();
		return;
	}
	
	var eiCharge = document.querySelector('#eiCharge');
	if(eiArtist.value.trim().length<2){
		alert('전시회 가격을 작성해주세요.');
		eiCharge.focus();
		return;
	}
	
	var eiStartDate = document.querySelector('#eiStartDate');
	if(eiArtist.value.trim().length<1){
		alert('전시회 시작일을 선택해주세요.');
		eiStartDate.focus();
		return;
	}
	
	var eiEndDate = document.querySelector('#eiEndDate');
	if(eiArtist.value.trim().length<1){
		alert('전시회 종료일을 선택해주세요.');
		eiEndDate.focus();
		return;
	}
	
	var eiStartTime = document.querySelector('#eiStartTime');
	if(eiArtist.value.trim().length<6){
		alert('전시회 시작 시간을 작성해주세요.');
		eiStartTime.focus();
		return;
	}
	
	var eiEndTime = document.querySelector('#eiEndTime');
	if(eiArtist.value.trim().length<6){
		alert('전시회 종료 시간을 작성해주세요.');
		eiEndTime.focus();
		return;
	}
	
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
	formData.append('userInfo.uiNum',8); //임시 uiNum
	formData.append('galleryInfo.giNum',1);//galleryInfo.giNum['#giNum']);//임시 giNum
	xhr.send(formData);
}
function getExhibition(){
var xhr = new XMLHttpRequest();
xhr.open('GET','/exhibition?eiNum='+ eiNum);
xhr.onreadystatechange = function(){
	if(xhr.readyState==4 && xhr.status==200){
		var html = '';
		console.log(xhr.responseText);
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
<%@include file ="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>