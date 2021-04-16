<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    right: -250px;
    height: 100%;
    z-index: 1;
    background: #333;
    color: #fff;
    transition: all 0.3s;
}
#sidebar.active {
    right: 0;
}

.overlay {
    position: fixed;
    width: 100vw;
    height: 100vh;
   background: rgba(0, 0, 0, 0.7);
    z-index: 0;
    display: none;
}
</style>
</head>
<body>
<div id="wrap">
    <nav id="sidebar"></nav>
    <button id="sidebarCollapse">지도</button> 
    <div class="overlay"></div>
</div>

<script>
$('#sidebarCollapse').on('click', function () {
    $('#sidebar').addClass('active');
    $('.overlay').fadeIn();
});

$('.overlay').on('click', function () {
    $('#sidebar').removeClass('active');
    $('.overlay').fadeOut();
});
</script>
</body>
</html>