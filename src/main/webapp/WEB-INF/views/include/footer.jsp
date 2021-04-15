<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/css.jsp"></jsp:include>
</head>
<body>
<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>ArtBeans</h3>
              <p>                
                <strong>Phone:</strong> 02-2222-2122<br>
                <strong>Email:</strong> artbeans@example.com<br>
              </p>              
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>전시회/전시관</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="/views/exhibition/openingList">진행중인 전시회</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/views/exhibition/calendar-list">월별 개봉 전시회</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/views/exhibition/insert">전시회 등록하기</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/views/admin/questions">자주하는 질문</a></li>              
            </ul>
          </div>

        
          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>뉴스 레터</h4>
            <p>저희의 뉴스레터를 받아보고 싶으시면<br> 이메일을 작성해주세요.</p>
            <form action="" method="post">
              <input type="email" name="email" placeholder="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="credits">        
        Designed by <a href="">ArtBeans</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
  <script src="/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
  </body>
  </html>