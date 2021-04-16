/**
 * 
 */
//갤러리 옵션

galleryOption()
getOpen();

//get 주소 가져오기
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var getValue = getParameterByName("eiNum");
getValue=Number(getValue);


function galleryOption() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/Gallery-lists'); //GalleryController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			var html = '<option value="">갤러리 선택</option>';
			for (var galleryInfo of res) {
				html += '<option value="' + galleryInfo.giNum + '">' + galleryInfo.giName + '</option>';
			}
			document.querySelector('#gallery').innerHTML = html;
		}
	}
	xhr.send();
}

function getOpen() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			for(exhibition of res.data){
				if(exhibition.eiNum==getValue){
					console.log(exhibition);
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
					document.getElementById('eiContent').value=exhibition.eiContent;
				}
			}
		}
	}
	xhr.send();
}

function checkUser() {
	var uiName = document.querySelector('#uiName');
	if (uiName.value.trim().length < 2) {
		alert('신청자 성함을 2글자 이상 작성해주세요.');
		uiName.focus();
		return;
	}
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/userInfo'); //UserInfoController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			for (var userInfo of res) {
				if (userInfo.uiName == uiName) {
					alert('확인 되었습니다.');
				} else {
					alert('신청자 성함을 다시 확인해주세요.');
					uiName.focus();
					return;
				}
			}
		}
	}
	xhr.send();
}


function doInsert() {
	//유효성 검사, 회원확인 안 누르면 확인누르게 해야됨.
	var uiName = document.querySelector('#uiName');
	if (uiName.value.trim().length < 2) {
		alert('신청자 성함을 2글자 이상 작성해주세요.');
		uiName.focus();
		return;
	}

	var gallery = document.querySelector('#gallery');
	if (gallery.value.trim().length < 1) {
		alert('갤러리를 선택해주세요.');
		gallery.focus();
		return;
	}

	var eiName = document.querySelector('#eiName');
	if (eiName.value.trim().length < 1) {
		alert('전시회 이름을 1글자 이상 작성해주세요.');
		eiName.focus();
		return;
	}

	var eiArtist = document.querySelector('#eiArtist');
	if (eiArtist.value.trim().length < 1) {
		alert('전시회 작가명을 1글자 이상 작성해주세요.');
		eiArtist.focus();
		return;
	}

	var eiCharge = document.querySelector('#eiCharge');
	if (eiCharge.value.trim().length < 2) {
		alert('전시회 가격을 작성해주세요.');
		eiCharge.focus();
		return;
	}

	var eiStartDate = document.querySelector('#eiStartDate');
	if (eiStartDate.value.trim().length < 1) {
		alert('전시회 시작일을 선택해주세요.');
		eiStartDate.focus();
		return;
	}

	var eiEndDate = document.querySelector('#eiEndDate');
	if (eiEndDate.value.trim().length < 1) {
		alert('전시회 종료일을 선택해주세요.');
		eiEndDate.focus();
		return;
	}

	var eiStartTime = document.querySelector('#eiStartTime');
	if (eiStartTime.value.trim().length < 5) {
		alert('전시회 시작 시간을 작성해주세요.');
		eiStartTime.focus();
		return;
	}

	var eiEndTime = document.querySelector('#eiEndTime');
	if (eiEndTime.value.trim().length < 5) {
		alert('전시회 종료 시간을 작성해주세요.');
		eiEndTime.focus();
		return;
	}

	var eiContent = document.querySelector('#eiContent');
	if (eiContent.value.trim().length < 1) {
		alert('전시회 설명을 작성해주세요.');
		eiContent.focus();
		return;
	}

	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/exhibition-insert'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			if (xhr.responseText > 0) {
				alert('전시회 등록 성공');
				window.onbeforeunload = false;
				location.href = '/';
			}
		}
	}
	var formData = new FormData();
	formData.append('eiName', eiName.value);
	formData.append('eiArtist', eiArtist.value);
	formData.append('eiCharge', eiCharge.value);
	formData.append('eiStartDate', eiStartDate.value);
	formData.append('eiEndDate', eiEndDate.value);
	formData.append('eiStartTime', eiStartTime.value);
	formData.append('eiEndTime', eiEndTime.value);
	formData.append('eiContent', document.querySelector('#eiContent').value); //나중에 유효성검사 만들기
	formData.append('userInfo.uiNum', 8); //임시 값
	formData.append('fileInfo.fiFile', document.querySelector('#fiFile2').files[0]);
	formData.append('galleryInfo.giNum', document.querySelector('select#gallery option:checked').value);
	xhr.send(formData);
}