/**
 * 
 */
function goLogin() {

		var uiEmail = document.querySelector('#uiEmail');
			if (uiEmail.value.trim().length < 1) {
				alert('이메일을 입력해주세요.');
				uiEmail.focus();
				return;
			}

			var uiPwd = document.querySelector('#uiPwd');
			if (uiPwd.value.trim().length < 1) {
				alert('비밀번호를 입력해주세요.');
				uiPwd.focus();
				return;
			}

			var param = {
				uiEmail : document.querySelector('#uiEmail').value,
				uiPwd : document.querySelector('#uiPwd').value
			}

			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/login');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					if (xhr.responseText) {
						var res = JSON.parse(xhr.responseText);
						alert('반갑습니다');
						location.reload();
						return;
					}
					alert('아이디나 비밀번호를 확인해주세요.');
				}
			}
			xhr.setRequestHeader('content-type',
					'application/json;charset=UTF-8');
			xhr.send(JSON.stringify(param));
		}