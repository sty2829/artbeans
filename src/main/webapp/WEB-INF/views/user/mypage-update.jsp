<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
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
												<h4 class="h4 text-gray-900 mb-4">${userInfo.uiName}님의 회원정보</h4>
											</div>
											<div class="form-group">
												<input type="hidden" class="form-control form-control-user"
													id="uiNum" value="${userInfo.uiNum}">
											</div>

											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="uiName" value="${userInfo.uiName}">
											</div>
											<div class="form-group">
												<input type="email" class="form-control form-control-user"
													id="uiEmail" value="${userInfo.uiEmail}">
											</div>

											<div class="form-group">
												<input type="password" class="form-control form-control-user"
													id="uiPwd" value="${userInfo.uiPwd}">
											</div>

											<div class="col-sm-4 mb-3 mb-sm-0">
												<select class="form-group" id="uiGenre" >
													<option value="">선호하는 장르를 선택해주세요</option>
													<option value="서양화" ${userInfo.uiGenre eq "서양화" ? "selected":""}>서양화</option>
													<option value="동양화" ${userInfo.uiGenre eq "동양화" ? "selected":""}>동양화</option>
													<option value="유화" ${userInfo.uiGenre eq "유화" ? "selected":""}>유화</option>
													<option value="조각" ${userInfo.uiGenre eq "조각" ? "selected":""}>조각</option>
													<option value="설치미술" ${userInfo.uiGenre eq "설치미술" ? "selected":""}>설치미술</option>
													<option value="미디어아트" ${userInfo.uiGenre eq "미디어아트" ? "selected":""}>미디어아트</option>
													<option value="사진" ${userInfo.uiGenre eq "사진" ? "selected":""}>사진</option>
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
			
			function goUpdate(){
				
			var uiName = document.querySelector('#uiName');
			if(uiName.value.trim().length<4) {
				alert('이름을 4글자 이상 입력해주세요.');
				uiName.focus();
				return;
			}
			
			var uiEmail = document.querySelector('#uiEmail');
			if(uiEmail.value.trim().length<4){
				alert('이메일을 4글자 이상 입력해주세요.');
				uiEmail.focus();
				return;
			}
			
			var uiPwd = document.querySelector('#uiPwd');
			if(uiPwd.value.trim().length<4){
				alert('비밀번호를 4글자 이상 입력해주세요.');
				uiPwd.focus();
				return;
			}	
			
			var uiGenre = document.querySelector('#uiGenre');
			if (uiGenre.value.length < 1) {
				alert('장르를 선택해주세요.');
				return; 
			}	
			
			var param = {
					uiNum : document.querySelector('#uiNum').value,
					uiName : document.querySelector('#uiName').value,
					uiEmail : document.querySelector('#uiEmail').value,
					uiPwd : document.querySelector('#uiPwd').value,
					uiGenre : document.querySelector('#uiGenre').value,
					uiAge : '${userInfo.uiAge}',
					uiGender : '${userInfo.uiGender}'
				}

			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/user-update')
			xhr.onreadystatechange = function() {
				if (xhr.status==200 && xhr.readyState==4) {
					console.log(xhr.responseText);
					if(xhr.responseText){
						alert('수정완료되었습니다.');
					} else {
						alert('수정에 실패하였습니다. 다시 시도해주세요.');
						}
					}
				}	
				xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
				xhr.send(JSON.stringify(param));
			}	
			
			function goOut() {
				location.href = '/';
			}

		</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>		

</body>
</html>