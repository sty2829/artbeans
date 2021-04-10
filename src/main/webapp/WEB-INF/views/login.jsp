<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ArtBeans - Login</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/user/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/user/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-danger" style="text-align:center">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">반갑습니다!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="uiEmail" aria-describedby="emailHelp"
                                                placeholder="이메일">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="uiPwd" placeholder="비밀번호">
                                        </div>
                                     
                                        <a href="/views/index" class="btn btn-danger btn-user btn-block" onclick="goLogin()">
                                            로그인
                                        </a>
                                        <hr>
                                    
                                  
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/views/menu/forget-id">아이디 찾기</a> / <a class="small" href="/views/menu/forget-password">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/views/register">회원가입</a>
                                    </div>
									<div id="footer" role="contentinfo">
										<address>
											<em><a href="https://www.artbeans.site/" target="_blank"
												class="logo"><span class="blind">artBeans</span></a></em> <em
												class="copy">Copyright</em> <em class="u_cri">&copy;</em> <a
												href="https://www.artbeans.site/" target="_blank"
												class="u_cra">artBeans Corp.</a> <span class="all_r">All Rights Reserved.</span>
										</address>
									</div>
									<!-- //footer -->

								</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/user/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/user/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/user/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/user/js/sb-admin-2.min.js"></script>
<script>
function goLogin(){	
	
	var uiEmail = document.querySelector('#uiEmail');
	if(uiEmail.value.trim().length<1){
		alert('이메일을 입력해주세요.');
		uiEmail.focus();
		return;
	}
	
	var uiPwd = document.querySelector('#uiPwd');
	if(uiPwd.value.trim().length<1){
		alert('비밀번호를 입력해주세요.');
		uiPwd.focus();
		return;
	}
	
	var param = {
			uiEmail : document.querySelector('#uiEmail').value,
			uiPwd : document.querySelector('#uiPwd').value
				}
	
		var xhr = new XMLHttpRequest();
		xhr.open('POST','/login');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
					var res = JSON.parse(xhr.responseText);
					if(xhr.responseText) {
						console.log(xhr.responseText);
						location.href= '/views/index';
						return;	 
						}
					}
				}
		xhr.send(JSON.stringfy(param));
}
</script>
</body>
</html>