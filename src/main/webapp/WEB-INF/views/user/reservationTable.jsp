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
		<p>예약정보</p>
		<div>
			<table class="table" >
			<tr>
				<th>uiName</th>
				<th>eriNum</th>
				<th>eriStartDate</th>
				<th>eriEndDate</th>
				<th>eriStartTime</th>
				<th>eriEndTime</th>
				<th>eriAudienceRating</th>
				<th>uiNum</th>
			</tr>	
				<tbody id="myreservation">
				</tbody>
			</table>
		</div>
	</div>

<script>

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibition-reservations');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			var html = '';
			for(var i=0 ;i<res.length;i++){
				var exhibitionReservationInfo = res[i];
				console.log(exhibitionReservationInfo) //여기에 나오자나요..
				html += '<tr>';
				html += '<td>' + exhibitionReservationInfo.eriNum +'</td>'; 
				html += '<td>' + exhibitionReservationInfo.eriStartDate +'</td>'; 
				html += '<td>' + exhibitionReservationInfo.eriEndDate +'</td>'; 
				html += '<td>' + exhibitionReservationInfo.eriStartTime +'</td>';
				html += '<td>' + exhibitionReservationInfo.eriEndTime +'</td>';	
				html += '<td>' + exhibitionReservationInfo.eriAudienceRating +'</td>';
				html += '<td>' + exhibitionReservationInfo.exhibitionInfo.eiName + '</td>';
				html += '<td>' + exhibitionReservationInfo.exhibitionInfo.userInfo.uiName + '</td>';
				html += '</tr>';
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