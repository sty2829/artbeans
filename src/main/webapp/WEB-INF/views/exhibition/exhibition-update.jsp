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
<input type = "hidden" id = "eiNum">
<input type = "hidden" id = "uiNum">
나의 전시회 목록 <select onchange="getExhibition(this)" id="exhibition" name="exhibitionOption" data-col="test">
           </select><br>
갤러리명 <input type ="text" id = "giName" readOnly><br>
전시회명 <input type="text" id="eiName"><br>
작가명 <input type="text" id="eiArtist"><br>
전시회 가격 <input type="number" id="eiCharge"><br>
전시회 시작일 <input type="date" id="eiStartDate"><br>
전시회 종료일 <input type="date" id="eiEndDate"><br>
전시회 시작시간 <input type="text" id="eiStartTime"><br>
전시회 종료시간 <input type="text" id="eiEndTime" ><br>
전시회 사진 변경 <input type="file" id="fiFile" onchange ="changeImg(this)"><br>
<div id="fiview"></div>
전시회 정보 <textarea  id="eiContent" placeholder="나중에 선생님이 주시면 변경"></textarea><br>
<button type="button" onclick="doUpdate()">전시회 수정 하기</button>
</div>
<script>
function doUpdate(){
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
	if(eiCharge.value.trim().length<2){
		alert('전시회 가격을 작성해주세요.');
		eiCharge.focus();
		return;
	}	
	var eiStartDate = document.querySelector('#eiStartDate');
	if(eiStartDate.value.trim().length<1){
		alert('전시회 시작일을 선택해주세요.');
		eiStartDate.focus();
		return;
	}	
	var eiEndDate = document.querySelector('#eiEndDate');
	if(eiEndDate.value.trim().length<1){
		alert('전시회 종료일을 선택해주세요.');
		eiEndDate.focus();
		return;
	}	
	var eiStartTime = document.querySelector('#eiStartTime');
	if(eiStartTime.value.trim().length<5){
		alert('전시회 시작 시간을 작성해주세요.');
		eiStartTime.focus();
		return;
	}
	
	var eiEndTime = document.querySelector('#eiEndTime');
	if(eiEndTime.value.trim().length<5){
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
	var giName = document.querySelector('#giName').value;
	var uiNum = 
	formData.append('eiNum',eiNum);
	formData.append('eiName',eiName);
	formData.append('eiArtist',eiArtist);
	formData.append('eiCharge',eiCharge);
	formData.append('eiStartDate',eiStartDate);
	formData.append('eiEndDate',eiEndDate);
	formData.append('eiStartTime',eiStartTime);
	formData.append('eiEndTime',eiEndTime);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('userInfo.uiNum',uiNum);
	formData.append('galleryInfo.giNum',giName);
	console.log(formData);
	xhr.send(formData);
}

window.onload = exhibitionOption();//유저가 등록한 전시회 목록
function exhibitionOption(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res =JSON.parse(xhr.responseText);
			var html = '<option value="">전시회를 선택하세요</option>';
			for(var exhibitionInfo of res){
				html += '<option value ="' + exhibitionInfo.eiNum+'">'+exhibitionInfo.eiName+'</option>';
			}
			document.querySelector('#exhibition').innerHTML = html;
		}
	}
	xhr.send();
}

function getExhibition(obj){ //전시회 선택시 입력정보 AJAX
var eiNum = obj.value;
var xhr = new XMLHttpRequest();
xhr.open('GET','/exhibition?eiNum='+eiNum);
xhr.onreadystatechange = function(){
	if(xhr.readyState==4 && xhr.status==200){
		var html = '';
		
		var res = JSON.parse(xhr.responseText);
		console.log(res);
		for(var key in res){
			if(document.querySelector('#'+key)){
				document.querySelector('#'+key).value=res[key];
				}
			}
		document.querySelector('#giName').value = res.galleryInfo.giName;
		document.querySelector('#fiview').innerHTML = '<img width="200" id="preview" src="/resources/assets/img/exhibition/' + res.fileInfo.fiPath + '">';
		}
	}
xhr.send();
}

function changeImg(obj){ // change event
	if (obj.files && obj.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
		
		document.querySelector('#preview').src = e.target.result;
		
	}
	reader.readAsDataURL(obj.files[0]);
	}
}
</script>
</body>
</html>