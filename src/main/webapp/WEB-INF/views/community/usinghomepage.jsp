<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용방법</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>

  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->
		
 <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container">

        <div class="section-title">
          <h2>이용방법</h2>          
        </div>

        <div class="row">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#tab-1">ArtBeans</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-2">전시회 등록 비용</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-3">등록에 필요한 자료</a>
              </li>
            </ul>
          </div>
          
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>ArtBeans</h3>
                    <p class="font-italic">아트빈은 이미지의 상상의 폭과 사회적 효용성을 높이기 위해 고안된 비물질 아카이브 시스템으로 1999년부터 지금까지 시각문화관련 전시/행사를 알리고 있습니다.</p>
                    <p>2005년 유네스코한국위원회, 한국정보문화진흥원, 다음커뮤니케이션이 공동주최한 '정보트러스트 어워드 2005'에서' 우리가 보존해야 할 인터넷 문화유산'으로 선정된 바 있습니다. 자체 컨텐츠가 아닌 경우는 다음과 같이 일정의 비용을 선입금으로 받고 있습니다. 이용하는 분들의 협조를 부탁드립니다.</p>
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>전시회 등록 비용</h3>
                    <p class="font-italic">1. 1인이 모든 비용을 부담하는 순수 예술활동 및 개인전_ 8만8천원<br>
                                           2. 기관(업체/재단/협회/학교 등)이 비용을 부담하는 전시/행사_ 11만원<br>
                                           3. 2인 이상이 출품하는 순수 기획/그룹/단체전 등_ 11만원<br>
                                           4. 시각문화관련 세미나/심포지엄/강좌/파티/행사 등_ 11만원<br>
                                           *단, 자료집 발간 학술행사를 5회 이상 개최한 경우_무료<br>
                                           5. 시각문화관련 각종 공개모집(수강생/신입생/직원/공모전 등)_ 22만원<br>
                                           6. 시각문화관련 신간도서의 홍보는 11만원 상당의 책자로 받고 있습니다.<br>
                                           7. 동일주최 일괄계약은 내용에 무관하게 12건 기준 110만원입니다.</p>
                    <p>-. 모든 항목의 자료는 이용자가 희망일 7일전까지 제공해야 합니다.<br> 7일전까지 게재자료 미접수 시 게재일이 늦어질 수 있습니다.<br>-. 모든 항목은 jpg 또는 gif 파일 도판 이미지 5~20컷과 <br> 텍스트 7,000자 이내를 기준으로 합니다.<br>-데이터는 정해진 형식에 맞추어 임의로 가공됩니다.</p>
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>등록에 필요한 자료</h3>
                    <p class="font-italic">1. 가로 700픽셀 이상 크기의 jpg 또는 gif 형식의 이미지 파일<br>
                                           2. 작품에 대한 정보(작가_제목_재료_크기 또는 길이_제작년도)<br>
                                           3. 200자 원고지 2매 이상 분량의 전시를 설명하는 글<br>
                                           4. 개인전의 경우 작가의 영문이름 철자와 한문이름 그리고 해당 장르<br>
                                           5. 전시공간과 작가의 주소와 전화번호, 도메인, 이메일 등<br>
                                           *위 소스는 이메일로만 접수하고 있습니다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Features Section -->
    
  </main><!-- End #main -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>