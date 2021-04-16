<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ArtBeans - Login</title>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>
<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
			</div>
		</section>
	<div class="bg-gradient-danger" style="">

		<div class="container">
			<div class="row justify-content-center">

				<div class="col-xl-10 col-lg-12 col-md-9">

					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<div class="form-group">

								<div class="col-lg-6">

									<div class="p-5">
										<div class="text-center">
											<h4 class="h4 text-gray-900 mb-4">비밀번호 찾기</h4>
										</div>

										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="uiName" placeholder="이름">
										</div>
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="uiEmail" placeholder="이메일">
										</div>
										<button type="button"
											class="btn btn-outline-danger btn-md btn-block"
											onclick="goUpdate()">확인</button>
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
		
		var uiName = document.querySelector('#uiName');
		if (!uiName.value) {
			alert('이름을 입력해주세요.');
			uiName.focus();
			return;
		}

		var uiEmail = document.querySelector('#uiEmail');
		if (!uiEmail.value) {
			alert('이메일 입력해주세요.');
			uiEmail.focus();
			return;
			}else {          
				if(!goEmail(uiEmail.value))	{
				alert("이메일 형식이 잘못되었습니다");
				uiEmail.focus();
				return;
				}                
			}                      
		}

		
		function goUpdate(){
				var xhr = new XMLHttpRequest();
				xhr.open('GET', '/mailCheck?uiEmail' + uiEmail);
				xhr.onreadystatechange = function() {
					if (xhr.status ==200 & xhr.readyState ==4) {
						var res = JSON.parse(xhr.responseText);
						if(xhr.responseText){
						console.log(xhr.responseText);
						if(userInfo.uiEmail == uiEmail){
							alert('해당 이메일로 인증번호가 전송되었습니다.');
								}
						}else{
							alert('존재하지 않는 사용자입니다.');
					}
				}
				xhr.send();
			}
		</script>
</body>
</html>