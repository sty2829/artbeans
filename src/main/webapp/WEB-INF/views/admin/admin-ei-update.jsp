<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!--<c:if test="${admin eq null}">
<script>
	alert('운영 관련 접근 불허');
	location.href='/views/login';
</script>
</c:if>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수정 페이지</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6ce9d8468a6bd79f89c359862923de3&libraries=services"></script>
<script src="/resources/user/js/map/addrsearch.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<script src="/resources/user/js/ckeditor/ckeditorSave.js"></script>
</head>
<body oncontextmenu="return false">
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">
				<div class="row mt-5">
					<div class="col-lg-4">
						<div class="info">
						
							
							<div class="address">
								<h4>전시회 번호</h4>
							</div>
							<div class="phone">
								<h4>전시회 상태값</h4>
							</div>
							<div class="phone" id="gallertySelectDivMenu">
								<h4>현재 갤러리</h4>
							</div>

							<div class="phone">
								<h4>전시회명</h4>
							</div>
							<div class="phone">
								<h4>작가명</h4>
							</div>
							<div class="phone">
								<h4>전시회 가격</h4>
							</div>
							<div class="phone">
								<h4>전시회 시작일</h4>
							</div>
							<div class="phone">
								<h4>전시회 종료일</h4>
							</div>
							<div class="phone">
								<h4>전시회 시작시간</h4>
							</div>
							<div class="phone">
								<h4>전시회 종료시간</h4>
							</div>
							
							<div class="phone" style="height:80px;">
								<h4>전시회 포스터사진</h4>

							</div>
							
							<div class="phone" >
								<h4>전시회 설명</h4>

							</div>
					
						</div>
					</div>

					<!-- 입력란 -->
					<div class="col-lg-8 mt-5 mt-lg-0">
						<div class="form-row">
							<div class="col-md-6 form-group">
								<!-- 나중에 변경 -->
								<input type="text" id="eiNum" class="form-control" readonly/>
								<div style="HEIGHT: 3pt"></div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col-md-6 form-group">
								<!-- 나중에 변경 -->
									<select class="col-md-6 form-group"
									style="WIDTH: 250pt; HEIGHT: 30pt" id="eiStatus"
									>
										<option value="0">0</option>
										<option value="1">1</option>
									</select>
							</div>
						</div>

						<div id="gallertySelectDiv" class="form-row">
							<div class="col-md-6 form-group">
								<select class="col-md-6 form-group"
									style="WIDTH: 250pt; HEIGHT: 30pt" id="gallery"
									name="galleryOption()"></select>
							</div>
							
						</div>
												
						<div class="form-group">
							<input type="text" class="form-control" id="eiName"
								placeholder="전시회명" />
							<div style="HEIGHT: 5pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiArtist"
								placeholder="작가명" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" id="eiCharge"
								placeholder="전시회 가격" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="date" class="form-control" id="eiStartDate" />
							<div style="HEIGHT: 10pt"></div>
						</div>

						<div class="form-group">
							<input type="date" class="form-control" id="eiEndDate" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiStartTime"
								placeholder="00:00" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiEndTime"
								placeholder="00:00" />
							<div style="HEIGHT: 8pt"></div>
						</div>
						
						<div class="form-group">
							<input type="hidden" id="fileInfo-fiNum"> <input
								type="file" class="form-control" id="fiFile"
								 /> 
							<div style="HEIGHT: 5pt"></div>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control"
								id="fileMemory" readonly/> <!-- 기존 파일 이름 보여주기 -->
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<textarea class="form-control" id="eiContent" rows="5"
								placeholder="전시회 설명"></textarea>
						</div>

						<input type="hidden" class="form-control" id="uiNum"
								placeholder="uiNum히든" />	
							
						<button class="get-started-btn ml-auto" onclick="doUpdate()">전시회 정보 수정 및 권한부여</button>
					</div>
				</div>
			</div>
		</section>
	</main>

	
	<script>
var getValue = getParameterByName("eiNum");
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


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
	
		
	var fileMemory=document.querySelector('#fiFile').files[0];	
	
	if(fileMemory==null){
		xhr.open('POST','/exhibition-admin-update') //ExhibitionController
	}else{
		xhr.open('POST','/exhibition-update') //ExhibitionController
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status ==200){
			if(xhr.responseText&& xhr.responseText!= null){
				alert('전시회 수정이 완료되었습니다.');
				location.href='/views/admin/admin-ei';
			}
		}
	}
	var formData = new FormData();

	formData.append('eiNum', document.querySelector('#eiNum').value);
	formData.append('eiStatus', document.querySelector('#eiStatus').value);
	
	if(fileMemory==null){
		formData.append('giNum', document.querySelector('select#gallery option:checked').value);
		formData.append('uiNum', document.querySelector('#uiNum').value);
	}else{
		formData.append('galleryInfo.giNum', document.querySelector('select#gallery option:checked').value);
		formData.append('userInfo.uiNum', document.querySelector('#uiNum').value);
	}
	
	formData.append('galleryInfo.giNum', document.querySelector('select#gallery option:checked').value);
	formData.append('eiName', document.querySelector('#eiName').value);
	formData.append('eiArtist', document.querySelector('#eiArtist').value);
	formData.append('eiCharge', document.querySelector('#eiCharge').value);
	formData.append('eiStartDate', document.querySelector('#eiStartDate').value);
	formData.append('eiEndDate', document.querySelector('#eiEndDate').value);
	formData.append('eiStartTime', document.querySelector('#eiStartTime').value);
	formData.append('eiEndTime', document.querySelector('#eiEndTime').value);
	
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('fileInfo.fiNum',document.querySelector('#fileInfo-fiNum').value);
	
	formData.append('eiContent', document.querySelector('#eiContent').value);
	
	
	
	xhr.send(formData);
}

function getOpenLoopCall(obj){
	return new Promise(function(resolve, reject){
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition?eiNum='+obj); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				let exhibition = JSON.parse(xhr.responseText);
				resolve(exhibition);
							
			}
		}
		xhr.send();
	})
}


function galleryOptionLoopCall() {
	return new Promise(function(resolve, reject){
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/Gallery-lists'); //GalleryController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let res = JSON.parse(xhr.responseText);
				resolve(res);
				
			}
		}
		xhr.send();
	})
}
	

window.addEventListener('load',async function(){

	let res=await galleryOptionLoopCall();
	let html = '<option value="">갤러리 선택</option>';
	for (let galleryInfo of res) {
		html += '<option value="' + galleryInfo.giNum + '">' + galleryInfo.giName + '</option>';
	}
	document.querySelector('#gallery').innerHTML = html;
	
	
	let exhibition=await getOpenLoopCall(getValue);
	document.getElementById('eiNum').value=exhibition.eiNum;
	document.getElementById('eiStatus').value=exhibition.eiStatus;
	document.getElementById('gallery').value=exhibition.galleryInfo.giNum;
	document.getElementById('eiName').value=exhibition.eiName;
	document.getElementById('eiArtist').value=exhibition.eiArtist;
	document.getElementById('eiCharge').value=exhibition.eiCharge;
	document.getElementById('eiStartDate').value=exhibition.eiStartDate;
	document.getElementById('eiEndDate').value=exhibition.eiEndDate;
	document.getElementById('eiStartTime').value=exhibition.eiStartTime;
	document.getElementById('eiEndTime').value=exhibition.eiEndTime;

	document.getElementById('fileMemory').value=exhibition.fileInfo.fiOriginalname;
	document.getElementById('eiContent').value=exhibition.eiContent;
	
	document.getElementById('uiNum').value=exhibition.userInfo.uiNum;
})


</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>