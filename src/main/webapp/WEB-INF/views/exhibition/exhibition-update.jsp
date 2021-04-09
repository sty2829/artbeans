<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 수정</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
<body>
<input type = "hidden" id = "eiNum">
<input type = "hidden" id = "uiNum">
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">         
        </div>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">
        <div class="row mt-2">
          <div class="col-lg-4">
            <div class="info">
             <div class="phone"  id="getExhibitionDivMenu">
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
                <h4>전시회 시작일 </h4>
              </div>
              <div class="phone">
                <h4>전시회 종료일 </h4>
              </div>
              <div class="phone">
                <h4>전시회 시작시간 </h4>
              </div>
              <div class="phone">
                <h4>전시회 종료시간 </h4>
              </div>
              
               <div class="phone">
                <h4>전시회 포스터사진 </h4>
              </div>
               <div class="phone">
                <h4>전시회 설명 </h4>
              </div>
              
            </div>
          </div>
          <div class="col-lg-8 mt-3 mt-lg-4">
          <div id="getExhibitionDivMenu" class="form-row">
                <div class="col-md-6 form-group">
                  <select class="col-md-6 form-group" style="WIDTH: 300pt; HEIGHT: 30pt" onchange="getExhibition(this)" id="exhibition" name="exhibitionOption"></select>
                </div>
      	 </div>
      	 <div id="getExhibitionDivMenu" class="form-row">
                <div class="col-md-6 form-group">
                  <select class="col-md-6 form-group" style="WIDTH: 300pt; HEIGHT: 30pt" id="giName" name="gallery"></select>
                </div>
      	 </div>
        
          <div class="form-group">
                <input type="text" class="form-control" id="eiName" placeholder="전시회명" />
               <div style="HEIGHT: 10pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eiArtist" placeholder="작가명" />
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" id="eiCharge" placeholder="전시회 가격" />
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="date" class="form-control" id="eiStartDate" />
                <div style="HEIGHT: 10pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="date" class="form-control" id="eiEndDate"/>
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eiStartTime" placeholder="00:00" />
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="eiEndTime" placeholder="00:00" />
                <div style="HEIGHT: 8pt"></div> 
              </div>
              
              <div class="form-group">
              	<input type="hidden" id="fileInfo-fiNum">
                <input type="file" class="form-control" id="fiFile" onchange ="changeImg(this)"/> 
                <div style="HEIGHT: 10pt"></div>    
              </div>
              
           	 <div id="fiview"></div>
              
              <div class="form-group">
                <textarea class="form-control" id="eiContent" rows="5" placeholder="전시회 설명"></textarea>
              </div>
             
             <button class="get-started-btn ml-auto"  onclick="doUpdate()">전시회 수정</button>
          </div>
        </div>
        </div>
    </section>
  </main>
<!-- <div>

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
</div> -->
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
	formData.append('eiContent','test');
	formData.append('fileInfo.fiNum',document.querySelector('#fileInfo-fiNum').value);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile').files[0]);
	formData.append('userInfo.uiNum',uiNum);
	formData.append('galleryInfo.giNum',giNum);
	xhr.send(formData);
}

window.onload = exhibitionOption();//유저가 등록한 전시회 목록
function exhibitionOption(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-list');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
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
	getGalleyList();
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
		document.querySelector('#fileInfo-fiNum').value = res['fileInfo']['fiNum'];
		document.querySelector('#uiNum').value = res['userInfo']['uiNum'];
		//document.querySelector('#giNum').value = res['galleryInfo']['giNum'];
		
		//document.querySelector('#giName').value = res.galleryInfo.giName;
		document.querySelector('#getExhibitionDivMenu').innerHTML = '<img width="200" id="preview" src="/resources/assets/img/exhibition/' + res.fileInfo.fiPath + '">';
		}
	}
xhr.send();
}

function getGalleyList(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var html ='';
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html = '<option value=""></option>';
			for(var galleryInfo of res){
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
		document.querySelector('#preview').src = e.target.result;		
	}
	reader.readAsDataURL(obj.files[0]);
	}
}
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>