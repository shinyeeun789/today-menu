# Today's Menu
JSP를 활용한 오늘 먹을 메뉴와 음식점을 추천해주는 웹 프로젝트

## 💻 프로젝트 소개
&nbsp; 2017년 11월 인크루트에서 진행한 설문조사에 따르면, 성인남녀 10명 중 8명은 결정을 빨리 못하는 '결정 장애'를 겪는다고 생각해 본 경험이 있었으며, 결정 장애를 가장 절감하는 때는  
1위) 외식 메뉴 고를 때 (23.3%)  
2위) 옷, 신발 등 쇼핑할 때 (19.4%)  
3위) 진학, 취업 등 진로 선택 시 (11.4%)
로 외식 메뉴 고를 때가 가장 많았습니다. <br />
&nbsp; '외식 메뉴를 정할 때 많은 시간을 소비하는 사람들을 위한 웹 사이트를 개발하자!' 라는 생각으로 본 프로젝트를 진행하게 되었습니다.

### 🕰 개발 기간
2020.11 ~ 2020.12

### 📚개발 환경
![Java](https://img.shields.io/badge/Java-007396.svg?&style=for-the-badge&logo=Java&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![css3](https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![jQuery](https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
![mySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=EclipseIDE&logoColor=white)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black)

## 📌 벤치마킹
### 🎨 디자인 벤치마킹 대상
1. Most Comfortable Shoes for Everyday Wear | Atoms.com
2. 네이버 영화 평점 페이지

### 🖱 기능 벤치마킹 대상
1. 당신의 저녁 식사 메뉴는? (https://kr.shindanmaker.com)
2. 메뉴판닷컴 (http://www.menupan.com)

#### ☑ 벤치마킹에서 느꼈던 좋은 점과 아쉬운 점
![기능 벤치마킹](https://user-images.githubusercontent.com/70800414/125544168-4dfaf313-4d6c-40f0-b48e-b76bd71abb39.JPG)

#### 벤치마킹 후 발굴된 세부 전략
1. 메뉴 추천 기능 제공
  - 하루에도 여러 개의 결과를 얻을 수 있도록 구현할 것입니다.
  - 약 4초 간 음식명이 랜덤으로 바뀌다 결과가 출력되도록 구현할 것입니다.
2. 맛집 추천 기능 제공
  - 평점이 높은 음식점 순으로 출력할 것입니다.
  - 서울, 경기, 인천, 부산, 제주 별로 음식점을 출력할 것입니다.

## 프로젝트 기능
### 0. 메인 페이지 및 메뉴 추천
- 비로그인 / 사용자 로그인 / 관리자 로그인 상태
- 시작 버튼 클릭
#### 📷 View
<table align="center">
  <tbody>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234198416-c887660a-3a76-4ff1-bb6b-83235b80a76f.png" width="1200" alt=""/><br />
        <sub><b>PIC1 : 사용자 로그인 상태 </b></sub><br/></td>
      </td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234198455-99dcea1d-0c93-4d12-af7c-07969b4f84cb.png" width="1200" alt=""/><br />
        <sub><b>PIC2 : 관리자 로그인 상태 </b></sub><br/></td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234198546-d17de1ba-f549-4055-b7fe-eb3bfec2469c.png" width="1200" alt=""/><br />
        <sub><b>PIC3 : 시작 버튼 클릭 시 </b></sub><br/></td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234202590-8ea13b83-b416-4ff0-a39e-5bdde598822f.png" width="1200" alt=""/><br />
        <sub><b>PIC4 : 마이페이지 </b></sub><br/></td>
      </td>
  </tbody>
</table>

### 1. 회원 기능  
- 로그인 / 로그아웃 / 회원가입 / 마이페이지
#### 📷 View
<table align="center">
  <tbody>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234199365-c949a97d-4ab7-4c7c-8926-64d81fea21d9.png" width="1200" alt=""/><br/>
        <sub><b> PIC1 : 로그인 페이지 </b></sub><br/></td>
      </td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234199444-1cc27b54-05e4-4382-a6a5-458df3208282.png" width="1200" alt=""/><br />
        <sub><b>PIC2 : 회원가입 페이지 </b></sub><br/></td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234199553-2d8851bd-bc3b-4a08-9f4e-11f6137f1e4f.png" width="1200" alt=""/><br />
        <sub><b>PIC3 : 회원가입 페이지(필수 조건을 입력하지 않은 경우)  </b></sub><br/></td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234199736-275020fe-f316-4026-8717-d57f23e8f96e.png" width="1200" alt=""/><br />
        <sub><b>PIC4 : 회원가입 페이지(필수 조건을 입력한 경우) </b></sub><br/></td>
      </td>
  </tbody>
</table>

### 2. 음식점 추천
- 메인 페이지에서 추천된 메뉴를 판매하는 음식점 추천
- 지역은 서울, 경기, 인천, 부산, 제주 중에서 선택
#### 📷 View
<table align="center">
  <tbody>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234200665-1809d19f-7738-4a66-8521-8536a3fa9f38.png" width="1200" alt=""/><br/>
        <sub><b> PIC1 : 음식점 추천 페이지(1) </b></sub><br/></td>
      </td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234200751-9cc67f09-a3eb-4181-aabb-76f391a30a8f.png" width="1200" alt=""/><br />
        <sub><b>PIC2 : 음식점 추천 페이지(2) </b></sub><br/></td>
    </tr>
  </tbody>
</table>

### 3. 음식점 리뷰 
- 로그인 시 리뷰 작성 기능 활성화
- 비로그인 시 리뷰 리스트만 확인 가능
#### 📷 View
<table align="center">
  <tbody>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234201314-e6d53309-b33f-4795-b1d6-ae9a0700424b.png" width="1200" alt=""/><br/>
        <sub><b> PIC1 : 음식점 리뷰 페이지(비로그인) </b></sub><br/></td>
      </td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234201451-c6476432-e8ac-40b9-988d-f1428765f418.png" width="1200" alt=""/><br />
        <sub><b>PIC2 : 음식점 리뷰 페이지(로그인) </b></sub><br/></td>
    </tr>
  </tbody>
</table>

### 4. 음식점 추가 신청
- 사용자는 음식점 등록 신청 가능
- 관리자는 사용자가 신청한 음식점 확인 후 승인
#### 📷 View
<table align="center">
  <tbody>
    <tr>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234202713-f15419f7-4dff-4a17-be54-57b119e503f9.png" width="1200" alt=""/><br/>
        <sub><b> PIC1 : 음식점 추가 신청 페이지 </b></sub><br/></td>
      </td>
      <td align="center">
        <img src="https://user-images.githubusercontent.com/70800414/234202782-7fab4ff2-cef0-467f-a5a3-9943631f207c.png" width="1200" alt=""/><br />
        <sub><b>PIC2 : 음식점 추 승인 페이지 </b></sub><br/></td>
    </tr>
  </tbody>
</table>
