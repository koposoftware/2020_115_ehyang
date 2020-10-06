# 프로젝트 제목

[프로젝트 홈페이지 - https://koposoftware.github.io/2020_15_ehyang/](https://koposoftware.github.io/2020_15_ehyang/)

# 1. 프로젝트 개요

2030을 위한 짠테크 주식투자

![image](https://user-images.githubusercontent.com/63223374/95170277-25f01000-07ef-11eb-931b-404eb727b7b8.png)

20~30대의 주식에 대한 관심 상승과 함께 신규 유입또한 올라가는 추세이다.

30대 직장인들에 비해 상대적으로 경제능력이 부족한 20대는 주식 시장에 발을 뻗는데 어려움을 많이 겪고 있다.

주식에 관심은 있지만 시작하기 어려워하는 90년대 중반의 Z세대들을 위해 맞춤형 서비스를 제작하고자한다.

<hr>

**서비스 설명**
![image](https://user-images.githubusercontent.com/63223374/95173884-44a4d580-07f4-11eb-8605-c971f85179c2.png)
- 매일 저녁 6시 1000원 미만의 동전이 증권계좌에 자동이체가 된다.
- KOSPI50의 상세정보가 제공되고 원하는 종목을 관심종목으로 선택할 수 있다.
- 매일 저녁 이체되는 금액에 대해선 문자알림 서비스가 제공된다.
- 서비스 해지 시 본인인증 방식은 문자와 이메일을 제공한다.


# 2. 프로젝트 제안서

**기능**
![image](https://user-images.githubusercontent.com/63223374/95174470-12e03e80-07f5-11eb-9a4f-b6756391165a.png)

**사용 기술**
 Spring MVC - 웹 애플리케이션 제작<br>
 웹 크롤링 - 실시간 주가 반영<br>
 Spring Scheduler - 매일 저녁 6시 이체 실행<br>
 OTP - 인증번호 생성방식<br>
 문자 API - 알림 및 본인인증<br>
 Spring MailSender - 이메일 본인인증<br>
 AJAX - 거래 내역 조회 및 관심종목반영<br>
 Docker - 리눅스 컨테이너<br>

**간트차트**

![image](https://user-images.githubusercontent.com/63223374/95173333-7cf7e400-07f3-11eb-9189-c9848556499d.png)

**아키텍처**

![image](https://user-images.githubusercontent.com/63223374/95173540-c5170680-07f3-11eb-9ee4-b9362116084d.png)

**ERD**

![image](https://user-images.githubusercontent.com/63223374/95173503-b7618100-07f3-11eb-8e08-eb67408519ce.png)

**요구사항**
1. 사용자<br>
   1-1. 회원가입<br>
   1-2. 로그인<br>
   1-3. 로그아웃<br>
<br>
 2. 계좌관리<br>
   2-1. 통합계좌 조회<br>
   2-2. 증권계좌 개설<br>
     2-2-1. 개설 가능 - 증권계좌 미보유시<br>
     2-2-2. 개설 불가능 - 증권계좌 보유시<br>
   2-3. 증권계좌 조회<br>
 <br>
 3. My 주금통<br>
   3-1. 주금통 서비스 신청<br>
   3-2. 주금통 서비스 조회 및 해지<br>
     3-2-1. 이메일 인증 서비스 해지<br>
     3-2-2. 문자 인증 서비스 해지<br>
   3-3. 추가이체<br>
<br>
 4. 주식관리<br>
   4-1. KOSPI 50<br>
     4-1-1. 차트 조회<br>
     4-1-2. 관심종목 등록<br>
   4-2. 관심종목 조회 및 매수<br>
   4-3. 주식 체결 목록<br>
<br>
# 3. 프로젝트 결과

## 발표 ppt 
<a href = "https://github.com/koposoftware/2020_15_ehyang/blob/master/PPT/Z%EC%84%B8%EB%8C%80%EB%A5%BC%20%EC%9C%84%ED%95%9C%20%EC%A7%A0%ED%85%8C%ED%81%AC%20%EC%A3%BC%EC%8B%9D%ED%88%AC%EC%9E%90.pdf"> PPT 보러가기</a>
![PPT최종전4](https://user-images.githubusercontent.com/63223374/95171365-c1ce4b80-07f0-11eb-880d-3d81784a86ef.png)

## 시연 동영상 

[![image](https://user-images.githubusercontent.com/63223374/95173119-399d7580-07f3-11eb-87f1-62dbf09ba9ca.png)
](https://youtu.be/lN5YcNwOwX0)

# 4. 본인 소개

본인 소개를 추가하세요

|이름 |양은희|![image](https://user-images.githubusercontent.com/63223374/95203583-eab90580-081d-11eb-9838-23742fef61be.png)|<br>
|연락처 | yang23413(@)gmail.com|<br>
|skill set| Frontend - HTML, CSS, Javascript, Jquery|<br>
| | Backend - Java, Spring, Oracle|<br>
|수상| 표창장 - 전북대학교 창의인재분야 우수상<br>
대상 - 로컬 소셜 이노베이터 PT 경진대회<br>
대상 - 전북대학교 캡스톤 경진대회<br>
동상 - 전북대학교 LINC+사업단 캡스톤 디자인 UCC공모전|<br>

# 5. 기타



# 홈페이지 설정

 본인 repository에서 "Setting"를 들어가서 GitHub Pages에서 설정 변경.
 <Source>
 Source에서 원하는 branch와 directory 설정한다. 
 기본값은 master 에 root를 설정 
 Save 버튼 꼭 누른다.

 <Theme Chooser>
 theme을 변경하여 좀더 이쁜 홈페이지를 만든다.

   <img src="homepage.JPG"/><br>
