// 리뷰 상세  JS
function getReview(){
	var rviNum = document.querySelector('#rviNum');
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/' + rviNum.value );
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			var cols = document.querySelectorAll('[data-col]');
			for(var col of cols){
				var key = col.getAttribute('data-col');
				if(key === 'fiPath'){
					col.style = 'background-image: url(\'/upload/' + res[key] + '\');'
				}else{
					col.innerHTML = res[key];	
				}
				
			}
		}
	}
	xhr.send();
}
const size = 5;
function getComments(page){
	var rviNum = document.querySelector('#rviNum');
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/review/comment/' + rviNum.value + '/?sort=ciNum,desc&size=' + size + '&page='+ (page-1));
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			if(res.content.length === 0){
				html += '<div>';
				html += '<p style="text-align:center;">등록된 댓글이 없습니다.</p>';
				html += '</div>';
				document.querySelector('#commentList').innerHTML = html;
				return;
			}
			
			var uiNum = document.querySelector('#uiNum');
			for(var comment of res.content){
				if(uiNum.value == comment.uiNum){
					html += '<div class="d-flex flex-row mt-2">';
					html += '<div class="ml-2 w-100">';
					html += '<div class="d-flex justify-content-between align-items-center">';
					html += '<div class="d-flex flex-row align-items-center"> <span class="font-weight-bold name">' + comment.uiEmail + '</span></div>';
					html += '</div>';
					html += '<div id="commentDiv'+ comment.ciNum + '">';
					html += '<div id="oDiv'+ comment.ciNum + '">';
					html += '<p class="user-comment-text text-justify">' + comment.ciContent +'</p>'
					html += '<span style="font-size: small;">' + comment.moddat + '</span>';
					html += '<span style="font-size: small; cursor:pointer;" class="float-right ml-3 mr-2 spanDelete" onclick="removeComment(' + comment.ciNum +')">삭제</span>';
					html += '<span style="font-size: small; cursor:pointer;" class="float-right spanUpdate" onclick="reWrite(' + comment.ciNum +')">수정</span>';
					html += '</div>';
					html += '</div>';
					html += '<div id="uDiv'+ comment.ciNum + '" style="display: none;">';
					html += '<div class="w-100 mt-2 comment-area">';
					html += '<textarea class="form-control" id="updateCiContent">' + comment.ciContent + '</textarea>';
					html += '<div class="d-flex justify-content-center">'
					html += '<button type="button" class="btn btn-primary btn-sm mt-2 mr-4" onclick="updateComment( ' + comment.ciNum + ')">댓글수정</button>';
					html += '<button type="button" class="btn btn-danger btn-sm mt-2" onclick="reWrite(' + comment.ciNum + ')">수정 취소</button>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '<hr>';
					html += '</div>';
					html += '</div>';
				}else{
					html += '<div class="d-flex flex-row mt-2">';
					html += '<div class="ml-2 w-100">';
					html += '<div class="d-flex justify-content-between align-items-center">';
					html += '<div class="d-flex flex-row align-items-center"> <span class="font-weight-bold name">' + comment.uiEmail + '</span></div>';
					html += '</div>';
					html += '<p class="user-comment-text text-justify">' + comment.ciContent +'</p>'
					html += '<span style="font-size: small;">' + comment.moddat + '</span>';
					html += '<hr>';
					html += '</div>';
					html += '</div>';
				}
				
			}
			
			var disable = '';
			var clickEvent = 'onclick="getComments(' + res.number + ')"';
			if(res.first){
				disable = 'disabled';
				clickEvent = '';
			}
			
			var li = '<li class="page-item ' + disable + '" ' + clickEvent +'>';
			li += '<a class="page-link" tabindex="-1">이전</a>';
			li += '</li>';
			
			var startPage = Math.floor((((Number(res.number) + 1) - 1) / size)) * size + 1;
			var endPage = startPage + size - 1;
			if(endPage > res.totalPages){
				endPage = res.totalPages;
			}
			for(startPage; startPage<=endPage; startPage++){
				if(startPage === page){
					li += '<li class="page-item active" onclick="getComments(' + startPage + ')"><a class="page-link">'+ startPage +'</a></li>';
					continue;
				}
				li += '<li class="page-item" onclick="getComments(' + startPage +')"><a class="page-link">'+ startPage +'</a></li>';
			}
			
			disable = '';
			clickEvent = 'onclick="getComments(' + (Number(res.number)+2) + ')"';
			
			if(res.last){
				disable = 'disabled';
				clickEvent = '';
			}
			
			li += '<li class="page-item ' + disable +'" ' + clickEvent + '>';
		    li += '<a class="page-link">다음</a>';
		  	li += '</li>';
		  	
			document.querySelector('#commentList').innerHTML = html;
			document.querySelector('#commentPageList').innerHTML = li;
		}
	}
	xhr.send();
}


function saveComment(){
	var rviNum = document.querySelector('#rviNum');
	var ciContent = document.querySelector('#ciContent');
	if(ciContent.value.trim().length < 5 || ciContent.value.trim().length > 1000){
		alert("최소 5글자 이상 1000자 이하로 작성해주세요.");
		ciContent.focus();
		return;
	}
	
	var param = {
			ciContent : ciContent.value,
			reviewInfo : {
				rviNum : rviNum.value
			}
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/review/comment');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('댓글작성 완료');
				ciContent.value = '';
				getComments();
			}else{
				alert('댓글작성에 실패하였습니다');
			}
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
	
}

function updateComment(ciNum){
	var updateCiContent = document.querySelector('#updateCiContent');
	if(updateCiContent.value.trim().length < 5 || updateCiContent.value.trim().length > 1000){
		alert("최소 5글자 이상 1000자 이하로 작성해주세요.");
		ciContent.focus();
		return;
	}
	
	var param = {
			ciContent : updateCiContent.value,
			ciNum : ciNum
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('PATCH', '/review/comment');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			if(res >= 1){
				alert('댓글수정이 완료되었습니다.');
				getComments();
			}else{
				alert('댓글수정에 실패하였습니다');
			}
		}
	}
	
	xhr.setRequestHeader('content-type', 'application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}


function reWrite(ciNum){
	var oDiv = document.querySelector('#oDiv' + ciNum);
	var uDiv = document.querySelector('#uDiv' + ciNum);
	if(oDiv.style.display == 'none'){
		oDiv.style.display = '';
		uDiv.style.display = 'none';
	}else{
		oDiv.style.display = 'none';
		uDiv.style.display = '';
	}
}


function removeComment(ciNum){
	if(confirm("정말 댓글을 삭제 하시겠습니까 ?")){
		var xhr = new XMLHttpRequest();
		xhr.open('DELETE', '/review/comment/' + ciNum);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				if(res >= 1){
					alert('댓글이 삭제 되었습니다.');
					getComments();
				}else{
					alert('댓글이 삭제에 실패하였습니다');
				}
			}
		}
		xhr.send();
	}else{
		return;
	}
}

window.addEventListener('load', getReview);
window.addEventListener('load', () => {
	getComments(1);
});