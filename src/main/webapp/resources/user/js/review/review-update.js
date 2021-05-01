// 유저 리뷰 업데이트 JS
var editor;
ClassicEditor
.create( document.querySelector('#rviContent'),{
	ckfinder : {
		uploadUrl : '/exhibition-insert-editorimage',
	}
 })
.then(obj => {editor = obj;})
.catch(error => {console.error(error);});

function getReview(){
	var rviNum = document.querySelector('#rviNum');
	var xhr = new XMLHttpRequest();
	xhr.open('GET', "/review/" + rviNum.value);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			for(var key in res){
				var obj = document.querySelector('#' + key);
				if(!obj){
					continue;
				}
				if(obj.id == 'fiPath'){
					obj.src = '/upload/' + res[key];
					continue;
				}
				if(obj.id == 'rviContent'){
					editor.data.set(res[key]);
				}
				obj.value = res[key];
			}
		}
	}
	
	xhr.send();
}

function updateReview(){
	var fiFile = document.querySelector('#fiFile');
	var rviTitle = document.querySelector('#rviTitle');
	var fiNum = document.querySelector('#fiNum');
	var tiNum = document.querySelector('#tiNum');
	
	var formData = new FormData();
	if(fiFile.files[0]){
		formData.append('fileInfo.fiFile', fiFile.files[0]);	
	}
	formData.append('rviNum', rviNum.value);
	formData.append('rviTitle', rviTitle.value);
	formData.append('rviContent', editor.getData());
	formData.append('ticketInfo.tiNum', tiNum.value);
	formData.append('fileInfo.fiNum', fiNum.value);
	
	
	var xhr = new XMLHttpRequest();
	xhr.open('PATCH', "/review");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('리뷰수정에 성공하였습니다.');
				location.href = '/views/user/review/review-info';
			}else{
				alert('리뷰수정에 실패하였습니다');
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
window.addEventListener('load', getReview);