/**
 * 
 */

window.onload = get;

function get() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-list?size=11&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';
				//console.log(res.data);			
				for (var exhibition of res.data) {
					var today = new Date();
					var endDate = new Date(exhibition.eiEndDate);
					//console.log("마감" + (today > endDate));
					//console.log(exhibition.eiStatus == 1);
					if (exhibition.eiStatus == 1) {
						if (today > endDate) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<h2 class="entry-title">';
							html += '<a>' + exhibition.eiName + '</a>';
							html += '</h2>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
						}
					}
				}
			
			document.querySelector('#exhibitionList').innerHTML += html;
			}
		}
		xhr.send();
	}

	function newest() {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-list?size=11&sort=eiStartDate,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
					var today = new Date();
					var endDate = new Date(exhibition.eiEndDate);
					//console.log("마감" + (today > endDate));				
					//console.log(exhibition.eiStatus == 1); 
					if (exhibition.eiStatus == 1) {
						if (today > endDate) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<h2 class="entry-title">';
							html += '<a>' + exhibition.eiName + '</a>';
							html += '</h2>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
						}
					}
				}
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

	function deadline() {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-list?size=11&sort=eiStartDate,Desc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
					var today = new Date();
					var endDate = new Date(exhibition.eiEndDate);
					//console.log("마감" + (today > endDate));				
					//console.log(exhibition.eiStatus == 1); 
					if (exhibition.eiStatus == 1) {
						if (today > endDate) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<h2 class="entry-title">';
							html += '<a>' + exhibition.eiName + '</a>';
							html += '</h2>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
						}
					}
				}
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

	//test
	function area(obj) {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-listDemoss/' + obj.value + '?size=11&sort=eiNum,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//console.log(xhr.responseText);
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
					var today = new Date();
					var endDate = new Date(exhibition.eiEndDate);
					//console.log("마감" + (today > endDate));				
					//console.log(exhibition.eiStatus == 1); 
					if (exhibition.eiStatus == 1) {
						if (today > endDate) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<h2 class="entry-title">';
							html += '<a>' + exhibition.eiName + '</a>';
							html += '</h2>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
						}
					}
				}
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

	//test
	function areaAsc() {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-list?size=11&sort=eiNum,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				//console.log(xhr.responseText);
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
					var today = new Date();
					var endDate = new Date(exhibition.eiEndDate);
					//console.log("마감" + (today > endDate));				
					//console.log(exhibition.eiStatus == 1); 
					if (exhibition.eiStatus == 1) {
						if (today > endDate) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<h2 class="entry-title">';
							html += '<a>' + exhibition.eiName + '</a>';
							html += '</h2>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '</a></li>';
							html += '</ul>';
							html += '</div>';
							html += '<div class="entry-content">';
							html += '<div style="HEIGHT: 10pt"></div>';
							html += '<div style="display:none" class="read-more">';
							html += '<input type="checkbox" onclick="sideMap()">';
							html += '</div>';
							html += '</div>';
							html += '</article>';
							html += '</div>';
						}
					}
				}
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}