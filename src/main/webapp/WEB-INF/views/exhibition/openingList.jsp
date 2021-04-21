<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>진행중인 전시회 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<script src="/resources/user/js/window/infinityScroll.js"></script>
<script src="/resources/user/js/exhibition/openingList.js"></script>
<link rel="stylesheet" href="/resources/user/css/right-menu.css">
<style>
#side1 {
	position: relative;
	margin-top: 0%;
	right: 0px;
	height: 10%;
	display: inline-block;
	color: black;
}
</style>
</head>
<body>
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container"></div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="row">
					<div class="overlay"></div>
					<div id="sidebar">
						<div
							style="border: 0px; border-radius: 10px 0px 0px 10px; top: 0%; margin-left: 0%; width: 100%; height: 370px; position: relative; overflow: hidden; background: url(&quot;http://static.naver.net/maps/mantle/1x/pattern_1.png&quot;) 0px 0px repeat transparent;"
							id="map" tabindex="0">
							<div
								style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0; cursor: url(&quot;http://static.naver.net/maps/mantle/1x/openhand.cur&quot;), default;">
								<div
									style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0;">
									<div
										style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1;">
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 0; user-select: none;"></div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; user-select: none;">
											<div
												style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;">
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -96px; left: 190px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55903/25371.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 160px; left: 190px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55903/25372.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -352px; left: 190px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55903/25370.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -352px; left: 446px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55904/25370.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 160px; left: -66px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55902/25372.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -96px; left: 446px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55904/25371.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -96px; left: -66px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55902/25371.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 160px; left: 446px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55904/25372.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -352px; left: -66px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55902/25370.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -352px; left: 702px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55905/25370.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 160px; left: -322px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55901/25372.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -96px; left: 702px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55905/25371.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -96px; left: -322px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55901/25371.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 160px; left: 702px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55905/25372.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -352px; left: -322px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55901/25370.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
											</div>
										</div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 100;">
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 101;"></div>
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 103;">
												<div title=""
													style="position: absolute; overflow: hidden; box-sizing: content-box !important; cursor: inherit; left: 338px; top: 102px; width: 22px; height: 33px;">
													<map name="nmarker-00F39BFB-FAB8-48F0-9BF2-C233F968EBD3">
														<area href="#" shape="poly"
															coords="11,0,9,0,6,1,4,2,2,4,0,8,0,12,1,14,2,16,5,19,5,20,6,23,8,26,9,30,9,34,13,34,13,30,14,26,16,23,17,20,17,19,20,16,21,14,22,12,22,12,22,8,20,4,18,2,16,1,13,0"
															alt="마커의 경위도는 127.087776,37.597248 입니다."
															style="display: block; cursor: pointer;">
													</map>
													<img draggable="false" unselectable="on"
														src="http://static.naver.net/maps/mantle/1x/marker-default.png"
														alt=""
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; position: absolute; cursor: inherit; width: 22px; height: 33px; left: 0px; top: 0px;"><img
														src="http://static.naver.net/maps/mantle/1x/dot.gif"
														alt=""
														usemap="#nmarker-00F39BFB-FAB8-48F0-9BF2-C233F968EBD3"
														style="position: absolute; border: 0px; left: 0px; top: 0px; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; user-select: none; width: 22px; height: 33px;">
												</div>
											</div>
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 106;"></div>
										</div>
									</div>
									<div
										style="position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(255, 255, 255); z-index: 10000; opacity: 0.5;"></div>
								</div>
							</div>
							<div
								style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; right: 0px;">
								<div
									style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: right; height: 21px;">
									<div
										style="position: relative; width: 53px; height: 14px; margin: 0px 12px 7px 2px; overflow: hidden; pointer-events: auto;">
										<span
											style="display: block; margin: 0; padding: 0 4px; text-align: center; font-size: 10px; line-height: 11px; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic,&amp; amp; amp; amp; quot; 나눔고딕 &amp;amp; amp; amp; quot; , Dotum ,&amp;amp; amp; amp; quot; 돋움 &amp;amp; amp; amp; quot; , sans-serif; font-weight: bold; color: #000; text-shadow: -1px 0 rgba(255, 255, 255, 0.3), 0 1px rgba(255, 255, 255, 0.3), 1px 0 rgba(255, 255, 255, 0.3), 0 -1px rgba(255, 255, 255, 0.3);">100m</span><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-b.png"
											width="45" height="4" alt=""
											style="position: absolute; left: 4px; bottom: 0px; z-index: 2; display: block; width: 45px; height: 4px; overflow: hidden; margin: 0px; padding: 0px; border: 0px none; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-l.png"
											width="4" height="10" alt=""
											style="position: absolute; left: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-r.png"
											width="4" height="10" alt=""
											style="position: absolute; right: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;">
									</div>
								</div>
								<div
									style="border: 0px none; margin: -1px 0px 0px; padding: 0px; pointer-events: none; float: right; height: 22px;">
									<a
										href="https://ssl.pstatic.net/static/maps/mantle/notice/legal.html"
										target="_blank"
										style="display: block; width: 48px; height: 17px; overflow: hidden; margin: 0px 5px 5px 12px; pointer-events: auto;"><img
										src="http://static.naver.net/maps/mantle/1x/naver-normal-new.png"
										width="48" height="17" alt="NAVER"
										style="display: block; width: 48px; height: 17px; overflow: hidden; border: 0 none; margin: 0; padding: 0; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"></a>
								</div>
							</div>
							<div
								style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; left: 0px;">
								<div
									style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: left; height: 19px;">
									<div class="map_copyright"
										style="margin: 0px; padding: 0px 0px 2px 10px; height: 19px; line-height: 19px; color: rgb(68, 68, 68); font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; clear: both; white-space: nowrap; pointer-events: none;">
										<div style="float: left;">
											<span style="white-space: pre; color: rgb(68, 68, 68);">©
												NAVER Corp.</span>
										</div>
										<a href="#"
											style="font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; line-height: 19px; margin: 0px 0px 0px 5px; padding: 0px; color: rgb(68, 68, 68); float: left; pointer-events: auto; text-decoration: underline; display: none;">더보기</a>
										<div style="float: left;">
											<a target="_blank"
												href="http://www.openstreetmap.org/copyright"
												style="pointer-events: auto; white-space: pre; display: none; color: rgb(68, 68, 68);">
												/OpenStreetMap</a>
										</div>
									</div>
								</div>
							</div>
							<div
								style="border: 1px solid rgb(41, 41, 48); background: rgb(255, 255, 255); padding: 15px; color: rgb(51, 51, 51); position: absolute; font-size: 11px; line-height: 1.5; clear: both; display: none; max-width: 350px !important; max-height: 300px !important;">
								<h5
									style="font-size: 12px; margin-top: 0px; margin-bottom: 10px;">지도
									데이터</h5>
								<a href="#"
									style="position: absolute; top: 8px; right: 8px; width: 14px; height: 14px; font-size: 14px; line-height: 14px; display: block; overflow: hidden; color: rgb(68, 68, 68); text-decoration: none; font-weight: bold; text-align: center;">x</a>
								<div>
									<span
										style="white-space: pre; color: rgb(68, 68, 68); float: left;">©
										NAVER Corp.</span><a target="_blank"
										href="http://www.openstreetmap.org/copyright"
										style="pointer-events: auto; white-space: pre; color: rgb(68, 68, 68); float: left; display: none;">
										/OpenStreetMap</a>
								</div>
							</div>
							<div
								style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0; cursor: url(&quot;http://static.naver.net/maps/mantle/1x/openhand.cur&quot;), default;">
								<div
									style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0;">
									<div
										style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1;">
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 0; user-select: none;"></div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; user-select: none;">
											<div
												style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;">
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -188px; left: 384px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55958/25651.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 324px; left: 128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55957/25653.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 68px; left: 384px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55958/25652.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 68px; left: 128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55957/25652.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 324px; left: 384px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55958/25653.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -188px; left: 128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55957/25651.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -188px; left: 640px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55959/25651.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 324px; left: -128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55956/25653.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 68px; left: 640px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55959/25652.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 68px; left: -128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55956/25652.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: 324px; left: 640px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55959/25653.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
												<div draggable="false" unselectable="on"
													style="position: absolute; top: -188px; left: -128px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;">
													<img draggable="false" unselectable="on" alt=""
														crossorigin="anonymous" width="256" height="256"
														src="http://nrbe.map.naver.net/styles/basic/1616667775/16/55956/25651.png?mt=bg.ol.sw.ar.lko"
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
												</div>
											</div>
										</div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 100;">
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 101;"></div>
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 103;">
												<div title="xy연습3"
													style="position: absolute; overflow: hidden; box-sizing: content-box !important; cursor: inherit; left: 338px; top: 102px; width: 22px; height: 33px;">
													<map name="nmarker-633D47E4-AF31-47CE-BF95-0525424C5209">
														<area href="#" shape="poly"
															coords="11,0,9,0,6,1,4,2,2,4,0,8,0,12,1,14,2,16,5,19,5,20,6,23,8,26,9,30,9,34,13,34,13,30,14,26,16,23,17,20,17,19,20,16,21,14,22,12,22,12,22,8,20,4,18,2,16,1,13,0"
															alt="마커의 경위도는 127.3857263,36.3670479 입니다."
															style="display: block; cursor: pointer;">
													</map>
													<img draggable="false" unselectable="on"
														src="http://static.naver.net/maps/mantle/1x/marker-default.png"
														alt=""
														style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; position: absolute; cursor: inherit; width: 22px; height: 33px; left: 0px; top: 0px;"><img
														src="http://static.naver.net/maps/mantle/1x/dot.gif"
														alt=""
														usemap="#nmarker-633D47E4-AF31-47CE-BF95-0525424C5209"
														style="position: absolute; border: 0px; left: 0px; top: 0px; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; user-select: none; width: 22px; height: 33px;">
												</div>
											</div>
											<div
												style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 106;">
												<div
													style="position: absolute; top: 41px; left: 314px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; cursor: default; box-sizing: content-box !important;">
													<div
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 1px solid rgb(51, 51, 51); display: block; cursor: default; box-sizing: content-box !important; background: rgb(255, 255, 255);">
														<div
															style="margin: 0px; padding: 0px; border: 0px solid transparent; display: inline-block; box-sizing: content-box !important; width: 68px; height: 35px;">
															<div style="padding: 4px 4px;">
																<div style="font-weight: bold; padding-bottom: 3px;">xy연습3</div>
															</div>
														</div>
														<div
															style="margin: 0px; padding: 0px; width: 0px; height: 0px; position: absolute; border-width: 24px 10px 0px; border-style: solid; border-color: rgb(51, 51, 51) transparent transparent; border-image: initial; pointer-events: none; box-sizing: content-box !important; bottom: -25px; left: 24px;"></div>
														<div
															style="margin: 0px; padding: 0px; width: 0px; height: 0px; position: absolute; border-width: 24px 10px 0px; border-style: solid; border-color: rgb(255, 255, 255) transparent transparent; border-image: initial; pointer-events: none; box-sizing: content-box !important; bottom: -22px; left: 24px;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div
										style="position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(255, 255, 255); z-index: 10000; opacity: 0.5;"></div>
								</div>
							</div>
							<div
								style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; right: 0px;">
								<div
									style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: right; height: 21px;">
									<div
										style="position: relative; width: 52px; height: 14px; margin: 0px 12px 7px 2px; overflow: hidden; pointer-events: auto;">
										<span
											style="display: block; margin: 0; padding: 0 4px; text-align: center; font-size: 10px; line-height: 11px; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic,&amp; amp; amp; amp; quot; 나눔고딕 &amp;amp; amp; amp; quot; , Dotum ,&amp;amp; amp; amp; quot; 돋움 &amp;amp; amp; amp; quot; , sans-serif; font-weight: bold; color: #000; text-shadow: -1px 0 rgba(255, 255, 255, 0.3), 0 1px rgba(255, 255, 255, 0.3), 1px 0 rgba(255, 255, 255, 0.3), 0 -1px rgba(255, 255, 255, 0.3);">100m</span><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-b.png"
											width="44" height="4" alt=""
											style="position: absolute; left: 4px;; bottom: 0; z-index: 2; display: block; width: 44px; height: 4px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-l.png"
											width="4" height="10" alt=""
											style="position: absolute; left: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"><img
											src="http://static.naver.net/maps/mantle/1x/scale-normal-r.png"
											width="4" height="10" alt=""
											style="position: absolute; right: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;">
									</div>
								</div>
								<div
									style="border: 0px none; margin: -1px 0px 0px; padding: 0px; pointer-events: none; float: right; height: 22px;">
									<a
										href="https://ssl.pstatic.net/static/maps/mantle/notice/legal.html"
										target="_blank"
										style="display: block; width: 48px; height: 17px; overflow: hidden; margin: 0px 5px 5px 12px; pointer-events: auto;"><img
										src="http://static.naver.net/maps/mantle/1x/naver-normal-new.png"
										width="48" height="17" alt="NAVER"
										style="display: block; width: 48px; height: 17px; overflow: hidden; border: 0 none; margin: 0; padding: 0; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"></a>
								</div>
							</div>
							<div
								style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; left: 0px;">
								<div
									style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: left; height: 19px;">
									<div class="map_copyright"
										style="margin: 0px; padding: 0px 0px 2px 10px; height: 19px; line-height: 19px; color: rgb(68, 68, 68); font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; clear: both; white-space: nowrap; pointer-events: none;">
										<div style="float: left;">
											<span style="white-space: pre; color: rgb(68, 68, 68);">©
												NAVER Corp.</span>
										</div>
										<a href="#"
											style="font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; line-height: 19px; margin: 0px 0px 0px 5px; padding: 0px; color: rgb(68, 68, 68); float: left; pointer-events: auto; text-decoration: underline; display: none;">더보기</a>
										<div style="float: left;">
											<a target="_blank"
												href="http://www.openstreetmap.org/copyright"
												style="pointer-events: auto; white-space: pre; display: none; color: rgb(68, 68, 68);">
												/OpenStreetMap</a>
										</div>
									</div>
								</div>
							</div>
							<div
								style="border: 1px solid rgb(41, 41, 48); background: rgb(255, 255, 255); padding: 15px; color: rgb(51, 51, 51); position: absolute; font-size: 11px; line-height: 1.5; clear: both; display: none; max-width: 350px !important; max-height: 300px !important;">
								<h5
									style="font-size: 12px; margin-top: 0px; margin-bottom: 10px;">지도
									데이터</h5>
								<a href="#"
									style="position: absolute; top: 8px; right: 8px; width: 14px; height: 14px; font-size: 14px; line-height: 14px; display: block; overflow: hidden; color: rgb(68, 68, 68); text-decoration: none; font-weight: bold; text-align: center;">x</a>
								<div>
									<span
										style="white-space: pre; color: rgb(68, 68, 68); float: left;">©
										NAVER Corp.</span><a target="_blank"
										href="http://www.openstreetmap.org/copyright"
										style="pointer-events: auto; white-space: pre; color: rgb(68, 68, 68); float: left; display: none;">
										/OpenStreetMap</a>
								</div>
							</div>
						</div>
						<<div style="clear:both; height:10px;"></div>
						<div class="map_bottom">
				<span onclick="want()">찜목록 추가</span>
				<span onclick="urlcopy();">URL 복사</span>
				<span onclick="print();">인쇄</span>
			</div>
			<div id="sideMapList">
					
					</div>
					</div>
					
					




					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="margin: 5px">날짜순</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<button class="dropdown-item" type="button" onclick="newest()">오픈순</button>
							<button class="dropdown-item" type="button" onclick="deadline()">마감순</button>
						</div>
					</div>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin: 5px">지역순</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button" onclick="areaAll()">전체지역</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="서울">서울</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경기">경기도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="인천">인천</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="강원">강원도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="충청남도">충청남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="충청북도">충청남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="전라남도">전라남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="전라북도">전라북도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경상북도">경상북도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="경상남도">경상남도</button>
								<button class="dropdown-item" type="button" onclick="area(this)" value="부산">부산</button>
							</div>
					    </div>
					

					</div>

					<img id="sidebarCollapse" src = "/resources/user/img/sidebtn/mapIcon.png">
					
			</div>
		</section>

		<section id="blog" class="blog">
			<div class="container">
				<div class="row" id="exhibitionList"></div>
			</div>
		</section>

	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/resources/user/js/map/right-menu.js"></script>
</body>
</html>