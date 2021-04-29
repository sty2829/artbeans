// 유저 리뷰 세이브 JS
ClassicEditor
.create( document.querySelector('#rviContent'),{
	ckfinder : {
		uploadUrl : '/exhibition-insert-editorimage',
		height: 250
	}
 })
.then(obj => {editor = obj;})
.catch(error => {console.error(error);});

function saveReview(){
	var fiFile = document.querySelector('#fiFile');
	var rviTitle = document.querySelector('#rviTitle');
	var tiNum = document.querySelector('#tiNum');
	
	var formData = new FormData();
	formData.append('fileInfo.fiFile', fiFile.files[0]);
	formData.append('rviTitle', rviTitle.value);
	formData.append('rviContent', editor.getData());
	formData.append('ticketInfo.tiNum', tiNum.value);
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/review");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('리뷰등록에 성공하였습니다.');
				location.href = '/views/user/review/review-info';
			}else{
				alert('리뷰등록에 실패하였습니다');
			}
		}
	}
	
	xhr.send(formData);
}

function changeImg(obj){
	if(obj.files && obj.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			document.querySelector('#fiPath').src = e.target.result;
		}
		reader.readAsDataURL(obj.files[0]);
	}
}