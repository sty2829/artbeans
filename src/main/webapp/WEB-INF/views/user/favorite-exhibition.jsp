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
		<p>${userInfo.uiName}님이 찜한 전시회 목록</p>
		<div>
			<table class="table" id="myreservation">
				<thead>
				<tr>
				<th>전시회명</th>
				<th>전시관명</th>
				<th>개장날짜</th>
				<th>폐장날짜</th>
				<th>링크</th>
				</tr>
				</thead>
				<tbody id="myreservation">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

<script>
var url = '/favorite-exhibition?uiNum=${userInfo.uiNum}';
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(xhr.responseText);
			for(var i=0 ;i<res.length;i++){
			var userInfo = res[i];
				var html = '';
				html += '<tr>';
				html += '<td>' + favoriteExhibition.feExhibitionName +'</td>'; 
				html += '<td>' + favoriteExhibition.feGallery +'</td>'; 
				html += '<td>' + favoriteExhibition.feStartDate +'</td>'; 
				html += '<td>' + favoriteExhibition.feEndDate +'</td>'; 
				html += '<td>' + favoriteExhibition.feLink +'</td>'; 
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