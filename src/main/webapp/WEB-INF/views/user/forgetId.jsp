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

<title>SB Admin 2 - 가입된 비밀번호 찾기</title>

<!-- Custom fonts for this template-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<style>
#ageButton{
boder : 1px solid #bcbc;
margin : 15px 0px 0px 0px;
width : 400px;
}

.text-align-center {
	text-justify : inter-word; 
}
#nameTag{
	margin : 10px 0px 0px 0px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<main id="main">
		======= Breadcrumbs =======
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>

		<div class="container" >

			<div class="row " style="">

				<div class="col-2"></div>
				<div class="col-4 text-center">


					<div class="card" style="padding: 8px">

						<h4>아이디 찾기</h4>
						<div class="input-group flex-nowrap" style="padding: 8px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">이름</span>
							</div>
							<input type="text" name="user_name" id="user_name"
								class="form-control" placeholder="" required
								aria-label="Username" aria-describedby="addon-wrapping">
						</div>

						<div class="input-group flex-nowrap" style="padding: 8px">
							<div class="btn-group btn-group-toggle" data-toggle="buttons"
								id="uiGender">
								<label class="btn btn-outline-dark active"><input
									type="radio" name="uiGender" value="남성" autocomplete="off">남성</label>
								<label class="btn btn-outline-dark"><input type="radio"
									name="uiGender" value="여성" autocomplete="off">여성</label>
							</div>

						</div>
						<div class="input-group flex-nowrap" style="padding: 8px">
							<div class="btn-group btn-group-toggle" data-toggle="buttons"
								id="ageButton">
								<label class="btn btn-outline-dark active"><input
									type="radio" name="uiAge" value="10대" autocomplete="off">10대</label>
								<label class="btn btn-outline-dark"><input type="radio"
									name="uiAge" value="20대" autocomplete="off">20대</label> <label
									class="btn btn-outline-dark"><input type="radio"
									name="uiAge" value="30대" autocomplete="off">30대</label> <label
									class="btn btn-outline-dark"><input type="radio"
									name="uiAge" value="40대" autocomplete="off">40대</label> <label
									class="btn btn-outline-dark"><input type="radio"
									name="uiAge" value="50대" autocomplete="off">50대</label> <label
									class="btn btn-outline-dark"><input type="radio"
									name="uiAge" value="60대이상" autocomplete="off">60대이상</label>
							</div>
						</div>


						<div class="input-group flex-nowrap" style="padding: 8px">
							<select class="col-sm-6" id="uiRegion">
								<option value="">지역선택</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="세종">세종</option>
								<option value="경남">경남</option>
								<option value="경북">경북</option>
								<option value="전남">전남</option>
								<option value="전북">전북</option>
								<option value="제주">제주</option>
								<option value="충남">충남</option>
								<option value="충북">충북</option>
							</select><br>
						</div>
					</div>
			
			<div class="input-group flex-nowrap" style="padding: 8px">
					<button type="submit" style="margin: 8px"
						class="btn btn-outline-danger" name="button">아이디 찾기</button>
			</div>
				</div>



			</div>
		</div>

		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>

	</main>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script>
function goCheck(){
				var uiName = document.querySelector('#uiName');
				if (uiName.value.trim().length < 1) {
					alert('이름을 입력해주세요.');
					uiName.focus();
					return;
				}

				var uiGender = document.querySelector('input[name="uiGender"]:checked');
				if (!uiGender) {
					alert('성별을 선택해주세요.');
					return;
				}
				
				var uiAge = document.querySelector('input[name="uiAge"]:checked');
				if (!uiAge) {
					alert('연령대를 선택해주세요.');
					return;
				}
				
				var uiRegion = document.querySelector('select#uiRegion option:checked')
				if (uiRegion.value.trim().length <1) {
					alert('지역을 선택해주세요.');
					return;
				}
				
				var xhr = new XMLHttpRequest();
				xhr.open('GET', '/users?uiName=${userInfo.uiName}');
				xhr.onreadystatechange = function() {
					if (xhr.status ==200 & xhr.readyState ==4) {
							if(xhr.responseText){
								var res = JSON.parse(xhr.responseText);
								console.log(xhr.responseText);
								alert('회원님의 아이디는' + ${userInfo.uiEmail} + '입니다.');
								/* 
							return '/views/login'; */
							}else{
								alert('존재하지 않는 사용자입니다.');
								}
							}
						}
						//xhr.send();
					}
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>