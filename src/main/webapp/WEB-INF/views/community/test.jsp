<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
window.addEventListener('load', getSchedule);

function getSchedule(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/reservation?riNum=12&dateStr=2021-04-30');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var res = JSON.parse(xhr.responseText);
			console.log(res);
		}
	}
	xhr.send();
}
</script>
</body>
</html>