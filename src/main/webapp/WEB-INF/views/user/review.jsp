<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<style>
.reviewSaveMain{
	margin-top: 150px;
}
.ck-editor__editable{
	min-height: 600px;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
      <div class="container reviewSaveMain">
      	<div class="row">
      		<div class="col-lg-3"></div>
      		<div class="col-lg-6">
      			<div class="section-title" style="text-align: center;">
		          <p>리뷰 작성</p>
		        </div>
      		</div>
      		<div class="col-lg-3"></div>
      	</div>
      	<div class="row">
      		  <div class="col-lg-3"></div>
	          <div class="col-lg-6">
	              <div class="form-group">
				    <label for="fiFile">썸네일 이미지를 올려주세요</label>
				    <input type="file" class="form-control-file" id="fiFile">
				  </div>
	              <label for="rviTitle">제목</label>
			      <input type="text" class="form-control mb-2" id="rviTitle"required>
				  <label for="rviContent">본문</label>
			      <div id="rviContent">내용을 입력해주세요.</div>		      
			      <br>
	              <button class="get-started-btn ml-auto" onclick="saveReview()" >리뷰 등록</button>
	         </div>
	         <div class="col-lg-3"></div>
        </div>
     </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
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
	
	var formData = new FormData();
	formData.append('fileInfo.fiFile', fiFile.files[0]);
	formData.append('rviTitle', rviTitle.value);
	formData.append('rviContent', editor.getData());
	formData.append('userInfo.uiNum', ${userInfo.uiNum});
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/review");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
		}
	}
	
	xhr.send(formData);
}
</script>
</body>

</html>