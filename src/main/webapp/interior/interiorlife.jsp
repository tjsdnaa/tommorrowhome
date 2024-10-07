<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>예쁜템들 모여사는 오늘의집</title>
    <!-- seo meta tag 생략 -->

    <!-- CSS Reset -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"> -->

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Poppins:wght@300&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Gamja+Flower:400"
      rel="stylesheet"
    />

    <!-- 아이콘 용 폰트 어썸 -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
      integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="./comunityboard.css" />
  </head>
  <body>
    <!-- 전체 레이아웃--------------------------------------------------------------->
    <div class="wrap">
      <!-- 상단 네비게이션 영역 ---------------------------------------------------->
      <header class="header">
        <!-- 네비게이션 상단 ------------------------------------------------------->
        <div class="header-upper">
          <div class="inner">
            <i class="fas fa-bars searchMenu"></i>
            <div class="header-upper__inner">
              <div class="header-upper__logo"><a href="/index.jsp">내일의 집</a></div>
              <div class="header-upper__nav">
                <ul>
                  <li class="header-upper__item">
                    <a href="/comunity/home.co">커뮤니티</a>
                  </li>
                  <li class="header-upper__item"><a href="/shopping/ShoppingHome.sh">쇼핑</a></li>
                  <li class="header-upper__item upper__active"><a href="/interior/interiorHome.in">인테리어/생활</a></li>
                </ul>
              </div>
            </div>
       <div class="header-upper__service">
  <div class="header-upper__searchBar">
    <i class="fas fa-search"></i>
    <input type="text" placeholder="오늘의집 통합검색" />
  </div>
  <a href="<%=request.getContextPath()%>/cart/cart.jsp"><i class="fas fa-shopping-cart"></i></a>
  <ul>
     <%
        // 세션에 사용자 정보가 있는지 확인
        String user_id = (String)session.getAttribute("user_id");
        if (user_id == null) {
            // 로그인되지 않은 상태
    %>
      	<li><a href="/user/UserLogin.us">로그인</a></li>
    	<li><a href="/user/UserJoin.us">회원가입</a></li>
    <%
        } else {
            // 로그인된 상태
    %>
        <li><a href="/user/UserLogout.us">로그아웃</a></li>
    <%
        }
    %>
	    <li>
	    <button class="header-upper__serviceBt">고객센터</button>
	    <!-- 고객센터 관련 리스트 -->
	    <div class="header-upper__serviceLists" style="display: none;"> <!-- 기본적으로 숨김 -->
      <ul>
        <li><a href="/board/BoardList.no"><h4>공지사항</h4></a></li>
        <li><a href="/chat/chatmain.ch"><h4>채팅방</h4></a></li>
      </ul>
   	 </div>
    </li>
    <li>
      <button class="header-upper__writeBt"><a href="">글쓰기</a></button>
      <div class="header-upper__lists" style="display: none;"> <!-- 기본적으로 숨김 -->
        <ul>
          <li><a href=""><h4>사진 올리기</h4><p>우리 집의 공간과 나의 일상을 기록해 보세요.</p></a></li>
          <li><a href=""><h4>집들이 글쓰기</h4><p>집에 관한 이야기를 글로 작성해 보세요.</p></a></li>
          <li><a href=""><h4>노하우 글쓰기</h4><p>다양한 인테리어 노하우를 공유해 주세요.</p></a></li>
          <li><a href=""><h4>상품 리뷰 글쓰기</h4><p>상품 리뷰를 작성하고 포인트도 받아 보세요.</p></a></li>
          <li><a href=""><h4>시공 전문가 리뷰쓰기</h4><p>시공 전문가 리뷰를 작성하고 포인트도 받아보세요.</p></a></li>
          <li><a href=""><h4>인테리어 질문하기</h4><p>인테리어 고수들과 전문가들에게 질문해 보세요.</p></a></li>
        </ul>
      </div>
      <script>
    document.querySelector('.header-upper__writeBt').addEventListener('click', function() {
      const lists = document.querySelector('.header-upper__lists');
      // 토글 기능을 적용
      if (lists.style.display === 'none' || lists.style.display === '') {
        lists.style.display = 'block'; // 보이게
      } else {
        lists.style.display = 'none';  // 숨기기
      }
    });
    
    document.querySelector('.header-upper__serviceBt').addEventListener('click', function() {
        const serviceLists = document.querySelector('.header-upper__serviceLists');
        // 토글 기능을 적용
        if (serviceLists.style.display === 'none' || serviceLists.style.display === '') {
          serviceLists.style.display = 'block'; // 보이게
        } else {
          serviceLists.style.display = 'none';  // 숨기기
        }
      });
  </script>
    </li>
  </ul>
</div>
</div>
</div>
 

<!-- 네비게이션 하단----------------------------------------------------------- -->
 <div class="header-lower">
    <div class="inner">
       <nav>
       			<div class="community-menu">
              <a class="header-lower__item" href="/interior/interiorHome.in">홈</a>
              <a class="header-lower__item" href="">주거공간시공</a>
              <a class="header-lower__item" href="">부분시공</a>
              <a class="header-lower__item" href="">시공자재랭킹</a>
              <a class="header-lower__item" href="">제품설치</a>
              <a class="header-lower__item" href="">이사</a>
              <a class="header-lower__item" href="">집보기체크리스트</a>
              <a class="header-lower__item" href="">부분시공</a>

              </div>
               <!-- 쇼핑 하단 메뉴 추가 -->
           		 <div class="shopping-menu" style="display: none;"> <!-- 기본적으로 숨김 -->
                <a class="header-lower__item active" href="/shopping/ShoppingHome.sh">홈</a>
                <a class="header-lower__item" href="/shopping/ShoppingCategory.sh?prod_category=furniture">카테고리</a>
            </div>
            </nav>
          </div>
        </div>
      </header>
</div>
<script>
    // 커뮤니티 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.community-menu').style.display = 'block'; // 커뮤니티 메뉴 보이기
        document.querySelector('.shopping-menu').style.display = 'none'; // 쇼핑 메뉴 숨기기
    });

    // 쇼핑 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item:last-child a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.shopping-menu').style.display = 'block'; // 쇼핑 메뉴 보이기
        document.querySelector('.community-menu').style.display = 'none'; // 커뮤니티 메뉴 숨기기
    });
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });

    // 쇼핑 메뉴 클릭 시 활성화
    document.querySelector('.header-upper__item:last-child a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });
</script>
	
	
	
	
	
	
	
	
	
		
	<footer class="footer">
          <div class="footer-upper">
            <div>
              <h4><a href="">고객센터</a></h4>
              <a class="footer-number" href="">1670-1234</a>
              <span>평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</span>
            </div>
            <ul>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 384 512"
                  >
                    <path
                      d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 320 512"
                  >
                    <path
                      d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"
                  >
                    <path
                      d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"
                    /></svg
                ></a>
              </li>
            </ul>
          </div>
          <ul class="footer-lower">
            <li><a href="">브랜드 스토리</a></li>
            <li><a href="">회사소개</a></li>
            <li><a href="">채용정보</a></li>
            <li><a href="">이용약관</a></li>
            <li><a href="">개인정보처리방침</a></li>
            <li><a href="">공지사항</a></li>
            <li><a href="">고객센터</a></li>
            <li><a href="">고객의 소리</a></li>
            <li><a href="">전문가 등록</a></li>
          </ul>
        </footer>
</body>
</html>