<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
</head>
<body>


<div>
<!-- UserInfo 유효형검사 X , 회원이 아니면 버튼 안보이게.-->
신청자 성함 <input type="text" id="uiName"><button onclick="checkUser()">회원확인</button><br>
</div>
<div>
<!-- GalleryInfo 유효성검사 갤러리 선택안하면 등록 못하게-->
신청자 갤러리 <select id="gallery" onclick="getGallery()">
           </select>
           <br>
</div>
<div>
<!-- ExhibitionInfo 유효성검사 null만-->
전시회명 <input type="text" id="eiName"><br>
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



<script>
function checkUser(){
	var uiName = document.querySelector('#uiName');
	if(uiName.value.trim().length<2){
		alert('신청자 성함을 2글자 이상 작성해주세요.');
		uiName.focus();
		return;
	}
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/userInfo'); //UserInfoController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			for(var userInfo of res){
				if(userInfo.uiName ==  uiName){
					alert('확인 되었습니다.');
				}else{
					alert('신청자 성함을 다시 확인해주세요.');
					uiName.focus();
					return;
				}
			}
		}		
	}
	xhr.send();
}

function getGallery(){ 
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //GalleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<option value="">갤러리를 선택하세요</option>';
			for(var galleryInfo of res){
				// 선택해도 계속 실행만 됨 물어보기
				html += '<option value="' + galleryInfo.giNum + ' selected">' + galleryInfo.giName + '</option>';
			}
			document.querySelector('#gallery').innerHTML = html;
		}		
	}
	xhr.send();
}

function doInsert(){
	//유효성 검사, 회원확인 안 누르면 확인누르게 해야됨.
	var uiName = document.querySelector('#uiName');
	if(uiName.value.trim().length<2){
		alert('신청자 성함을 2글자 이상 작성해주세요.');
		uiName.focus();
		return;
	}
	
	var gallery = document.querySelector('#gallery');
	if(gallery.value.trim().length<2){
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
	xhr.open('POST','/exhibition-insert'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}		
	}
	var formData = new FormData();
	// 값 맞는지 확인하기
	formData.append('eiName',eiName.value);
	formData.append('eiArtist',eiArtist.value);
	formData.append('eiCharge',eiCharge.value);
	formData.append('eiStartDate',eiStartDate.value);
	formData.append('eiEndDate',eiEndDate.value);
	formData.append('eiStartTime',eiStartTime.value);
	formData.append('eiEndTime',eiEndTime.value);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('userInfo.uiNum',userInfo.uiNum);
	formData.append('galleryInfo.giNum',galleryInfo.giNum['#giNum']);
	formData.append('userInfo.uiNum',document.querySelector('#uiNum').value);
	formData.append('galleryInfo.giNum',document.querySelector('#giNum').value);
	xhr.send(formData);
}


</script>
           
</body>
</html>