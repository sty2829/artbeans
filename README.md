## ARTBEANS

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117138096-8840db80-ade5-11eb-91ff-306ac4616c72.png" alt="image-20210505195510286" width="150px" /></p>

ARTBEANS는 미술 전시회 홍보를 원하는 미술관 및 큐레이터에게 전시회 정보를 받아서 

전시회 관람을 원하는 사람들에게 해당정보를 서비스하는 플랫폼입니다.

## 프로젝트 주소

https://artbeans.site/

## 개발기간

- 2021.03.26 ~ 2021.05.01

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
            <b>본인 심태윤</b>
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

<img src="https://user-images.githubusercontent.com/75354017/117389046-b4b04100-af26-11eb-85e2-8ce6473a0354.png" />

## 메인화면

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117162052-68b5ad00-adfd-11eb-82a2-4df32ad2c111.gif"/></p>

## 담당역할

- DB설계 ERD

------

- 전시회 관련자 예약등록

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117144212-a231ec80-adec-11eb-9c7e-8ffdd6b9cbe9.png" /></p>

**화면설명**  

전시회 대표유저가 ArtBeans 사이트에  전시회를 등록했을 경우 예약설정 화면

**구현설명** 

1.  등록한 전시회중에서 예약설정을 하지 않은 전시회 리스트만 보여준다.
2.  해당 화면의 입력값은 선택요소로 되어있어 선택시 입력창의 CSS를 성공(초록색)으로 변경함.

------

- 유저 전시회 예약

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117144212-a231ec80-adec-11eb-9c7e-8ffdd6b9cbe9.png" /></p>

**화면설명**  

전시회 예약버튼을  눌렀을경우 해당 전시회의 예약일정을 선택하는 화면

**구현설명** 

1.  해당 전시회의 기간중에서 휴무일,  표가 다팔린 날짜를 계산하여 스케쥴을  달력에 설정
2.  해당 전시회의 예약날짜를 선택하면 시간대별 예약가능한 예매수를 보여준다.

------

- 유저 예약 결제

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117149788-7dd90e80-adf2-11eb-8ec3-f8e47c90215c.png" width="700px" /></p>

**화면설명**  

전시회 예약일정을 고르고나서 해당 예매표를 결제하는 화면

**구현설명** 

1.  해당 전시회의 전시관(갤러리) 위치를 네이버지도 API를 활용하여 보여준다.
2.  결제방식을 선택하면 Iamport 결제API를 활용하여 결제한다.

------

- 마이페이지 예약보기

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117152057-9ea26380-adf4-11eb-86b7-d627170ad330.png" width="700px" /></p>

**화면설명**  

전시회 예약을 하면 마이페이지에서 예매내역을 확인하는 화면

**구현설명** 

1.  아직 예약시간이 지나지 않았으면 진행중 예약으로 이동하고 상세보기시 취소가 가능하다. 
2.  예약시간이 지나면 지난예약으로 이동하며 상세보기시 후기작성이 가능하다.
3.  지난예약은 데이터가 계속 쌓이기 때문에 JPA 페이징을 활용하여 페이징 처리.

------

- 마이페이지 후기보기

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117154508-df9b7780-adf6-11eb-9b2f-669549f4b43e.png" width="700px" /></p>

**화면설명**  

예매한 전시회의 후기를 작성하고나면 마이페이지에서 나의 후기를 관리하는 화면

**구현설명** 

1.  후기를 작성하고나서 해당 리뷰를 수정하거나 삭제할 수 있다.
2.  후기도 계속 데이터가 쌓이기 때문에 페이징 처리.

------

- 후기상세

<p align="center"><img src="https://user-images.githubusercontent.com/75354017/117157570-a7e1ff00-adf9-11eb-8999-08fdb1b052f9.png" width="700px" /></p>

**화면설명**  

후기 상세 화면

**구현설명** 

1.  제목, 작성자, 작성일을  보여주고 해당 썸네일이미지를 배경으로 사용한다.

2.  해당 후기의 댓글을 작성할 수 있으며 해당 댓글의 작성자면 수정과 삭제가 가능하다.

   
