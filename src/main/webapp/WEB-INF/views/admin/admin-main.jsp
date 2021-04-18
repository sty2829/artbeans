<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<c:if test="${admin eq null}">
<script>
	alert('운영 관련 접근 불허');
	location.href='/views/login';
</script>
</c:if>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 메인</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
h3{
	height:100px;
	font-weight: bold;
}
p{
	height:50px;
	font-weight: bold;
}

.top-blank{
	height:200px;
}

.bottom-blank{
	height:200px;
}
.col-sm-4{
	
}
.image{

}
</style>
</head>
<body>
<div class="top-blank"></div>

<div class="container-fluid bg-3 text-center">
  <h3>관리자 페이지</h3>
  <div class="row">
    <div class="col-sm-4">
      <p>exhibition_info 수정페이지</p>
      <div class="image" onclick="location.href='/views/admin/admin-ei'" style="cursor:pointer"><img src="/resources/admin/img/admin-page-icon1.jpg"alt="Image"></div>
    </div>
    <div class="col-sm-4">
      <p>배너 수정페이지</p>
      <div class="image"  onclick="location.href='/views/admin/admin-banner'" style="cursor:pointer"><img src="/resources/admin/img/admin-page-icon2.jpg"alt="Image"></div>
    </div>
    <div class="col-sm-4">
      <p>리뷰 수정페이지</p>
       <div class="image"><img src="/resources/admin/img/admin-page-icon3.jpg"alt="Image"></div>
    </div>
  
  </div>
</div>

<div class="bottom-blank"></div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>