<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!--<c:if test="${admin eq null}">
<script>
	alert('운영 관련 접근 불허');
	location.href='/views/login';
</script>
</c:if>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수정 페이지</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/moveblock.js"></script>
<script src="/resources/user/js/admin/admin-ei-update.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f6ce9d8468a6bd79f89c359862923de3&libraries=services"></script>
<script src="/resources/user/js/map/addrsearch.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
<script src="/resources/user/js/ckeditor/ckeditorSave.js"></script>
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
								<h4>전시회 번호</h4>
							</div>
							<div class="phone">
								<h4>전시회 상태값</h4>
							</div>
							<div class="phone" id="gallertySelectDivMenu">
								<h4>현재 갤러리</h4>
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
								<input type="text" id="eiNum" class="form-control" readonly/>
								<div style="HEIGHT: 3pt"></div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="col-md-6 form-group">
								<!-- 나중에 변경 -->
									<select class="col-md-6 form-group"
									style="WIDTH: 250pt; HEIGHT: 30pt" id="eiStatus"
									>
										<option value="0">0</option>
										<option value="1">1</option>
									</select>
							</div>
						</div>

						<div id="gallertySelectDiv" class="form-row">
							<div class="col-md-6 form-group">
								<select class="col-md-6 form-group"
									style="WIDTH: 250pt; HEIGHT: 30pt" id="gallery"
									name="galleryOption()"></select>
							</div>
							
						</div>
												
						<div class="form-group">
							<input type="text" class="form-control" id="eiName"
								placeholder="전시회명" />
							<div style="HEIGHT: 5pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiArtist"
								placeholder="작가명" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" id="eiCharge"
								placeholder="전시회 가격" />
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
							<input type="text" class="form-control" id="eiStartTime"
								placeholder="00:00" />
							<div style="HEIGHT: 8pt"></div>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="eiEndTime"
								placeholder="00:00" />
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
						<button class="get-started-btn ml-auto" onclick="doInsert()">전시회등록 신청</button>
					</div>
				</div>
			</div>
		</section>
	</main>


	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>