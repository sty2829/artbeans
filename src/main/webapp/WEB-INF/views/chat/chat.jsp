<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  
<script src="/resources/user/js/window/moveblock.js"></script>-->

<!-- <link rel="stylesheet" href="/resources/user/css/chat.css"> -->
<style>
.card-body {
	text-align: center;
}
.card-body1 {
	flex: 1 1 auto;
    min-height: 1px;
}
  
    
.mytext{
    border:0;padding:10px;background:whitesmoke;
}
.text1{
    width:75%;display:flex;flex-direction:column;
}
.text1 > p:first-of-type{
    width:100%;margin-top:0;margin-bottom:auto;line-height: 13px;font-size: 12px;
}
.text1 > p:last-of-type{
    width:100%;text-align:right;color:silver;margin-bottom:-7px;margin-top:auto;
}
.text1-l{
    float:left;padding-right:10px;
}        
.text1-r{
    float:right;padding-left:10px;
}
.avatar{
    display:flex;
    justify-content:center;
    align-items:center;
    width:25%;
    float:left;
    padding-right:10px;
}
.macro{
    margin-top:5px;width:85%;border-radius:5px;padding:5px;display:flex;
}
.msj-rta{
    float:right;
}
.msj{
    float:left;background:white;
}
.frame{
    height:450px;
    overflow:hidden;
    padding:0;
}
.frame > div:last-of-type{
    position:absolute;bottom:5px;width:100%;display:flex;
}
.msj:before{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:-14px;
    position:relative;
    border-style: solid;
    border-width: 0 13px 13px 0;
    border-color: transparent #ffffff transparent transparent;            
}
.msj-rta:after{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:14px;
    position:relative;
    border-style: solid;
    border-width: 13px 13px 0 0;
    border-color: whitesmoke transparent transparent transparent;           
}  
input:focus{
    outline: none;
}        
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
    color: #d4d4d4;
}
::-moz-placeholder { /* Firefox 19+ */
    color: #d4d4d4;
}
:-ms-input-placeholder { /* IE 10+ */
    color: #d4d4d4;
}
:-moz-placeholder { /* Firefox 18- */
    color: #d4d4d4;
}  
#chat {
    width:100%;
    list-style-type: none;
    padding:18px;
    position:absolute;
    bottom:40px;
    display:flex;
    flex-direction: column;
    background:whitesmoke;
} 

.chatsetting{
    max-height: 750px;
    overflow: auto;
}
.chatsetting::-webkit-scrollbar {
    width: 10px;
  }
  .chatsetting::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .chatsetting::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
</style>
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

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press    			
				sendMsg();
			}
		});

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
			ws = new WebSocket('wss://artbeans.site/chat'); //연결
			ws.onopen = function(data) { //on붙으면 이벤트
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
				//console.log(msg);
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
					// document.querySelector('#chat').value +='[입장 :' + msg.name + '님이 입장하였습니다.]\r\n';
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

					//				document.querySelector('#chat').value += msg.name + ' : ' + msg.msg + ' (' + date + ')\r\n' ;
					//				document.querySelector('#chatmsg').value = '';
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
					//document.querySelector('#chat').value += '[퇴장 :' + msg.name + '님이 퇴장하였습니다.]\r\n';
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
			hours = hours ? hours : 12; // the hour '0' should be '12'
			minutes = minutes < 10 ? '0' + minutes : minutes;
			var strTime = hours + ':' + minutes + ' ' + ampm;
			return strTime;
		}
		
		//윈도우 새로고침 막기
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