/**
 * 
 */
 
window.addEventListener("load", get);	

function get(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&size=9&sort=eiNum,asc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){	
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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

function newest(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&size=9&sort=eiStartDate,asc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			//console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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

function deadline(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&size=9&sort=eiEndDate,asc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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
	xhr.open('GET', '/exhibitions?status=CONFIRM&date=FUTURE&size=9&sort=eiName,asc&page=' + count); //ExhibitionController
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
				var res = JSON.parse(xhr.responseText);
				var html = '';						
				for (var exhibition of res.content) {
							html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
							html += '<article class="entry">';
							html += '<div class="entry-img">';
							html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' + exhibition.fileInfo.fiPath + '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
							html += '</div>';
							html += '<div class="row"><div class="col-sm-10">';
					        html += '<h2 class="entry-title">';
					        html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					        html += '</h2></div>';					
					        html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';							
							html += '<div class="entry-meta">';
							html += '<ul>';
							html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
							html += '</ul>';
					        html += '<ul>';
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

function priceCheap(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&price=1&size=9&sort=eiCharge,asc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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

function priceExpensive(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&price=1&size=9&sort=eiCharge,Desc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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

function pricefree(){
	count = 0;
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/exhibitions?status=CONFIRM&date=FUTURE&price=0&size=9&sort=eiNum,asc&page='+ count); //ExhibitionController
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var exhibition of res.content){
					html += '<div class="col-lg-4  col-md-6 d-flex align-items-stretch" data-aos="fade-up" >';
					html += '<article class="entry">';
					html += '<div class="entry-img">';
					html += '<img style="width:400px; height:400px" src=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\'" class="img-fluid" onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">';
					html += '</div>';
					html += '<div class="row"><div class="col-sm-10">'
					html += '<h2 class="entry-title">';
					html += '<a onclick="location.href=\'/views/exhibition/views?eiNum=' + exhibition.eiNum + '\'">' + exhibition.eiName + '</a>';
					html += '</h2></div>';					
					html += '<div class="col-sm-2"><a href=\'/resources/assets/img/exhibition/' +exhibition.fileInfo.fiPath+ '\' download><i class="gg-attachment"></i></a></div></div>';
					html += '<div class="entry-meta">';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-user"></i> <a>' + exhibition.eiArtist + '</a></li>';
					html += '</ul>';
					html += '<ul>';
					html += '<li class="d-flex align-items-center"><i class="icofont-wall-clock"></i><a>'+ exhibition.eiStartDate + '~'+ exhibition.eiEndDate +'</a></li>';
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

	function area(obj) {
		count = 0;
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/exhibition-getaddressList/' + obj.value + '?status=CONFIRM&date=FUTURE&size=9&sort=eiNum,asc&page=' + count); //ExhibitionController
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var res = JSON.parse(xhr.responseText);
				var html = '';
				for (var exhibition of res.content) {
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
							html += '</ul>';
					        html += '<ul>';
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

