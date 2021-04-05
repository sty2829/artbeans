<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
</head>
<body>
전시회명 <input type="text" id="eiName">
작가명 <input type="text" id="eiArtist"><br>
전시회 가격 <input type="number" id="eiCharge"><br>
전시회 정보 <textarea  id="eiContent" placeholder="나중에 선생님이 주시면 변경"></textarea><br>
전시회 시작일 <input type="date" id="eiStartDate"><br>
전시회 종료일 <input type="date" id="eiEndDate"><br>
전시회 시작시간 <input type="time" id="eiStartTime"><br>
전시회 종료시간 <input type="time" id="eiEndTime" ><br>
신청자 성함 <input type="text" id="userInfo"><br>
신청자 갤러리 <select id="galleryInfo" onclick="getGallery()">
               <option value="">갤러리를 선택하세요</option>
               <option value="1" id="giNum">예술의전당</option>
               <option value="2" id="giNum">현대갤러리</option>
           </select>
<br> <button onclick="doInsert()">전시회 등록 신청하기</button>
       
<script>
function doInsert(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/exhibition-insert');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}		
	}
	var param = {
		   eiName : document.querySelector('#eiName').value,
		   eiArtist : document.querySelector('#eiArtist').value,
		   eiCharge : document.querySelector('#eiCharge').value,
		   eiContent : document.querySelector('#eiContent').value,
		   eiStartDate : document.querySelector('#eiStartDate').value,
		   eiEndDate : document.querySelector('#eiEndDate').value,
		   eiStartTime : document.querySelector('#eiStartTime').value,
		   eiEndTime : document.querySelector('#eiEndTime').value,
		   galleryInfo : {
			   
		   }
	}
	xhr.setRequestHeader('Content-Type','application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}

function getGallery(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/galleryinfos?giNum='${param.giNum});
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}
	}
	xhr.send();
}
</script> 
           
</body>
</html>