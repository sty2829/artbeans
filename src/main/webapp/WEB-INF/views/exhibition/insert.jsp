<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 등록 페이지</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/moveblock.js"></script>
<script src="/resources/user/js/exhibition/insert.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6ce9d8468a6bd79f89c359862923de3&libraries=services"></script>
<script src="/resources/user/js/map/addrsearch.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<script src="/resources/user/js/ckeditor/ckeditorSave.js"></script>
<link href="/resources/node_modules/flatpickr/dist/flatpickr.min.css" rel="stylesheet"/>
<script src=/resources/node_modules/flatpickr/dist/flatpickr.js></script>
</head>
<body oncontextmenu="return false">
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">
				<div class="row mt-5">
					<div class="col-lg-4">
						<div class="info">
							<div class="address">
								<h4>신청자 성함</h4>
							</div>
							<div class="phone" id="gallertySelectDivMenu">
								<h4>신청자 갤러리</h4>
							</div>

							<!-- 갤러리 등록 -->
							<div id="galleryInsertDivMenu" style="display: none"
								class="phone">
								<div class="address">
									<h4>갤러리명</h4>
									<div style="HEIGHT: 8pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 전화번호</h4>
									<div style="HEIGHT: 8pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 오픈시간</h4>
									<div style="HEIGHT: 10pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 종료시간</h4>
									<div style="HEIGHT: 15pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 홈페이지</h4>
									<div style="HEIGHT: 10pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 휴일</h4>
									<div style="HEIGHT: 10pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 주소</h4>
									<div style="HEIGHT: 10pt"></div>
								</div>
								<div class="address">
									<h4>갤러리 이미지</h4>
									<div style="HEIGHT: 30pt"></div>
								</div>
							</div>

							<div class="phone">
								<h4>전시회명</h4>
							</div>
							<div class="phone">
								<h4>작가명</h4>
							</div>
							<div class="phone">
								<h4>전시회 가격</h4>
							</div>
							<div class="phone">
								<h4>전시회 시작일</h4>
							</div>
							<div class="phone">
								<h4>전시회 종료일</h4>
							</div>
							<div class="phone">
								<h4>전시회 시작시간</h4>
							</div>
							<div class="phone">
								<h4>전시회 종료시간</h4>
							</div>

							<div class="phone">
								<h4>대표 포스터사진</h4>
							</div>
							<div class="phone">
								<h4>전시회 설명</h4>
							</div>

						</div>
					</div>

					<!-- 입력란 -->
					<div class="col-lg-8 mt-5 mt-lg-0">
						<div class="form-row">
							<div class="col-md-6 form-group">
								<!-- 나중에 변경 -->
								<input type="text" id="uiName" class="form-control" readonly />
							</div>
						</div>

						<div id="gallertySelectDiv" class="form-row">
							<div class="col-md-6 form-group">
								<select class="col-md-6 form-group"
									style="WIDTH: 250pt; HEIGHT: 30pt" id="gallery"
									name="galleryOption()"></select>
							</div>
							<button class="get-started-btn ml-auto"
								style="WIDTH: 150pt; HEIGHT: 30pt" onclick="showGalleryDiv()">갤러리 등록하기</button>
						</div>

						<!-- 갤러리 등록 -->
						<div id="galleryInsertDiv" style="display: none">
							<div class="form-group">
								<input type="text" id="giName" placeholder="갤러리명">
							</div>
							<div class="form-group">
								<input type="text" id="giRphoneNumber" placeholder="갤러리 전화번호">
							</div>
							<div class="form-group">
								<input type="text" id="giStartTime" placeholder="시간을 선택해주세요." style="background: white">
							</div>
							<div class="form-group">
								<input type="text" id="giEndTime" placeholder="시간을 선택해주세요." style="background: white">
							</div>
							<div class="form-group">
								<input type="text" id="giHomepage" placeholder="갤러리 홈페이지">
							</div>
							<div class="form-group">
								<input type="text" id="giHoliday" placeholder="갤러리 휴일">
							</div>
							<div class="form-group">
								<input type="text" id="giAddress" placeholder="갤러리 주소">
								<button type="button" onclick="sample4_execDaumPostcode()" data-toggle="modal" data-target="#myModal" class="get-started-btn ml-auto">주소검색</button>
								
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog modal-xl">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<!-- 주소찾기 -->
												<input type="hidden" id="sample4_postcode">
												<input type="hidden" id="sample4_extraAddress">
												<input type="hidden" size="50px" id="sample4_roadAddress">
												<input type="hidden" id="sample4_jibunAddress">
												<span id="guide" style="color: #999; display: none"></span>
												<input type="hidden" size="40px" id="sample4_detailAddress">
											</div>
											<div class="modal-body">
												<div id="map" style="width: 100%; height: 350px;"></div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="form-group">
								<input type="file" id="fiFile1">
							</div>
							<div class="form-group">
								<button class="get-started-btn ml-auto" style="WIDTH: 70pt; HEIGHT: 30pt" onclick="insertGallery()">등록</button>
								<button class="get-started-btn ml-auto" style="WIDTH: 70pt; HEIGHT: 30pt" onclick="showGalleryDiv()">취소</button>
							</div>
						</div>
						
						<!-- 갤러리 등록 -->
						<div class="form-group">
							<input type="text" class="form-control" id="eiName"
								placeholder="전시회명" />
							<div style="HEIGHT: 10pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiArtist"
								placeholder="작가명" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" id="eiCharge" placeholder="전시회 가격" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="date" class="form-control" id="eiStartDate" />
							<div style="HEIGHT: 10pt"></div>
						</div>

						<div class="form-group">
							<input type="date" class="form-control" id="eiEndDate" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiStartTime" placeholder="클릭해서 시간을 선택해주세요." style="background: white" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiEndTime" placeholder="클릭해서 시간을 선택해주세요." style="background: white" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="file" class="form-control" id="fiFile2" />
							<div style="HEIGHT: 10pt"></div>
						</div>

						<!-- ckeditor -->
						<div class="form-group">
							<div id="editor">내용을 입력하고 저장을 눌러주세요.</div>
							<button onclick="save()">저장</button>
						</div>
						
						
						<script>
						 var editor;
							ClassicEditor
							.create( document.querySelector('#editor'),{
								removePlugins: ['Table', 'MediaEmbed'],
								ckfinder : {
									uploadUrl : '/exhibition-insert-editorimage'
								}
							 })
						.then(obj => {editor = obj;})
						.catch(error => {console.error(error);});
							
							
					    </script>			
		
						<textarea id="eiContent" style="display: none"></textarea>
						
						<script>
						var uiNum = '${userInfo.uiNum}';
						var uiName = '${userInfo.uiName}';
						
						flatpickr('#eiStartTime', {
							enableTime: true,
							noCalendar: true,
							time_24hr: true,
							dateFormat: "H:i",
							defaultHour: 08,
							minuteIncrement: 10
						});
						flatpickr('#eiEndTime', {
							enableTime: true,
							noCalendar: true,
							time_24hr: true,
							dateFormat: "H:i",
							defaultHour: 18,
							minuteIncrement: 10
						});
						flatpickr('#giStartTime', {
							enableTime: true,
							noCalendar: true,
							time_24hr: true,
							dateFormat: "H:i",
							defaultHour: 08,
							minuteIncrement: 10
						});
						flatpickr('#giEndTime', {
							enableTime: true,
							noCalendar: true,
							time_24hr: true,
							dateFormat: "H:i",
							defaultHour: 18,
							minuteIncrement: 10
						});
						
						</script>
						
						<button class="get-started-btn ml-auto" onclick="doInsert()">전시회등록 신청</button>
					</div>
				</div>
			</div>
		</section>
	</main>


	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>