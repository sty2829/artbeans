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

<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
.myreservation{
	margin-top: 200px;
	height: 1000px
}
</style>

</head>

<body>
	<div class="container myreservation">
		<p>${userInfo.uiName}님의 예약정보</p>
		<div>
			<table class="table">
				<tr>
				<th>예약자명</th>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>예약티켓수량</th>
				</tr>
				<tbody id="myreservation">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

<script>
var url = '/reservation-ticket';
 window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(xhr.responseText);
			for(var i=0 ;i<res.length;i++){
			var reservationTicketInfo = res[i];
				var html = '';
				html += '<tr>';
				html += '<td>' + reservationTicketInfo.rtiName +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiDate +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiTime +'</td>'; 
				html += '<td>' + reservationTicketInfo.rtiNumber +'</td>';  
				html += '</tr>';				
				html += '<button type="button"	class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=">'
					+ '예약 수정' + '</button>';
				html += '<button type="button"	class="btn btn-outline-danger btn-md btn-block"	onclick="location.href=">'
						+ '예약 취소' + '</button>';
				}
					document.querySelector('#myreservation').innerHTML = html;
			}
		}
	xhr.send();
}
 
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>