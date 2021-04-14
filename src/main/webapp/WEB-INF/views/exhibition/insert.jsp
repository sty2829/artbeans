<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>


</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>


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
                <h4>대표 포스터사진 </h4>
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
                <!-- 나중에 변경 -->
                  <input type="text" id="uiName" class="form-control" placeholder="나중에 신청자 성함 세션으로 받아서 픽스시키기"/>
                </div>                
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
                          <input type="text" id="giStartTime" placeholder="갤러리 오픈시간 00:00">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giEndTime" placeholder="갤러리 종료시간 00:00">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giHomepage" placeholder="갤러리 홈페이지">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giHoliday" placeholder="갤러리 휴일">
                  </div>
                  <div class="form-group">
                      <input type="text" id="giAddress" placeholder="갤러리 주소">
                      <!-- map 수정 -->
                      <!-- map 수정 -->
                  <button type="button" onclick="sample4_execDaumPostcode()" data-toggle="modal" data-target="#myModal" class="get-started-btn ml-auto">주소검색</button>


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-xl">
      <!-- Modal content-->
      <div class="modal-content">
      <div class="modal-header">
      <!-- 주소찾기 --> 
      <input type="hidden" id="sample4_postcode" >
      <input type="hidden" id="sample4_extraAddress">
      <input type="hidden" size="50px" id="sample4_roadAddress" placeholder="도로명주소">
      <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
      <span id="guide" style="color:#999;display:none"></span>
      <input type="hidden" size="40px" id="sample4_detailAddress" placeholder="상세주소">
      <!-- <button onclick="sample4_execDaumPostcode()" class="get-started-btn ml-auto">주소찾기</button>
       -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function sample4_execDaumPostcode() {
            var dOpen = new daum.Postcode({
                oncomplete: function(data) {
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = '';
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }
                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                    searhMap();
                   // dOpen.close();
                }
            }).open();
        }
    </script>
<!-- 주소로 맵 
      <input type="hidden" id="searhMapKey">-->
      <!-- <button onclick="searhMap()" class="get-started-btn ml-auto">주소검색</button> -->
      </div>
        <div class="modal-body">
          <!-- 모달 바디 -->
              <div id="map" style="width:100%;height:350px;"></div>
              
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6ce9d8468a6bd79f89c359862923de3&libraries=services"></script>
<script>
function searhMap(){
	var value = document.querySelector('#sample4_roadAddress').value;

	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(value, placesSearchCB); 
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		//추가
		var imageSrc = "/resources/assets/img/marker.png";
		imageSize = new kakao.maps.Size(30, 39), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);      
	    //추가
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x),
	        //추가
	        image: markerImage
	        //추가
	    });
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	        console.log(place.road_address_name);
	        document.querySelector('#giAddress').value = place.road_address_name;
	    });
	    
	}
}          

</script>
          <!-- 모달 바디 -->
        </div>
        <!-- 
        <div class="modal-footer">
          <p>지도에서 선택 후, esc를 눌러주세요</p>
        </div> -->
      </div>
      
    </div>
  </div>
                      <!-- map 수정 -->
                      <!-- map 수정 -->
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
              
              <!-- ckeditor 추가 테스트 중-->
              <div class="form-group" >
                <div id="editor">This is some sample content.</div>
                <button onclick="save()">저장</button>
              </div>
              
              <textarea id="eiContent" style=display:none></textarea>
              
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<script>
var editor;
ClassicEditor
.create( document.querySelector('#editor'),{
	ckfinder : {
		uploadUrl : '/upload/image'
	}
})
.then(obj => {editor = obj;})
.catch(error => {console.error(error);});

function save(){
	console.log(editor.getData());
	var eiContent = editor.getData();
	document.querySelector('#eiContent').innerHTML = eiContent;
	console.log(document.querySelector('#eiContent'));
}

/*
function load(){
	console.log(editor.setData('<p>123123123123123</p><figure class="image"><img src="/resources/다운로드 (2).jfif"></figure><p>1312312312342424252524</p><figure class="image"><img src="/resources/다운로드 (1).jfif"></figure>'))
}*/
</script>

               <!-- ckeditor 추가 테스트 중-->
               
              <!-- 
              <div class="form-group" >
                <textarea class="form-control" id="eiContent" rows="5" placeholder="전시회 설명"></textarea>
              </div>-->
              
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
	xhr.open('GET','/Gallery-lists'); //GalleryController
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