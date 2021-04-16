<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		<div class="bg-gradient-danger" style="">

			<div class="container">
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<div class="form-group">

									<div class="col-lg-6">

										<div class="p-5" style="text-align:center">
											<div class="text-center">
												<h4 class="h4 text-gray-900 mb-4">회원정보 수정</h4>
											</div>
											<div class="form-group">
												<input type="hidden" class="form-control form-control-user"
													id="uiNum">
											</div>

											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="uiName" placeholder="이름">
											</div>
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="uiEmail" placeholder="이메일">
											</div>

											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="uiPwd" placeholder="비밀번호">
											</div>

											<div class="col-sm-4 mb-3 mb-sm-0">
												<select class="form-group" id="uiGenre">
													<option value="">선호하는 장르를 선택해주세요</option>
													<option value="서양화">서양화</option>
													<option value="동양화">동양화</option>
													<option value="유화">유화</option>
													<option value="조각">조각</option>
													<option value="설치미술">설치미술</option>
													<option value="미디어아트">미디어아트</option>
													<option value="사진">사진</option>
												</select> <br>
											</div>
											<button type="button" class="btn btn-outline-danger" onclick="goUpdate()">수정</button>
											<button type="button" class="btn btn-outline-danger" onclick="goOut()">취소</button>
											
											<hr>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
//value
var url = '/user?uiNum=${userInfo.uiNum}';
var xhr = new XMLHttpRequest();
xhr.open('GET',url);
xhr.onreadystatechange = function(){
	if(xhr.readyState==4 && xhr.status==200){
		var html = '';
		var res = JSON.parse(xhr.responseText);
		for(var key in res){
			if(document.querySelector('#'+key)){
				document.querySelector('#'+key).value=res[key];
			}
		}
	}
}
xhr.send();
//button
function doUpdate(){
	var param = {};
	var objs = document.querySelectorAll('input[type=text],input[type=hidden]','#uiGenre');
	for(var i=0;i<objs.length;i++){
		var obj = objs[i];
		var key = obj.id;
		var value = obj.value;
		param[key] = value;
	}
	console.log(param);
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/user/update')
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}
	}
	xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
	xhr.send(JSON.stringify(param));
}
</script>
</body>
</html>