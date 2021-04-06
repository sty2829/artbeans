<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
</head>
<body>

<form method="POST" enctype="multipart/form-data" action="/exhibition-insert">

<div>
<!-- UserInfo 유효형검사 X , 회원이 아니면 버튼 안보이게.-->
신청자 성함 <input type="text" id="uiNum"><button onclick="checkUser()">회원확인</button><br>
</div>
<div>
<!-- GalleryInfo 유효성검사 갤러리 선택안하면 등록 못하게-->
신청자 갤러리 <select id="gallery" onclick="getGallery()">
               <option value="">갤러리를 선택하세요</option>
               <option value="1" id="giNum">예술의전당</option>
               <option value="2" id="giNum">현대갤러리</option>
               <option value="3" id="giNum">아트갤러리</option>
           </select>
           <br>
</div>
<div>
<!-- ExhibitionInfo 유효성검사 null만 (전시회명은 중복확인)-->
전시회명 <input type="text" id="eiName"><button onclick="checkExhibition()">중복확인</button><br>
작가명 <input type="text" id="eiArtist"><br>
전시회 가격 <input type="number" id="eiCharge"><br>
전시회 시작일 <input type="date" id="eiStartDate"><br>
전시회 종료일 <input type="date" id="eiEndDate"><br>
전시회 시작시간 <input type="text" id="eiStartTime"><br>
전시회 종료시간 <input type="text" id="eiEndTime" ><br>
</div>
<!-- FileInfo 유효성검사 없음 -->

<div>
전시회 정보 사진 <input type="file" id="fiFile"><br>
전시회 정보 <textarea  id="eiContent" placeholder="나중에 선생님이 주시면 변경"></textarea><br>
</div>


<button onclick="doInsert()">전시회 등록 신청하기</button>
</form>


<script>

function checkExhibition(){ //ExhibitionControoler
	var gallery = document.querySelector('#gallery');
	var giNum = document.querySelectorAll('#giNum:selected');
	if(giNum.length==0){
		alert('신청자 갤러리를 선택해주세요.');
		gallery.focus();
		return;
	}
}

function doInsert(){
	var eiName = document.querySelector('#eiName').value;
	if(eiName.trim().length<1){
		alert('전시회 이름을 1글자 이상 작성해주세요.');
		eiName.focus();
		return;
	}
	
	var eiArtist = document.querySelector('#eiArtist').value;
	if(eiArtist.trim().length<1){
		alert('전시회 작가명을 1글자 이상 작성해주세요.');
		eiArtist.focus();
		return;
	}
	
	var eiCharge = document.querySelector('#eiCharge').value;
	if(eiArtist.trim().length<2){
		alert('전시회 가격을 작성해주세요.');
		eiCharge.focus();
		return;
	}
	
	var eiStartDate = document.querySelector('#eiStartDate').value;
	if(eiArtist.trim().length<1){
		alert('전시회 시작일을 선택해주세요.');
		eiStartDate.focus();
		return;
	}
	
	var eiEndDate = document.querySelector('#eiEndDate').value;
	if(eiArtist.trim().length<1){
		alert('전시회 종료일을 선택해주세요.');
		eiEndDate.focus();
		return;
	}
	
	var eiStartTime = document.querySelector('#eiStartTime').value;
	if(eiArtist.trim().length<6){
		alert('전시회 시작 시간을 작성해주세요.');
		eiStartTime.focus();
		return;
	}
	
	var eiEndTime = document.querySelector('#eiEndTime').value;
	if(eiArtist.trim().length<6){
		alert('전시회 종료 시간을 작성해주세요.');
		eiEndTime.focus();
		return;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/exhibition-insert'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}		
	}
	var formData = new FormData();
	formData.append('eiName',eiName);
	formData.append('eiArtist',eiArtist);
	formData.append('eiCharge',eiCharge);
	formData.append('eiStartDate',eiStartDate);
	formData.append('eiEndDate',eiEndDate);
	formData.append('eiStartTime',eiStartTime);
	formData.append('eiEndTime',eiEndTime);
	formData.append('fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('userInfo',userInfo.uiNum['#uiNum']);
	formData.append('galleryInfo',galleryInfo.giNum['#giNum']);
	xhr.send(formData);
}

function getGallery(){ 
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/galleryinfos?giNum='${param.giNum}); //GalleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			
		}
	}
	xhr.send();
}
</script>
           
</body>
</html>