<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/user/js/window/moveblock.js"></script>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.min.css"
	rel="stylesheet" />
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script
	src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>

<style>
.preView {
	position: absolute;
	height: 3em;
	width: 200px;
	margin-left: 82%;
	margin-right: 18%;
	margin-top: 1%;
}
</style>
<title>전시회 수정</title>
</head>
<body>
	<input type="hidden" id="uiNum">
	<input type="hidden" id="eiNum">
	<input type="hidden" id="giNum">
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
			<div id="pView" class="preView"></div>

			<div class="container">
				<div class="row mt-4">

					<div class="col-lg-3">

						<div class="info">


							<div class="phone" id="getExhibitionDivMenu">
								<h4>나의 전시회 목록</h4>
							</div>


							<div class="phone">
								<h4>갤러리명</h4>

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

							<div class="phone">
								<h4>대표 포스터사진</h4>

							</div>
							<div class="phone">
								<h4>전시회 설명</h4>

							</div>

						</div>
					</div>
					<div class="col-lg-8 mt-0 mt-lg-4">
						<div id="getExhibitionDivMenu" class="form-row">
							<div class="col-md-10 form-group">
								<select class="col-md-6 form-group"
									style="WIDTH: 300; HEIGHT: 28pt" onchange="getExhibition(this)"
									id="exhibition" name="exhibitionOption"></select>

							</div>

						</div>

						<div id="getExhibitionDivMenu" class="form-row">
							<div class="col-md-10 form-group">
								<select class="col-md-6 form-group"
									style="WIDTH: 300pt; HEIGHT: 28pt" id="giName" name="gallery"></select>

							</div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiName"
								placeholder="전시회명" />
							<div style="HEIGHT: 10pt"></div>
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
								onchange="changeImg(this)" />
							<div style="HEIGHT: 7pt"></div>
						</div>



						<!-- ckeditor -->
						<div class="form-group">
							<div id="editor">
								<textarea>내용을 입력하고 저장을 눌러주세요.</textarea>
							</div>
							<button onclick="save()">저장</button>
						</div>
						<textarea id="eiContent" style="display: none"></textarea>
						<button class="get-started-btn ml-auto" onclick="doUpdate()">전시회
							수정</button>
					</div>

				</div>
			</div>


		</section>
	</main>
	<script>
	var uiNum = ${userInfo.uiNum};
	console.log(uiNum);
	
	var editor;
	ClassicEditor
	.create( document.querySelector('#editor'),{
		removePlugins: ['Table', 'MediaEmbed'],
		ckfinder : {
			uploadUrl : '/exhibition-insert-editorimage'
		}
	 })
	.then(obj => {editor = obj;})
	.catch(error => {console.error(error);});
	
	function save(obj){
		console.log(obj);
		console.log(editor);
		console.log(editor.getData());
		var eiContent = editor.getData();
		document.querySelector('#eiContent').value = eiContent;
		console.log(document.querySelector('#eiContent'));
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
	if(eiCharge.value.trim().length>11){
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
				location.href='/';
			}
		}
	}
	var formData = new FormData();
	var eiNum = document.querySelector('#eiNum').value;	
	var uiNum = document.querySelector('#uiNum').value;
	var giNum = document.querySelector('#giName').value; //<option vallue = giNum>
	formData.append('eiNum',eiNum);
	formData.append('eiName',eiName.value);
	formData.append('eiArtist',eiArtist.value);
	formData.append('eiCharge',eiCharge.value);
	formData.append('eiStartDate',eiStartDate.value);
	formData.append('eiEndDate',eiEndDate.value);
	formData.append('eiStartTime',eiStartTime.value);
	formData.append('eiEndTime',eiEndTime.value);
	formData.append('eiContent',document.querySelector('#eiContent').value);
	formData.append('fileInfo.fiNum',document.querySelector('#fileInfo-fiNum').value);
	if(document.querySelector('#fiFile').files[0]){
		formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);	
	}
	formData.append('userInfo.uiNum',uiNum);
	formData.append('galleryInfo.giNum',giNum);
	xhr.send(formData);
}

window.onload = exhibitionOption();//유저가 등록한 전시회 목록
function exhibitionOption(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions-user?uiNum='+uiNum);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res =JSON.parse(xhr.responseText);
			var html = '<option value="">전시회를 선택하세요</option>';
			for(var exhibitionInfo of res){
				html += '<option value ="' + exhibitionInfo.eiNum+'" data-giNum="' + exhibitionInfo.galleryInfo.giNum+'">'+exhibitionInfo.eiName+'</option>';
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
		for(var key in res){
			if(document.querySelector('#'+key)){
				document.querySelector('#'+key).value=res[key];
				}
			}
		document.querySelector('#giName').value = res.galleryInfo['giNum'];
		document.querySelector('#fileInfo-fiNum').value = res['fileInfo']['fiNum'];
		document.querySelector('#uiNum').value = uiNum;
		document.querySelector('#giNum').value = res['galleryInfo']['giNum'];
		editor.setData(document.querySelector('#eiContent').value);
		document.querySelector('#pView').innerHTML = '<img id="preView" width="200" src="/resources/assets/img/exhibition/' + res.fileInfo.fiPath + '">';
		}
	getGalleyList();
	}
xhr.send();
}

function getGalleyList(){
//var giNum = document.querySelector('input[id="giNum"]').getAttribute('value');
var giNum = document.querySelector('#giNum').value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-lists');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var html ='';
			var res = JSON.parse(xhr.responseText);
			var html = '<option value=""></option>';
			for(var galleryInfo of res){			
				if(galleryInfo.giNum==giNum){
					html += '<option value ="' + galleryInfo.giNum+'" selected >'+galleryInfo.giName+'</option>';					
				}
				html += '<option value ="' + galleryInfo.giNum+'">'+galleryInfo.giName+'</option>';				
			}
			document.querySelector('#giName').innerHTML = html;
		}
	}
	xhr.send();
}

function changeImg(obj){ // change event
	if (obj.files && obj.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){		
		document.querySelector('#preView').src = e.target.result;		
	}
	reader.readAsDataURL(obj.files[0]);
	}
}




flatpickr('#eiStartTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 08,
	minuteIncrement: 10
});
flatpickr('#eiEndTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 18,
	minuteIncrement: 10
});
flatpickr('#giStartTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 08,
	minuteIncrement: 10
});
flatpickr('#giEndTime', {
	enableTime: true,
	noCalendar: true,
	time_24hr: true,
	dateFormat: "H:i",
	defaultHour: 18,
	minuteIncrement: 10
});
</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>