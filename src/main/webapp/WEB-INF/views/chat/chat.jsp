<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/user/css/chat.css" rel="stylesheet"/>
<script src="/resources/user/js/chat/chat.js"></script>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body oncontextmenu="return false">
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		
		
		<div class="container" id="startDiv">
			<div class="card o-hidden border-0" style="padding: 8px; height: 350px;">
				<div class="card-body">
					<h3 class="card-title" style="text-align: center">채팅 로그인</h3>
					<div class="card-content" style="padding: 8px">
						<input type="text" id="userName" readonly>
					</div>
					<div class="card-content" style="padding: 8px">
						<button type="button" class="btn btn-primary" onclick="startChat()">채팅시작하기</button>
					</div>
				</div>
			</div>
		</div>
		<div id="chatDiv" style="display: none" class="container">
	    	<div class="card o-hidden border-0" style="padding: 8px; height: 850px;">
	    	
		        <div class="card-body1" >
		          <h3 class="card-title" style="text-align: center">채팅</h3>
		          
		            <div class="card-content" style="padding: 8px">
						<ul id="chat" class="chatsetting" style=""></ul>
							<div class="msj-rta macro" style="margin: auto">
				         	  <div class="text1 text1-r" >
				         	  </div>
				         	</div>
					</div>	
		        </div> 
		        <div class="card-content" style="padding: 8px">
						<input id="chatmsg" class="chatmsg" size="100px" placeholder="여기에 내용을 작성해주세요." />
			            <button class="btn btn-secondary" onclick="sendMsg()">전송</button>
			            <button class="btn btn-danger" onclick="endChat()">나가기</button>
				</div>			        
		    </div>
		</div>
	</main>

	<script>
		var uiName = '${userInfo.uiName}';
		var uiEmail = '${userInfo.uiEmail}';
		var chatName = document.querySelector('#userName');
		chatName.value = uiName + '(' + uiEmail + ')';

		var ws;
		function sendMsg() {
			var param = {
				type : "msg",
				name : document.querySelector('#userName').value,
				msg : document.querySelector('#chatmsg').value
			}
			ws.send(JSON.stringify(param));
		}

		function startChat() {
			var date = formatAMPM(new Date());
			ws = new WebSocket('wss://${pageContext.request.serverName}/chat'); //연결
			ws.onopen = function(data) {
				var param = {
					type : "enter",
					name : chatName.value,
				}
				ws.send(JSON.stringify(param));
				document.querySelector('#startDiv').style.display = 'none';
				document.querySelector('#chatDiv').style.display = '';
			}

			var html = '';
			ws.onmessage = function(data) {
				var msg = JSON.parse(data.data);
				if (msg.type && msg.type == 'enter') {
					html = '<li style="width:100%">'
							+ '<div class="msj macro">'
							+ '<div class="text1 text1-l">' 
							+ '<p>' + msg.name + ' 님이 입장하셨습니다.</p>'
							+ '<p><small>' + date + '</small></p>'
							+ '</div>'
							+ '</div>'
							+ '</li>';
					document.querySelector('#chat').innerHTML += html;
				} else if (msg.type && msg.type == 'msg') {
					if (chatName.value != msg.name) {
						html = '<li style="width:100%">'
								+ '<div class="msj macro">'
								+ '<div class="text1 text1-l">' 
								+ '<p>' + msg.name + ' : ' + msg.msg + '</p>'
								+ '<p><small>' + date + '</small></p>'
								+ '</div>'
								+ '</div>'
								+ '</li>';
						document.querySelector('#chat').innerHTML += html;
						document.querySelector('#chatmsg').value = '';
					} else {
						html = '<li style="width:100%;">'
								+ '<div class="msj-rta macro">'
								+ '<div class="text1 text1-r">'
								+ '<p>'	+ msg.name + ' : ' + msg.msg + '</p>' 
								+ '<p><small>' + date + '</small></p>'
								+ '</div>'
								+ '<div class="avatar" style="padding:0px 0px 0px 10px !important"></div>'
								+ '</li>';
						document.querySelector('#chat').innerHTML += html;
						document.querySelector('#chatmsg').value = '';
					}
				} else {
					html = '<li style="width:100%">'
							+ '<div class="msj macro">'
							+ '<div class="text1 text1-l">' 
							+ '<p>' + msg.name + ' 님이 퇴장하셨습니다.</p>'
							+ '<p><small>' + date + '</small></p>'
							+ '</div>'
							+ '</div>'
							+ '</li>';
					document.querySelector('#chat').innerHTML += html;
				}
			}
		}

		function endChat() {
			alert('정말 나가시겠습니까?');
			var param = {
				type : "end",
				name : chatName.value,
			}
			ws.send(JSON.stringify(param));
			ws.close();		
			alert('채팅이 종료되었습니다.');
			document.querySelector('#chatDiv').style.display = 'none';
			document.querySelector('#startDiv').style.display = '';			
		}		
		
		function formatAMPM(date) {
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var ampm = hours >= 12 ? 'PM' : 'AM';
			hours = hours % 12;
			hours = hours ? hours : 12; 
			minutes = minutes < 10 ? '0' + minutes : minutes;
			var strTime = hours + ':' + minutes + ' ' + ampm;
			return strTime;
		}

		//enter press   
		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) {  			
				sendMsg();
			}
		});
		
		//Prevent Windows from refreshing
		function noEvent() {
		    if (event.keyCode == 116) {
		        event.keyCode= 2;
		        return false;
		    }
		    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
		        return false;
		    }
		}
		document.onkeydown = noEvent;
		window.addEventListener("beforeunload", endChat);
	</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>