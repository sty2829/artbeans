<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>


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
        <div class="row mt-5">
          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <h4>신청자 성함</h4>               
              </div>
              <div class="phone"  id="gallertySelectDivMenu">
                <h4>신청자 갤러리</h4>
              </div>
             
              <!-- 갤러리 등록 -->
              <div id="galleryInsertDivMenu" style="display:none" class="phone">
                  <div class="address">
                      <h4>갤러리명</h4>
                      <div style="HEIGHT: 8pt"></div>              
                  </div>
                  <div class="address">
                      <h4>갤러리 전화번호</h4>   
                      <div style="HEIGHT: 8pt"></div>             
                  </div>
                  <div class="address">
                      <h4>갤러리 오픈시간</h4>            
                      <div style="HEIGHT: 10pt"></div>    
                  </div>
                  <div class="address">
                      <h4>갤러리 종료시간</h4>            
                      <div style="HEIGHT: 15pt"></div>    
                  </div>
                  <div class="address">
                      <h4>갤러리 홈페이지</h4>            
                      <div style="HEIGHT: 10pt"></div>    
                  </div>
                  <div class="address">
                      <h4>갤러리 휴일</h4>               
                      <div style="HEIGHT: 10pt"></div> 
                  </div>
                  <div class="address">
                      <h4>갤러리 주소</h4>               
                      <div style="HEIGHT: 10pt"></div> 
                  </div>
                  <div class="address">
                      <h4>갤러리 이미지</h4>   
                      <div style="HEIGHT: 30pt"></div>             
                  </div>
              
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
          
          <!-- 입력란 -->
          <div class="col-lg-8 mt-5 mt-lg-0">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" id="uiName" class="form-control" placeholder="신청자 성함"/>
                </div>
                <button class="get-started-btn ml-auto" style="WIDTH: 150pt; HEIGHT: 30pt" onclick="checkUser()">회원확인</button>
              </div>
              
              <div id="gallertySelectDiv" class="form-row">
                <div class="col-md-6 form-group">
                  <select class="col-md-6 form-group" style="WIDTH: 250pt; HEIGHT: 30pt" id="gallery" name="galleryOption()"></select>
                </div>
                <button class="get-started-btn ml-auto" style="WIDTH: 150pt; HEIGHT: 30pt" onclick="showGalleryDiv()">갤러리 등록하기</button>
              </div>
              
               
              <!-- 갤러리 등록 -->
              <div id="galleryInsertDiv" style="display:none">
                  <div class="form-group">
                      <input type="text" id="giName" placeholder="갤러리명">
                  </div>
                  <div class="form-group">
                      <input type="number" id="giRphoneNumber" placeholder="갤러리 전화번호">
                  </div>
                  <div class="form-group">
                          <input type="text" id="giStartTime" placeholder="갤러리 오픈시간">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giEndTime" placeholder="갤러리 종료시간">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giHomepage" placeholder="갤러리 홈페이지">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giHoliday" placeholder="갤러리 휴일">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giAddress" placeholder="갤러리 주소"> 
                      <button class="get-started-btn ml-auto" onclick="searhMap()">주소검색</button>
                  </div>
                  <div class="form-group">
                      <input type="file" id="fiFile1">
                  </div>
                  <div class="form-group">
                      <button class="get-started-btn ml-auto" style="WIDTH: 70pt; HEIGHT: 30pt" onclick="insertGallery()">등록</button>
                      <button class="get-started-btn ml-auto" style="WIDTH: 70pt; HEIGHT: 30pt" onclick="showGalleryDiv()">취소</button>
                  </div>
              </div>
              <!-- 갤러리 등록 -->
              
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
                <input type="file" class="form-control" id="fiFile2" />                
                <div style="HEIGHT: 10pt"></div>    
              </div>
              
              <div class="form-group">
                <textarea class="form-control" id="eiContent" rows="5" placeholder="전시회 설명"></textarea>
              </div>
             
             <button class="get-started-btn ml-auto" onclick="doInsert()" >전시회등록 신청</button>
          </div>
        </div>
      </div>
    </section>
  </main>


<script>
window.onload = galleryOption();
	
function galleryOption(){ 
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/Gallery-list'); //GalleryController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '<option value="">갤러리 선택</option>';
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

function searchMap(){
	var html;
	html += '<div class="modal" tabindex="-1">';
	html += '<div class="modal-dialog">';
	html += '<div class="modal-content">';
	html += '<div class="modal-header">';
	html += ' <h5 class="modal-title">Modal title</h5>';
	html += ' <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
	html += ' <span aria-hidden="true">&times;</span></button></div>';
	html += ' <div class="modal-body">';
	html += '<p>Modal body text goes here.</p></div>';
	html += '<div class="modal-footer">';
	html += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>';
	html += ' <button type="button" class="btn btn-primary">Save changes</button>';
	html += '</div></div></div></div>';
	
	
	
	
}


function showGalleryDiv(){
	var dis = document.querySelector('#gallertySelectDiv').style.display;
	var dis = document.querySelector('#gallertySelectDivMenu').style.display;
	if(dis){
		document.querySelector('#gallertySelectDiv').style.display = '';
		document.querySelector('#galleryInsertDiv').style.display = 'none';
		document.querySelector('#gallertySelectDivMenu').style.display = '';
		document.querySelector('#galleryInsertDivMenu').style.display = 'none';
	}else{
		document.querySelector('#gallertySelectDiv').style.display = 'none';
		document.querySelector('#galleryInsertDiv').style.display = '';
		document.querySelector('#gallertySelectDivMenu').style.display = 'none';
		document.querySelector('#galleryInsertDivMenu').style.display = '';
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

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>