<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<style>
.reservationInsertMain{
	margin-top: 200px;
	
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
      <div class="container reservationInsertMain">
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
	              <label for="rtiName">제목</label>
			      <input type="text" class="form-control" id="rtiName" required>
				  <label for="editor">본문</label>
			      <div id="editor" style="height: 500px">내용을 입력해주세요.</div>		      
			      <br>
	              <button class="get-started-btn ml-auto" onclick="insert()" >전시회 예약등록 신청</button>
	         </div>
	         <div class="col-lg-3"></div>
        </div>
     </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
var editor;
ClassicEditor
.create( document.querySelector('#editor'),{
	ckfinder : {
		uploadUrl : '/exhibition-insert-editorimage'
	}
 })
.then(obj => {editor = obj;})
.catch(error => {console.error(error);});
</script>
</body>

</html>