<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 전시회 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style>

.body {
  display: flex;
  margin-top: 50px;
  justify-content: center;
  background-color: #FFFCFF;
}
.button {
  width: 75px;
  cursor: pointer;
  box-shadow: 0px 0px 2px gray;
  border: none;
  outline: none;
  padding: 5px;
  border-radius: 5px;
  color: white;
}

#header2 {
  padding: 10px;
  color: #4c4c4c;
  font-size: 26px;
  font-family: sans-serif;
  display: flex;
  justify-content: space-between;
}
#header2 button {
  background-color:#3e3e3e;
}
#container {
  width: 700px;
}
#weekdays {
  width: 100%;
  display: flex;
  color: #232323;
}
#weekdays div {
  width: 100px;
  padding: 10px;
}
#calendar {
  width: 100%;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
}
.day {
  width: 100px;
  padding: 10px;
  height: 100px;
  cursor: pointer;
  box-sizing: border-box;
  background-color: white;
  margin: 0px;
  box-shadow: 0px 0px 3px #CBD4C2;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.day:hover {
  background-color: #9a9a9a;
}

.day + #currentDay {
  background-color:#ff0000;
}
.event {
  font-size: 10px;
  padding: 3px;
  background-color: #39ff5c;
  color: white;
  border-radius: 5px;
  max-height: 55px;
  overflow: hidden;
}
.padding {
  cursor: default !important;
  background-color: #FFFCFF !important;
  box-shadow: none !important;
}


#newEventModal, #deleteEventModal {
  display: none;
  z-index: 20;
  padding: 30px;
  background-color: #e0e0e0;
  box-shadow: 0px 0px 20px black;
  border-radius: 5px;
  width: 350px;
  top: 10px;
  left: calc(50% - 175px);
  position: absolute;
  font-family: sans-serif;
}

#eventTitleInput {
  padding: 10px;
  width: 100%;
  box-sizing: border-box;
  margin-bottom: 25px;
  border-radius: 3px;
  outline: none;
  border: none;
  box-shadow: 0px 0px 3px gray;
}
#eventTitleInput.error {
  border: 2px solid red;
}
#cancelButton, #deleteButton {
  background-color: #a8a8a8;
}
#saveButton, #closeButton {
  background-color: #00ff00;
}
#eventText {
  font-size: 14px;
}
#modalBackDrop {
  display: none;
  top: 0px;
  left: 0px;
  z-index: 10;
  width: 100vw;
  height: 100vh;
  position: absolute;
  background-color: rgba(0,0,0,0.8);
}

</style>
</head>
<body class="body">
<main id="main">
		<!-- ======= Breadcrumbs ======= -->
	<!--<section id="breadcrumbs" class="breadcrumbs">
			<div class="container" name="">
			</div>
		</section> -->	
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Section ======= -->
  		<!--<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
					    <ul id="portfolio-flters">					        
						     <li onclick="newest()">전시회 오픈순</li> 
	                 	   	 <li onclick="deadline()">전시회 마감순</li> 
	                    </ul>
					</div>
				</div>
			</div>
		</section>--> 
		<br>
		<br>
		<br>
		
		<!-- 최신순, 마감순 <div id="exhibitionList"></div> -->
<section id="blog" class="blog">
      <div class="container">
        <div class="row" id="exhibitionList">
       		<!-- 달력 -->
       		<div id="container">
		      <div id="header2">
		        <div id="monthDisplay"></div>
		        <div>
		          <button id="backButton" class="button">뒤로</button>
		          <button id="nextButton" class="button">다음</button>
		        </div>
		      </div>
	
			<div id="container">
				<div id="header"></div>
				
				<div id="weekdays">
					<div>일요일</div>
					<div>월요일</div>
					<div>화요일</div>
					<div>수요일</div>
					<div>목요일</div>
					<div>금요일</div>
					<div>토요일</div>
				
				</div>
				
				<div id="calendar"></div>
			</div>
	
			<!--  <div id="newEventModal">
		      <h2>시간 예약</h2>
		
		      <input id="eventTitleInput" placeholder="Event Title" /> 
				<div id="eventTitleInput">
					
				</div>
				
		      <button id="saveButton"  class="button">Save</button>
		      <button id="cancelButton"  class="button">Cancel</button>
		    </div>-->

		   <!--   <div id="deleteEventModal">
		      <h2>Event</h2>
		
		      <p id="eventText"></p>
		
		      <button id="deleteButton"  class="button">Delete</button>
		      <button id="closeButton"  class="button">Close</button>
		    </div>-->

		    <div id="modalBackDrop"></div>
			<!-- 달력 끝-->
       		
        </div>
      </div>
     </div>
</section>
</main>
<script src="/resources/user/js/calendar/calendar.js"></script>
</body>
</html>