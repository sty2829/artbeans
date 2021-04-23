/**
 * 
 */

	
	
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
	xhr.open('GET','/getExhibition?uiNum='+uiNum);
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
		//document.querySelector('#giName').value = res.galleryInfo.giName;
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