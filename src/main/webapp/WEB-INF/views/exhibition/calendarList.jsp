<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/resources/user/js/calendar/script.js"></script>
    <title>전시회 월별 개봉일</title>
    <jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>
* {
  margin: 0;
  padding: 0;
  list-style: none;
  box-sizing: border-box;
}

/* 달력 */

.rap {
  max-width: 1400px;
  width: 100%;
  margin: 0 auto;
}

.date_head {
  margin-bottom: 10px;
}

.date_head div {
  background: #f03d3d;
  color: #fff;
  text-align: center;
}

.date_form {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  grid-gap: 10px;
}

.date_form div {
  padding: 10px 10px;
  font-size: 16px;
  cursor: pointer;
}

.dateSel div {
  font-weight: bold;
  color: #333;
  min-height: 150px;
  padding: 1rem 1.3rem;
  border-radius: 10px;
  border: 1px solid #f7f7f7;
}

.background {
  background: #f7f7f7;
}

.button {
	width: 75px;
	cursor: pointer;
	box-shadow: 0px 0px 2px gray;
	border: none;
	outline: none;
	padding: 5px;
	border-radius: 5px;
	color: black;
}	

</style>
</head>


<body>
  <br><br><br><br><br><br><br>
  <h2 class='date_text' style="text-align: center; padding: 2rem 0"></h2>
	
	<div>
		<button id="backButton" class="button" onclick="backButton()">뒤로</button>
		<button id="nextButton" class="button" onclick="nextButton()">다음</button>
	</div>

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

</body>
</html>