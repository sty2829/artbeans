<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 접근 불허</title>
</head>
<body style="background:red;">

<script>
alert('${msg}');
location.href='/views/admin/admin-login';
</script>
</body>
</html>