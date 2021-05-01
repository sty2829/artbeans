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


<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.mypage {
	margin-top: 200px;
	height: 400px;
}
</style>
</head>
<body>
	<div class="container mypage">
		<h4 style="font-weight: bold;">${userInfo.uiName}님의 회원정보</h4>
		<div>
			<table class="table" id="myInformation">
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="input_box" id="addBox" style="display: none"></div>
	</div>

	<script>
		var url = '/user?uiNum=${userInfo.uiNum}';
		window.onload = function() {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					var html = '<thead>';
					html += '<tr>';
					html += '<th> 이름</th>';
					html += '<th> 이메일</th>';
					html += '<th> 전화번호</th>';
					html += '<th> 성별</th>';
					html += '<th> 나이</th>';
					html += '<th> 지역</th>';
					html += '<th> 선호 장르</th>';
					html += '</tr>';
					html += '</thead>';
					html += '<tbody>';
					html += '<tr>';
					html += '<td>' + res.uiName + '</td>';
					html += '<td>' + res.uiEmail + '</td>';
					html += '<td>' + res.uiPhoneNumber + '</td>';
					html += '<td>' + res.uiGender + '</td>';
					html += '<td>' + res.uiAge + '</td>';
					html += '<td>' + res.uiRegion + '</td>';
					html += '<td>' + res.uiGenre + '</td>';
					html += '</tr>';
					html += '</tbody>'
					html += '<br>'
					html += '<button type="button"	class="btn btn-outline-danger"	onclick="location.href=\'/views/user/mypage-update?uiNum=${userInfo.uiNum}\'">'
							+ '정보 수정' + '</button>' + '<br>' + '<button type="button" class="btn btn-outline-danger"	onclick="ByeBye()">'
							+ '회원 탈퇴' + '</button>';
					document.querySelector('#myInformation').innerHTML = html;
				}
			}
			xhr.send();
		}
		
		function ByeBye(){
			if(document.querySelector('#addBox').style.display == 'none'){
				document.querySelector('#addBox').style.display ='';
			}else{
				document.querySelector('#addBox').style.display ='none';
			}
		    document.querySelector('#addBox').innerHTML = '<h6 style="font-weight:bold; width: 100% ; margin:10px;">' + '탈퇴사유를 간단하게 기입하여 주세요.' + '<h6>';
		    document.querySelector('#addBox').innerHTML += '<input type="text" name="byebye" id="uiDropOut" style="width: 70%;">' + '<button type="button" class="btn btn-outline-danger" onclick="dropOut()">' + '확인' + '</button>';
		}
		
		function dropOut(){
		var uiDropOut = document.querySelector('#uiDropOut');
		console.log(uiDropOut.value);
		if(uiDropOut.value.trim().length<1){
			alert('탈퇴 사유를 적어주세요.');
			uiDropOut.focus();
			return ;
		}		
		var dropOutpattern = /[가-힣]{2,}/;
		var uiDropOut = document.querySelector('#uiDropOut');
			if(!dropOutpattern.test(uiDropOut.value)){
				alert('탈퇴 사유를 정확히 입력해주세요.');
				uiDropOut.focus();
				return;
			}			
		var url = "/dropOut?uiNum=" + ${userInfo.uiNum};
		var xhr = new XMLHttpRequest(); 
		xhr.open('POST',url);
		xhr.onreadystatechange = function(){
			if(xhr.status==200 && xhr.readyState==4){
			var res = xhr.responseText;
				if(res=1){
					alert('탈퇴되었습니다. 아트빈을 이용해주셔서 감사합니다.');
					location.href="/";
				}else{
					alert('탈퇴에 실패하였습니다. 다시 시도해주세요.');
					}
				}
			}
			var param ={
					uiNum : ${userInfo.uiNum},
					uiDropOut : document.querySelector('#uiDropOut').value,
					uiStatus : "0"
					}
			xhr.setRequestHeader('content-type','application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
			}
		
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>