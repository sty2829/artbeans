/**
 * 
 */
let nav = 0; //달력 월수를 결정하는 변수.
let clicked = null;
let events = localStorage.getItem('events') ? JSON.parse(localStorage.getItem('events')) : [];

const calendar = document.getElementById('calendar');
const newEventModal = document.getElementById('newEventModal');
const deleteEventModal = document.getElementById('deleteEventModal');
const backDrop = document.getElementById('modalBackDrop');
const eventTitleInput = document.getElementById('eventTitleInput');
const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function openModal(date) {
	clicked = date;

	const eventForDay = events.find(e => e.date === clicked);

	if (eventForDay) {
		document.getElementById('eventText').innerText = eventForDay.title;
		deleteEventModal.style.display = 'block';
	} else {
		newEventModal.style.display = 'block';
	}

	backDrop.style.display = 'block';
}

function load() {
	const dt = new Date();

	if (nav !== 0) {
		dt.setMonth(new Date().getMonth() + nav);
	}

	const day = dt.getDate();
	const month = dt.getMonth();
	const year = dt.getFullYear();

	const firstDayOfMonth = new Date(year, month, 1);
	const daysInMonth = new Date(year, month + 1, 0).getDate();

	const dateString = firstDayOfMonth.toLocaleDateString('en-us', {
		//아래 weekday, year month 디테일이 없을 경우 dateString는 1/1/2021로 찍힌다.
		weekday: 'long',
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
	});
	//위 과정을 거치면 Friday, 1/1/2021 이런 식으로 찍힌다.
	const paddingDays = weekdays.indexOf(dateString.split(', ')[0]);
	//위 배열의 경우 Friday가 첫번째 배열 / 두번째 배열은 1/1/2021 이다

	document.getElementById('monthDisplay').innerText =
		`${dt.toLocaleDateString('ko-kr', { month: 'long' })} ${year}`;

	calendar.innerHTML = '';

	for(let i = 1; i <= paddingDays + daysInMonth; i++) {
		const daySquare = document.createElement('div');
		daySquare.classList.add('day');
		//하루 하루 일자 들어가는 구간
		//public List<ExhibitionInfo> getExhibitionInfoNewestList(ExhibitionInfo exhibitionInfo) {
		//	return exhiRepo.findAllByOrderByEiStartDateAsc();
		//}
		const dayString = `${month + 1}/${i - paddingDays}/${year}`;

		if (i > paddingDays) {
			daySquare.innerText = i - paddingDays;
			
			const eventForDay = events.find(e => e.date === dayString);
			//여기서부터 전시회를 달력에 넣는 부분
			//console.log(eventForDay); 달력 일자 수대로 30개 undefined 나옴
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '/exhibition-list-newest'); //ExhibitionController
			xhr.onreadystatechange = function() {
				if (xhr.readyState==4 && xhr.status==200){
					var res = JSON.parse(xhr.responseText);
					// exhibition.eiStatus=0 진행할 전시회
					for (var exhibition of res){
						if (exhibition.eiStatus == 0) {
							eventForDay=exhibition.eiName
						}
					}
				}
			}
			
		if (i - paddingDays === day && nav === 0) {
			daySquare.id = 'currentDay';
		}

		if (eventForDay) {
			const eventDiv = document.createElement('div');
			eventDiv.classList.add('event');
			eventDiv.innerText = eventForDay.title;
			daySquare.appendChild(eventDiv);
		}

		//daySquare.addEventListener('click', () => openModal(dayString));
		daySquare.addEventListener('click', () => location.href="calendarListOneday");
	} else {
		daySquare.classList.add('padding');
	}

	calendar.appendChild(daySquare);
}
}

function closeModal() {
	eventTitleInput.classList.remove('error');
	newEventModal.style.display = 'none';
	deleteEventModal.style.display = 'none';
	backDrop.style.display = 'none';
	eventTitleInput.value = '';
	clicked = null;
	load();
}
/*
function saveEvent() {
	if (eventTitleInput.value) {
		eventTitleInput.classList.remove('error');

		events.push({
			date: clicked,
			title: eventTitleInput.value,
		});

		localStorage.setItem('events', JSON.stringify(events));
		closeModal();
	} else {
		eventTitleInput.classList.add('error');
	}
}

function deleteEvent() {
	events = events.filter(e => e.date !== clicked);
	localStorage.setItem('events', JSON.stringify(events));
	closeModal();
}
*/

function initButtons() {
	document.getElementById('nextButton').addEventListener('click', () => {
		nav++;
		load();
	});

	document.getElementById('backButton').addEventListener('click', () => {
		nav--;
		load();
	});

	//document.getElementById('saveButton').addEventListener('click', saveEvent);
	//document.getElementById('cancelButton').addEventListener('click', closeModal);
	//document.getElementById('deleteButton').addEventListener('click', deleteEvent);
	//document.getElementById('closeButton').addEventListener('click', closeModal);
}

initButtons();
load();