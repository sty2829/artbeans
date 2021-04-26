<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 접근 불허</title>
</head>
<script>
alert('${msg}');
location.href='/views/user/login';
</script>
</body>
</html>