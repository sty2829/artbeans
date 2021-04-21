/**
 * 
 */
let nav = 0; //달력 월수를 결정하는 변수.

function getDate(date) {
	return date.toLocaleDateString().replace(/\./g, "").split(" ");
}

window.onload = function load() {
	const Tday = new Date();

	const nowMonth = Tday.getMonth() + nav;

	const [y, m] = getDate(new Date(Tday.setMonth(nowMonth)));
	const yearMonth = [y, m];

	const lastDay = getDate(new Date(y, m, 0)).pop() * 1;

	const day = new Date([y, m, 1].join("-")).getDay();

	const maxDay = Math.ceil((+day + lastDay) / 7) * 7;



	var exNum = new Array();
	var exNumExName = new Array();
	var yearMonthStrArray1 = yearMonth[1] + '';
	var monthStr = '';
	if (yearMonthStrArray1.length == 1) {
		monthStr = '0' + yearMonthStrArray1;
	}

	var yearMonthS = yearMonth[0] + '-' + monthStr + '-';

	
	let html = '';

	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-listDemo'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			// exhibition.eiStatus=0 진행할 전시회

			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					//exhibition.eiName
					//exhibition.eiStartDate ->2021-10-06
					
					exNum = exhibition.eiStartDate.split('-');
					
					exNum[1] = exNum[1].replace(/(^0+)/, ""); //05111이 5111로 변화
					exNum[2] = exNum[2].replace(/(^0+)/, "");
					//04월을 4월로 만들어주는 작업
					//console.log(exNum[0]+' '+exNum[1]); //2021 2 
					//console.log(yearMonth[0]+' '+yearMonth[1]) // 2021 4
					if (exNum[0] === yearMonth[0] && exNum[1] === yearMonth[1]) {
						//dateSel ${cls}의 경우 제대로된 칸이 나오려면 dateSel background 가 되어야함

						exNumExName.push({
							exNum: exNum[2],
							exName: exhibition.eiName
						})
					}
				}
			}

			//console.log(exNumExName); //{exNum: "14", exName: "연습용44"} 이런식으로 나옴

			for (let i = 1; i <= maxDay; i++) {
				const d = i > day && lastDay >= i - day ? i - day : ''; //d 1~30나옴
				const cls = !d ? 'background' : ''; //백그라운드가 나오면 padding 칸이다.

				let dStr = d + '';
				if (dStr.length == 1) {
					dStr = '0' + d;
				}
			
				let cntDay = 0; // 날짜별 전시회가 4개 이상일 경우 자르는 로직
				html += `<div id="insertEiNameSuper" class="dateSel ${cls}" >${d}`;
				for (let j = 0; j < exNumExName.length; j++) {
					if (cntDay < 3) {
						if (exNumExName[j].exNum == d) {
							cntDay++;
							let exNameGet = exNumExName[j].exName;
							if (exNumExName[j].exName.length > 4) {
								exNameGet = exNumExName[j].exName.substring(0, 4) + '...';
							}
							html += '<div id="insertEiName"  onclick="location.href =\'/views/exhibition/calendar-list-oneday?eiStartDate=' + yearMonthS + dStr + '\'">' + exNameGet + '</div>';
						}
					} else {
						html += '';
					}
				}
				html += '</div>';
			}

			document.querySelector('.dateSel').innerHTML = html;
			document.querySelector('.date_text').innerText = `${y}년 ${m}월` + ' 개봉일';
		}
	}
	xhr.send();



	/*	for (let i = 1; i <= maxDay; i++) {
			const d = i > day && lastDay >= i - day ? i - day : '';
			const cls = !d ? 'background' : '';
			html += `<div class="dateSel ${cls}">${d}</div>`;
		}
	
		document.querySelector('.dateSel').innerHTML = html;
		document.querySelector('.date_text').innerText = `${y}년 ${m}월`;
		*/
}



