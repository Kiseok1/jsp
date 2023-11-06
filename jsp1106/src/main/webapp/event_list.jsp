<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/event_list.css">
  
</head>
<body>
<!-- top 시작 -->
<%@ include file="top.jsp" %>  
<!-- top 끝 -->

  <section>
    <h1>EVENT</h1>

    <article id="event_list">
      <ul>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202003/88752b53-6a41-4930-9145-266f90d27d8c.jpg" alt="" class="event-img">
          <div class="event-now">진행중</div>
          <div class="event-title">아이솔브 브랜드 기획전</div>
          <div class="event-date">2020-03-10 ~ 2020-03-31</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202003/54f0b3df-3c00-4ac9-b7ba-52cc5bf36d85.jpg" alt="" class="event-img">
          <div class="event-now">진행중</div>
          <div class="event-title">만나서 반값습니다!</div>
          <div class="event-date">2020-03-06 ~ 2020-03-27</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202002/8de980c1-0ed3-487b-9e69-c5d4c03288a2.jpg" alt="" class="event-img">
          <div class="event-now">진행중</div>
          <div class="event-title">착한 팩트 event</div>
          <div class="event-date">2020-02-24 ~ 2020-03-31</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202001/7f5af7d9-8f7e-4513-80a9-9055ae7c0f0d.jpg" alt="" class="event-img">
          <div class="event-now">진행중</div>
          <div class="event-title">휘슬 44일 선착순 레전드 혜택</div>
          <div class="event-date">2020-02-28 ~ 2020-03-31</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202002/aa855f2e-a2c4-4d12-82cb-4b07b06c6fb7.jpg" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">FFLOW WELCOME EVENT</div>
          <div class="event-date">2020-02-17 ~ 2020-02-29</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202002/dc744bef-2acb-4540-8355-8ff447949c04.png" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">해피 발렌타인데이</div>
          <div class="event-date">2020-02-10 ~ 2020-02-16</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2020/202001/bddffe34-23e4-4f8c-b639-ccc0425236e1.jpg" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">폭탄세일</div>
          <div class="event-date">2020-01-29 ~ 2020-02-09</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2019/201912/5529fa9d-4a59-45fd-a65e-2bf265bec192.jpg" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">크리스마스 이벤트</div>
          <div class="event-date">2019-12-20 ~ 2030-12-30</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2019/201909/b50e8848-a431-4c2f-8ca9-4f771b090dd3.png" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">휘슬 덴티스마일 런칭 이벤트</div>
          <div class="event-date">2019-12-02 ~ 2021-12-31</div>
        </li>
        <li>
          <img src="https://www.akbeauty.co.kr/files/public/site/2019/201912/1282dd64-9587-44cb-85f3-142ab640decb.jpg" alt="" class="event-img">
          <div class="event-end">종료</div>
          <div class="event-title">Year-End Lucky Draw!</div>
          <div class="event-date">2019-12-06 ~ 2019-12-15</div>
        </li>
      </ul>
    </article>

    <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num">
        <div>1</div>
      </li>
      <li class="next"></li>
      <li class="last"></li>
    </ul>

    <div class="write">쓰기</div>

  </section>

  <footer>
    <div class="wrapper">
      <div class="footer-left">
        <div class="footer-logo"></div>
        <div class="copyright">© COOKIT ALL RIGHTS RESERVED</div>
      </div>
  
      <div class="footer-center">
        <ul class="footer-nav">
          <li class="first-list">이용약관</li>
          <li class="green">개인정보처리 방침</li>
          <li>법적고지</li>
          <li>사업자정보 확인</li>
        </ul>
  
        <ul class="footer-info">
          <li class="first-list">씨제이제일제당(주)</li>
          <li>대표이사 : 손경식,강신호,신현재</li>
          <li>사업자등록번호 : 104-86-09535</li>
          <li class="first-list">주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</li>
          <li>통신판매업신고 중구 제 07767호</li>
          <li class="first-list">개인정보보호책임자 : 조영민</li>
          <li>이메일 : cjon@cj.net</li>
          <li>호스팅제공자 : CJ올리브네트웍스㈜</li>
        </ul>
  
        <div id="check">고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span class="check">가입 사실 확인</span></div>
      </div>
  
      <div class="footer-right">
        <div id="shortcut">
          <span>CJ그룹계열사 바로가기</span>
          <div class="shortcut"></div>
        </div>
  
        <div class="call">고객행복센터 1668-1920</div>
        <div class="inquery">1:1 문의</div>
      </div>
  
    </div>
  </footer>
</body>
</html>