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
.listTitle{

font-weight: bold;

}
.uiName{
font-size: 30px;
font-weight: bold;
}
.poster{
width:80px;
height:80px;

}
.favoriteList{

}
</style>

</head>

<body>
	<div class="container myreservation">
		<p class ="uiName">${userInfo.uiName}님의 찜목록</p>
		<div>
			<table class="table" id="myreservation">
				<thead>
				<tr>
				<th>포스터</th>
				<th>전시회명</th>
				<th>전시관명</th>
				<th>개장날짜</th>
				<th>폐장날짜</th>
				<th>선택</th>
				</tr>
				</thead>
				<tbody id="favoriteList">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

<script>
var url = '/favorite-exhibitions?uiNum=${userInfo.uiNum}';
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET',url);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
			for(var favoriteExhibition of res){
				var table = '';
				table += '<tr class="listTitle"">';
				table += '<td><img class="poster" src="/resources/assets/img/exhibition/' + favoriteExhibition.exhibitionInfo.fileInfo.fiPath + '">';
				table += '<td>' + favoriteExhibition.exhibitionInfo.eiName +'</td>'; 
				table += '<td>' + favoriteExhibition.exhibitionInfo.galleryInfo.giName +'</td>';
				table += '<td>' + favoriteExhibition.exhibitionInfo.eiStartDate +'</td>';
				table += '<td>' + favoriteExhibition.exhibitionInfo.eiEndDate +'</td>';
				table += '<td><input type="checkbox"><td>';
				table += '</tr>';				
				
				}
					document.querySelector('#favoriteList').innerHTML = table;
			}
		}
	xhr.send();
}

</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>