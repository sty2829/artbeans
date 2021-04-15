<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/resources/user/js/calendar/calendar.js"></script>
    <title>전시회 월별 개봉일</title>
    <jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/user/css/calendar.css">
</head>


<body>
  <br><br><br><br><br><br><br>
  <h2 class='date_text' style="text-align: center; padding: 2rem 0"></h2>
	
	<div class='button_box' style="margin: 0 auto; width: 159px;">
		<button id="backButton" class="button" onclick="backButton()">뒤로</button>
		<button id="nextButton" class="button" onclick="nextButton()">다음</button>
	</div>
	<br>
  <div class='date_item rap'>

    <div class="grid date_form date_head">
      <div>일</div>
      <div>월</div>
      <div>화</div>
      <div>수</div>
      <div>목</div>
      <div>금</div>
      <div>토</div>
    </div>

    <div class="grid date_form dateSel"></div>

  </div>
  <div><br></div>
  <div><br></div>
  <div><br></div>
  <div><br></div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>