/**
 * 
 */
//갤러리 옵션
window.onload = galleryOption;


function galleryOption(){ 
    document.querySelector('#uiName').value = uiName;    
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
console.log(document.querySelector('#fiFile1').value);

	var giName = document.querySelector('#giName');
	if(giName.value.trim().length<1 || giName.value.trim().length>15){
		alert('갤러리 이름을 15글자이하로 작성해주세요.');
		giName.focus();
		return;
	}
	
	var giRphoneNumber = document.querySelector('#giRphoneNumber');
	if( giRphoneNumber.value.trim().length<7 || giRphoneNumber.value.trim().length>12){
		alert('갤러리 전화번호를 정확하게 작성해주세요.');
		giRphoneNumber.focus();
		return;
	}
	
	var giStartTime = document.querySelector('#giStartTime');
	if(giStartTime.value.trim().length<5 || giStartTime.value.trim().length>5){
		alert('갤러리 시작 시간을 정확하게 작성해주세요.');
		giStartTime.focus();
		return;
	}
	
	var giEndTime = document.querySelector('#giEndTime');
	if(giEndTime.value.trim().length<5 || giEndTime.value.trim().length>5){
		alert('갤러리 종료 시간을 정확하게 선택해주세요.');
		giEndTime.focus();
		return;
	}
	
	var giAddress = document.querySelector('#giAddress');
	if(giAddress.value.trim().length<1){
		alert('갤러리 주소를 검색해주세요.');
		giAddress.focus();
		return;
	}
	
	var giHomepage = document.querySelector('#giHomepage');
	//console.log(giHomepage);
	if(giHomepage.value.trim().length<1){
		giHomepage.value = '없음';
	}
	
	var giHoliday = document.querySelector('#giHoliday');
	//console.log(giHoliday);
	if(giHoliday.value.trim().length<1){
		giHoliday.value = '없음';
	}
	
	var fiFile = document.querySelector('#fiFile1')
    if(fiFile.value.trim().length<1){
        alert('갤러리 이미지를 선택해주세요.');
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
	formData.append('giHomepage',giHomepage.value);
	formData.append('giHoliday',giHoliday.value);
	formData.append('giAddress',giAddress.value);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile1').files[0]);	
	xhr.send(formData);
}

function doInsert(){	
	var gallery = document.querySelector('#gallery');
	if(gallery.value.trim().length<1){
		alert('갤러리를 선택해주세요.');
		gallery.focus();
		return;
	}
	var eiName = document.querySelector('#eiName');
	if(eiName.value.trim().length<1 || eiName.value.trim().length>40){
		alert('전시회 이름을 40자 이하로 작성해주세요.');
		eiName.focus();
		return;
	}
	var eiArtist = document.querySelector('#eiArtist');
	if(eiArtist.value.trim().length<1 || eiArtist.value.trim().length>15){
		alert('전시회 작가명을 15자 이하로 작성해주세요.');
		eiArtist.focus();
		return;
	}
	var eiCharge = document.querySelector('#eiCharge');
	if(eiCharge.value.trim().length<2 || eiCharge.value.trim().length>11){
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
	if(eiStartTime.value.trim().length<5 || eiStartTime.value.trim().length>5){
		alert('전시회 시작 시간을 정확하게 작성해주세요.');
		eiStartTime.focus();
		return;
	}
	var eiEndTime = document.querySelector('#eiEndTime');
	if(eiEndTime.value.trim().length<5 || eiEndTime.value.trim().length>5){
		alert('전시회 종료 시간을 정확하게 작성해주세요.');
		eiEndTime.focus();
		return;
	}
	var fiFile2 = document.querySelector('#fiFile2')
    if(fiFile2.value.trim().length<1){
        alert('전시회 대표 포스터 사진을 선택해주세요.');
        return;
    }
	var eiContent = document.querySelector('#eiContent');
	if(eiContent.value.trim().length<1){
		alert('전시회 설명을 작성해주세요.');
		eiContent.focus();
		return;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/exhibition-insert'); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			if(xhr.responseText>0){
				alert('전시회 등록 성공');
				window.onbeforeunload = false;
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
	formData.append('eiContent',document.querySelector('#eiContent').value);
	formData.append('userInfo.uiNum',uiNum);
	formData.append('fileInfo.fiFile',document.querySelector('#fiFile2').files[0]);	
	formData.append('galleryInfo.giNum',document.querySelector('select#gallery option:checked').value);
	xhr.send(formData);
}