function backButton() {

	nav--;
	const Tday = new Date();

	const nowMonth = Tday.getMonth() + nav;

	const [y, m] = getDate(new Date(Tday.setMonth(nowMonth)));
	const yearMonth = [y, m];

	const lastDay = getDate(new Date(y, m, 0)).pop() * 1;

	const day = new Date([y, m, 1].join("-")).getDay();

	const maxDay = Math.ceil((+day + lastDay) / 7) * 7;



	var exNum = new Array();
	var exNumExName = new Array();
	var yearMonthStrArray1 = yearMonth[1] + '';
	var monthStr = '';
	if (yearMonthStrArray1.length == 1) {
		monthStr = '0' + yearMonthStrArray1;
	}

	var yearMonthS = yearMonth[0] + '-' + monthStr + '-';


	let html = '';

	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-listDemo'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			// exhibition.eiStatus=0 진행할 전시회


			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					//exhibition.eiName
					//exhibition.eiStartDate ->2021-10-06
					exNum = exhibition.eiStartDate.split('-');
					//console.log(exNum);
					exNum[1] = exNum[1].replace(/(^0+)/, ""); //05111이 5111로 변화
					exNum[2] = exNum[2].replace(/(^0+)/, "");
					//04월을 4월로 만들어주는 작업

					if (exNum[0] === yearMonth[0] && exNum[1] === yearMonth[1]) {
						//console.log(exhibition.eiName);
						//dateSel ${cls}의 경우 제대로된 칸이 나오려면 dateSel background 가 되어야함

						exNumExName.push({
							exNum: exNum[2],
							exName: exhibition.eiName
						})
					}
				}
			}

			//console.log(exNumExName); //{exNum: "14", exName: "연습용44"} 이런식으로 나옴

			for (let i = 1; i <= maxDay; i++) {
				const d = i > day && lastDay >= i - day ? i - day : ''; //d 1~30나옴
				const cls = !d ? 'background' : ''; //백그라운드가 나오면 padding 칸이다.

				let dStr = d + '';
				if (dStr.length == 1) {
					dStr = '0' + d;
				}
				let cntDay = 0; // 날짜별 전시회가 4개 이상일 경우 자르는 로직
				html += `<div id="insertEiNameSuper" class="dateSel ${cls}" >${d}`;
				for (let j = 0; j < exNumExName.length; j++) {
					if (cntDay < 3) {
						if (exNumExName[j].exNum == d) {
							cntDay++;
							let exNameGet = exNumExName[j].exName;
							if (exNumExName[j].exName.length > 4) {
								exNameGet = exNumExName[j].exName.substring(0, 4) + '...';
							}
							html += '<div id="insertEiName"  onclick="location.href =\'/views/exhibition/calendar-list-oneday?eiStartDate=' + yearMonthS + dStr + '\'">' + exNameGet + '</div>';
						}
					} else {
						html += '';
					}
				}
				html += '</div>';
			}

			document.querySelector('.dateSel').innerHTML = html;
			document.querySelector('.date_text').innerText = `${y}년 ${m}월` + ' 개봉일';
		}
	}
	xhr.send();



}

function nextButton() {

	nav++;
	const Tday = new Date();

	const nowMonth = Tday.getMonth() + nav;

	const [y, m] = getDate(new Date(Tday.setMonth(nowMonth)));
	const yearMonth = [y, m];

	const lastDay = getDate(new Date(y, m, 0)).pop() * 1;

	const day = new Date([y, m, 1].join("-")).getDay();

	const maxDay = Math.ceil((+day + lastDay) / 7) * 7;



	var exNum = new Array();
	var exNumExName = new Array();
	var yearMonthStrArray1 = yearMonth[1] + '';
	var monthStr = '';
	if (yearMonthStrArray1.length == 1) {
		monthStr = '0' + yearMonthStrArray1;
	}

	var yearMonthS = yearMonth[0] + '-' + monthStr + '-';


	let html = '';

	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-listDemo'); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var res = JSON.parse(xhr.responseText);
			// exhibition.eiStatus=0 진행할 전시회


			for (var exhibition of res.data) {
				if (exhibition.eiStatus == 1) {
					//exhibition.eiName
					//exhibition.eiStartDate ->2021-10-06
					exNum = exhibition.eiStartDate.split('-');
					//console.log(exNum);
					exNum[1] = exNum[1].replace(/(^0+)/, ""); //05111이 5111로 변화
					exNum[2] = exNum[2].replace(/(^0+)/, "");
					//04월을 4월로 만들어주는 작업

					if (exNum[0] === yearMonth[0] && exNum[1] === yearMonth[1]) {
						//console.log(exhibition.eiName);
						//dateSel ${cls}의 경우 제대로된 칸이 나오려면 dateSel background 가 되어야함

						exNumExName.push({
							exNum: exNum[2],
							exName: exhibition.eiName
						})
					}
				}
			}

			//console.log(exNumExName); //{exNum: "14", exName: "연습용44"} 이런식으로 나옴

			for (let i = 1; i <= maxDay; i++) {
				const d = i > day && lastDay >= i - day ? i - day : ''; //d 1~30나옴
				const cls = !d ? 'background' : ''; //백그라운드가 나오면 padding 칸이다.

				let dStr = d + '';
				if (dStr.length == 1) {
					dStr = '0' + d;
				}
				let cntDay = 0; // 날짜별 전시회가 4개 이상일 경우 자르는 로직
				html += `<div id="insertEiNameSuper" class="dateSel ${cls}" >${d}`;
				for (let j = 0; j < exNumExName.length; j++) {
					if (cntDay < 3) {
						if (exNumExName[j].exNum == d) {
							cntDay++;
							let exNameGet = exNumExName[j].exName;
							if (exNumExName[j].exName.length > 4) {
								exNameGet = exNumExName[j].exName.substring(0, 4) + '...';
							}
							html += '<div id="insertEiName"  onclick="location.href =\'/views/exhibition/calendar-list-oneday?eiStartDate=' + yearMonthS + dStr + '\'">' + exNameGet + '</div>';
						}
					} else {
						html += '';
					}
				}
				html += '</div>';
			}

			document.querySelector('.dateSel').innerHTML = html;
			document.querySelector('.date_text').innerText = `${y}년 ${m}월` + ' 개봉일';
		}
	}
	xhr.send();

}
