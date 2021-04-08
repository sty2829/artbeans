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
<!-- UserInfo , 회원이 아니면 버튼 안보이게. 회원확인 안하면 등록 안되게.-->
신청자 성함 <input type="text" id="uiName"><button onclick="checkUser()">회원확인</button><br>
</div>
<div id="gallertySelectDiv">

<!-- GalleryInfo 유효성검사 갤러리 선택안하면 등록 못하게, 갤러리 없으면 등록하게-->
신청자 갤러리 <select id="gallery" name="galleryOption()" data-col="test">
           </select>
           <button onclick="showGalleryDiv()">갤러리 등록하기</button>
</div>

<div id="galleryInsertDiv" style="display:none">
<input type="text" id="giName" placeholder="갤러리명"><br>
<input type="number" id="giRphoneNumber" placeholder="갤러리 전화번호"><br>
<input type="text" id="giStartTime" placeholder="갤러리 오픈시간"><br>
<input type="text" id="giEndTime" placeholder="갤러리 종료시간"><br>
<input type="text" id="giHomepage" placeholder="갤러리 홈페이지"><br>
<input type="text" id="giHoliday" placeholder="갤러리 휴일"><br>
<input type="text" id="giAddress" placeholder="갤러리 주소"><br>
<input type="file" id="fiFile1"><br>
<button onclick="insertGallery()">갤러리 등록</button>
<button onclick="showGalleryDiv()">취소</button>
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
전시회 정보 사진 <input type="file" id="fiFile2"><br>
전시회 정보 <textarea  id="eiContent" placeholder="나중에 선생님이 주시면 변경"></textarea><br>
</div>
<button onclick="doInsert()">전시회 등록 신청하기</button>

<script>
window.onload = galleryOption();
	
function galleryOption(){ 
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //GalleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<option value="">갤러리를 선택하세요</option>';
			for(var galleryInfo of res){
				html += '<option value="' + galleryInfo.giNum + '">' + galleryInfo.giName + '</option>';
			}
			document.querySelector('#gallery').innerHTML = html;
		}		
	}
	xhr.send();
}

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

function showGalleryDiv(){
	var dis = document.querySelector('#gallertySelectDiv').style.display;
	if(dis){
		document.querySelector('#gallertySelectDiv').style.display = '';
		document.querySelector('#galleryInsertDiv').style.display = 'none';
	}else{
		document.querySelector('#gallertySelectDiv').style.display = 'none';
		document.querySelector('#galleryInsertDiv').style.display = '';
	}
}

function insertGallery(){
	var giName = document.querySelector('#giName');
	if(giName.value.trim().length<1){
		alert('갤러리 이름을 1글자 이상 작성해주세요.');
		giName.focus();
		return;
	}
	
	var giRphoneNumber = document.querySelector('#giRphoneNumber');
	if(giRphoneNumber.value.trim().length<9){
		alert('갤러리 전화번호를 작성해주세요.');
		giRphoneNumber.focus();
		return;
	}
	
	var giStartTime = document.querySelector('#giStartTime');
	if(giStartTime.value.trim().length<4){
		alert('갤러리 시작 시간을 작성해주세요.');
		giStartTime.focus();
		return;
	}
	
	var giEndTime = document.querySelector('#giEndTime');
	if(giEndTime.value.trim().length<4){
		alert('갤러리 종료 시간을 선택해주세요.');
		giEndTime.focus();
		return;
	}
	
	var giAddress = document.querySelector('#giAddress');
	if(giAddress.value.trim().length<1){
		alert('갤러리 주소를 작성해주세요.');
		giAddress.focus();
		return;
	}
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/gallery'); //GalleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			if(xhr.responseText>0){
				alert('갤러리 등록 성공');
				galleryOption();
				showGalleryDiv();
			}
		}		
	}
	var formData = new FormData();
	formData.append('giName',giName.value);
	formData.append('giRphoneNumber',giRphoneNumber.value);
	formData.append('giStartTime',giStartTime.value);
	formData.append('giEndTime',giEndTime.value);
	formData.append('giHomepage',document.querySelector('#giHomepage').value);
	formData.append('giHoliday',document.querySelector('#giHoliday').value);
	formData.append('giAddress',giAddress.value);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile1').files[0]);	
	xhr.send(formData);
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
	xhr.open('POST','/exhibition-insert'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			if(xhr.responseText>0){
				alert('전시회 등록 성공');
				location.href='/';
			}
		}		
	}	
	var formData = new FormData();
	formData.append('eiName',eiName.value);
	formData.append('eiArtist',eiArtist.value);
	formData.append('eiCharge',eiCharge.value);
	formData.append('eiStartDate',eiStartDate.value);
	formData.append('eiEndDate',eiEndDate.value);
	formData.append('eiStartTime',eiStartTime.value);
	formData.append('eiEndTime',eiEndTime.value);
	formData.append('eiContent',document.querySelector('#eiContent').value); //나중에 유효성검사 만들기
	formData.append('userInfo.uiNum',8); //임시 값
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile2').files[0]);	
	formData.append('galleryInfo.giNum',document.querySelector('select#gallery option:checked').value);
	xhr.send(formData);
}

</script>
           
</body>
</html>