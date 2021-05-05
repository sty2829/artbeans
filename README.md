## ARTBEANS

<img src="https://user-images.githubusercontent.com/75354017/117138096-8840db80-ade5-11eb-91ff-306ac4616c72.png" alt="image-20210505195510286" style="zoom: 33%; align=:center;" />

ARTBEANS는 미술 전시회 홍보를 원하는 미술관 및 큐레이터에게 전시회 정보를 받아서 

전시회 관람을 원하는 사람들에게 해당정보를 서비스하는 플랫폼입니다.

## 프로젝트 주소

https://artbeans.site/

## 개발기간

- 2021.04.01 ~ 2021.05.01

## 팀원

<table>
  <tbody>
      <td align="center">
        <a href="https://github.com/tokkimeat">
          <img src="https://avatars.githubusercontent.com/u/75354100?v=4" width="100px" style="max-width:100%;">
          <br>
          <sub>
            <b>팀장 장진석</b>
          </sub>
        </a>
        <br>
      </td>
      <td align="center">
        <a href="https://github.com/sty2829">
          <img src="https://avatars.githubusercontent.com/u/75354017?v=4" width="100px" style="max-width:100%;">
          <br>
          <sub>
            <b>심태윤</b>
          </sub>
        </a>
        <br>
      </td>
      <td align="center">
        <a href="https://github.com/csh4612">
          <img src="https://avatars.githubusercontent.com/u/75354001?s=64&v=4" width="100px" style="max-width:100%;">
          <br>
          <sub>
            <b>최상혁</b>
          </sub>
        </a>
        <br>
      </td>
      <td align="center">
        <a href="https://github.com/sungpring">
          <img src="https://avatars.githubusercontent.com/u/75354104?v=4" width="100px" style="max-width:100%;">
          <br>
          <sub>
            <b>양가온</b>
          </sub>
        </a>
        <br>
      </td>
      <td align="center">
        <a href="https://github.com/ssh09">
          <img src="https://avatars.githubusercontent.com/u/75354025?v=4" width="100px" style="max-width:100%;">
          <br>
          <sub>
            <b>박소희</b>
          </sub>
        </a>
        <br>
      </td>
  </tbody>
</table>

## 개발환경

<img src="https://user-images.githubusercontent.com/75354017/117138359-dfdf4700-ade5-11eb-8239-1b7892dddae1.jpg" alt="image-20210505210001756"  />

## ERD

<img src="https://user-images.githubusercontent.com/75354017/117139466-3e58f500-ade7-11eb-85e0-ec93fcf438da.jpg" />





## 담당역할

- DB설계 ERD

- 전시회 예약화면

  ------

  <img src="https://user-images.githubusercontent.com/75354017/117143002-4e72d380-adeb-11eb-993e-8aa7be782474.png" style="zoom: 67%;" />

**화면설명**  

전시회 대표유저가 ArtBeans 사이트에  전시회를 등록했을 경우 예약설정 화면

**구현설명** 

1.  등록한 전시회중에서 예약설정을 하지 않은 전시회 리스트만 보여준다.

   ##### 전시회테이블에서 해당유저번호와 예약정보가 NULL인것으로 조회 

   ```java
   List<ExhibitionInfo> findAllByUserInfoUiNumAndReservationInfoIsNull(Integer uiNum);
   ```

2. 해당 화면의 입력값은 선택요소로 되어있어 선택시 입력창의 CSS를 성공(초록색)으로 변경함.

------

- 유저 예약화면

------

<img src="https://user-images.githubusercontent.com/75354017/117144212-a231ec80-adec-11eb-9c7e-8ffdd6b9cbe9.png" />

**화면설명**  

전시회 예약버튼을  눌렀을경우 해당 전시회의 예약일정을 선택하는 화면

**구현설명** 

1.  해당 전시회의 기간중에서 휴무일,  표가 다팔린 날짜를 계산하여 스케쥴을  달력에 설정

   ```sql
   SELECT 
   fi.fi_path imgPath, ei.ei_name exhibitionName, 
   CONCAT(DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d'), ' ~ ' , DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d')) period,
   ri.ri_audience_rating audienceRating,
   DATE_FORMAT(ri.ri_start_date, '%Y-%m-%d') minDate,
   DATE_FORMAT(ri.ri_end_date, '%Y-%m-%d') maxDate,
   ei.ei_charge charge, ri.ri_max_ticket maxTicket, ri.ri_num riNum, 
   case ri.ri_holiday
   when 1 then '일요일' when 2 then '월요일' when 3 then '화요일'
   when 4 then '수요일' when 5 then '목요일' when 6 then '금요일' 
   when 7 then '토요일' END AS holiday,
   concat(IFNULL(holiday(ri.ri_start_date, ri.ri_end_date, ri.ri_holiday), ''),
   IFNULL((SELECT IFNULL(CONCAT(',', GROUP_CONCAT(distinct ti.ti_date)), null) FROM exhibition_info ei 
   inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num 
   inner JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = 49 AND ti.ti_date 
   IN(SELECT ti_date FROM (
   SELECT ti.ti_date, ri.ri_max_stock * (ri.ri_end_time - ri.ri_start_time) max FROM exhibition_info ei 
   inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num 
   inner JOIN ticket_info ti ON ri.ri_num = ti.ri_num WHERE ei.ei_num = 49 GROUP BY ti_date HAVING SUM(ti_number) >= max) a)), '')) disable
   FROM exhibition_info ei 
   inner JOIN file_info fi ON ei.fi_num = fi.fi_num
   inner JOIN reservation_info ri ON ei.ei_num = ri.ei_num 
   WHERE ei.ei_num = 49
   ```

2. 해당 전시회의 예약날짜를 선택하면 시간대별 예약가능한 예매수를 보여준다.

------

- 유저 결제화면
