/**
 * 
 */

//window.onload = get;
window.addEventListener("load", get);	

function get() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-closelist?size=9&sort=eiNum,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';			
				for (var exhibition of res.data) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">'
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
			
			document.querySelector('#exhibitionList').innerHTML += html;
			}
		}
		xhr.send();
	}

	function newest() {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-closelist?size=9&sort=eiStartDate,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">'
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';							
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

	function deadline() {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-closelist?size=9&sort=eiEndDate,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.data) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">'
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
				document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}
	
	function areaAll() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/exhibition-closelist?size=9&sort=eiName,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';			
				for (var exhibition of res.data) {					
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">'
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
			
			document.querySelector('#exhibitionList').innerHTML = html;
			}
		}
		xhr.send();
	}

	//test
	function area(obj) {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-listDemoss/' + obj.value + '?size=30&sort=eiNum,asc&page=' + count); //ExhibitionController
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
							html += '<div class="row"><div class="col-sm-10">'
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';	
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>' + exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
				window.addEventListener("scroll",  function(e) {
                if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                    count++;
                    area(obj);
                   }
                });
			}
		}
		xhr.send();
	}
