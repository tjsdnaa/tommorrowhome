<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>공지사항</title>
    
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
    <style>
       .header_wrap{
          background-color: #fff;
         width: 100%;
         height:auto;
         margin: a auto;
      }

.inner {
    max-width: 1136px;
    margin: 0 auto;
}

.header-upper{
   padding: 10px 50px;
   border-bottom: 1px solid #ededed;
}

.header-upper .inner {
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    align-items: center;
    height: 60px;
}

.searchMenu {
  font-size: 1.5rem;
  color: #35c5f0;
  cursor: pointer;
}

.header-upper__inner {
    display: flex;
    align-items: center;
}

.header-upper__logo {
    font-family: "Gamja Flower";
     font-weight: 700;
     cursor: pointer;
     font-size: 28.8px;
     margin-right: 2rem;
}

.header-uppper__nav ul {
    display: flex;
}

.header-upper__item {
    font-weight: bold;
    margin-right: 1rem;
    cursor: pointer;
}

.header-upper__item.upper__active {
    color: #35c5f0;
}

.header-upper__service {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    color: #757575;
    font-weight: bold;
}

.header-upper__searchBar {
    display: flex;
    align-items: center;
    height: 40px;
    border: 1px solid #dbdbdb;
    border-radius: 0.3rem;
    margin-right: 1rem;
    padding-left: 8px;
    margin-left: 200px;
}

.header-upper__searchBar input {
    border: none;
    width: 230px;
    margin-left: 0.5rem;
}

.header-upper__service ul {
    display: flex;
}

.header-upper__service ul li {
    cursor: pointer;
    line-height: 38px;
    /* border-right: 1px solid #757575; */
}


.header-upper__service ul li a {
    margin: 0 9px 0 8px;
    display: inline-block;
}

ul, li, a, button {
    all: unset;
}

.header-upper__serviceBt {
    width: 100px;
    height: 22px;
    color: #757575;
    padding: 8px 0;
    background: #fff;
    border-radius: 5px;
    text-align: center;
    line-height: 22px;
    cursor: pointer;
    position: relative;
}

/* 고객센터 버튼 호버 스타일 */
.header-upper__serviceBt:hover {
  background: #f0f0f0; /* 호버 시 배경색 변경 */
}
.header-upper__lists {
  position: absolute; /* 절대 위치 설정 */
  z-index: 999; /* 최상위 레이어 설정 */
  top: 70px; /* 상단에서 70px 떨어진 위치 */
  background: #fff; /* 배경색 설정 */
  border: 1px solid #dbdbdb; /* 테두리 설정 */
  border-radius: 6px; /* 모서리 둥글게 처리 */
  box-shadow: 0 4px 10px 0 rgb(209, 209, 209); /* 그림자 효과 */
  width: 320px; /* 너비 설정 */
  display: none; /* 초기에는 숨김 */
  transition: 1s; /* 전환 효과 설정 */
}

.header-upper__lists ul{
   display: inline-block;
   hegiht: auto;
}

.header-upper__lists ul li a {
   padding: 16px 20.8px;
    margin: 0 9px 0 8px;
    display: inline-block;
    height: 52px;
}

.header-upper__lists ul li a h4{
   padding-bottom: 8px;
}

.header-upper__lists ul li a p{
   font-size: 12.8px;
}

/* 고객센터 하단 목록 스타일 */
.header-upper__serviceLists {
  position: absolute; /* 절대 위치 설정 */
  z-index: 999; /* 최상위 레이어 설정 */
  top: 70px; /* 상단에서 70px 떨어진 위치 */
  background: #fff; /* 배경색 설정 */
  border: 1px solid #dbdbdb; /* 테두리 설정 */
  border-radius: 6px; /* 모서리 둥글게 처리 */
  box-shadow: 0 4px 10px 0 rgb(209, 209, 209); /* 그림자 효과 */
  width: 320px; /* 너비 설정 */
  display: none; /* 초기에는 숨김 */
  transition: 1s; /* 전환 효과 설정 */
  flex-direction: column; /* 세로 방향으로 배치 */
}

/* 고객센터 하단 목록 표시 */
.header-upper__serviceLists.openServiceMenu {
  display: flex; /* 메뉴 표시: 플렉스 레이아웃으로 설정 */
}

.header-upper__service ul li a {
    margin: 0 9px 0 8px;
}

.header-upper__serviceLists a {
  display: flex; /* 플렉스 박스 레이아웃 사용 */
  flex-direction: column; /* 세로 방향으로 배치 */
  justify-content: flex-start; /* 시작 부분 정렬 */
  align-items: flex-start; /* 시작 부분 정렬 */
  padding: 1rem 1.3rem; /* 패딩 설정 */
  cursor: pointer; /* 커서 스타일 변경 */
}

/* 마지막 항목의 하단 패딩 설정 */
.header-upper__serviceLists a:last-child {
  padding-bottom: 1rem; /* 하단 패딩 설정 */
}

/* 하단 목록 내 제목 스타일 */
.header-upper__serviceLists a h4 {
  color: #424242; /* 글자 색상 설정 */
  font-size: 1rem; /* 글자 크기 설정 */
  padding-bottom: 0.5rem; /* 하단 패딩 설정 */
}

.header-upper__serviceLists {
    position: absolute;
    z-index: 999;
    top: 70px;
    background: #fff;
    border: 1px solid #dbdbdb;
    border-radius: 6px;
    box-shadow: 0 4px 10px 0 rgb(209, 209, 209);
    width: 320px;
    display: none;
    transition: 1s;
    flex-direction: column;
}

.header-upper__writeBt {
    width: 100px;
    height: 22px;
    color: #fff;
    padding: 8px 0 10px;
    background: #35c5f0;
    border-radius: 5px;
    text-align: center;
    line-height: 22px;
    cursor: pointer;
    position: relative;
}

.header-upper__writeBt::after {
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    content: "\f078";
    margin-left: 0.5rem;
}

.header-lower{
   padding: 0 50px;
   border-bottom: 1px solid #ededed;
   overflow-x: auto;
    overflow-y: hidden;
}

.header-lower .inner {
   width: 1136px;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    padding-left: 0px;
    display: flex;
    
}

.header-lower .inner nav {
    display: flex;
    flex-flow: row nowrap;
    justify-content: flex-start;
    align-items: center;
    color: #424242;
    margin-left: 0;
}

.header-lower .inner div {
    display: inline-block;
    font-size: 1rem;
    font-weight: 700;
    color: #424242;
    cursor: pointer;
}

.header-lower__item.active {
    border-bottom: 2px solid #35c5f0;
}

.header-lower__item {
    font-size: 1rem;
}

.header-lower__item {
    font-weight: 700;
    color: #424242;
    cursor: pointer;
    /* margin: 8px 0; */
    padding: 11px 10px;
    /* position: relative; */
    flex-shrink: 0;
}

.header-lower .inner div {
    display: inline-block;
    font-size: 1rem;
    font-weight: 700;
    color: #424242;
    cursor: pointer;
}

      *{
         padding: 0px;
         margin: 0px;
         
      }
    
        body {
            background-color: #f4f6f9;
        }
        
        .wrap{
           font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            color: #000; /* 전체 글자색을 검은색으로 설정 */
        }
        h1 {
            color: #35C5F0; /* 제목 색상 유지 */
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background-color: #35C5F0;
            color: #fff; /* 헤더 글자색 유지 */
            padding: 12px;
            font-weight: bold;
            text-align: center;
        }
        td {
            padding: 12px;
            text-align: center;
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        td:hover {
            background-color: #e0f7fa; /* Lighten on hover */
        }
        .title {
            text-align: left;
            padding-left: 10px;
        }
        tr:hover {
            background-color: #e0f7fa; /* Highlight entire row on hover */
        }
        .no-posts {
            text-align: center;
            color: #ff5722; /* no-posts 색상 유지 */
            font-size: 16px;
            margin-top: 20px;
        }
        .small-number {
            width: 50px;
        }
        a {
            color: #003322; /* 링크 색상 유지 */
            text-decoration: none; /* Remove underline */
            transition: color 0.3s; /* Smooth transition for link hover effect */
        }
        a:hover {
            text-decoration: none;
            /* 색상 변화 없음 - 기존 색상 유지 */
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            border: 1px solid #35C5F0;
            color: #35C5F0;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .pagination a:hover {
            background-color: #35C5F0;
            color: white;
        }
    </style>
</head>
<body>

<div class="header_wrap">
      <div class="header-upper">
         <div class="inner">
            <div class="header-upper__inner">
               <div class="header-upper__logo">
                  <a href="/index.jsp">내일의 집</a>
               </div>
            
               <div class="header-uppper__nav">
                  <ul>
                     <li class="header-upper__item upper__active">
                        <a href="">커뮤니티</a>
                     </li>
                     <li class="header-upper__item">
                        <a href="">쇼핑</a>
                     </li>
                  </ul>
               </div>
            </div>
            
            <div class="header-upper__service">
               <div class="header-upper__searchBar">
                   <i class="fas fa-search"></i>
                   <input type="text" placeholder="오늘의집 통합검색">
                </div>
                
                <a href="/cart/cart.jsp">
                   <i class="fas fa-shopping-cart"></i>
                </a>
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
                  <button class="header-upper__writeBt">글쓰기</button>
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
      
      <div class="header-lower">
         <div class="inner">
             <nav>
                   <div class="community-menu">
                    <a class="header-lower__item active" href="">홈</a>
                    <a class="header-lower__item" href="/board/BoardList.bo">게시판</a>
                    <a class="header-lower__item" href="/app/qna/qna.jsp">Q&amp;A</a>
                    </div>
                     <!-- 쇼핑 하단 메뉴 추가 -->
                        <div class="shopping-menu" style="display: none;"> <!-- 기본적으로 숨김 -->
                      <a class="header-lower__item active" href="/shopping/ShoppingHome.sh">홈</a>
                      <a class="header-lower__item" href="/shopping/ShoppingCategory.sh?prod_category=furniture">카테고리</a>
                  </div>
            </nav>
          </div>
      </div>
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
<div class="wrap">
<h1>공지사항</h1>


<table>
    <thead>
        <tr>
            <th class="small-number">번호</th>
            <th>제목</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="boardList" value="${requestScope.boardList }"/>
        <c:set var="currentPage" value="${requestScope.currentPage }"/>
        <c:set var="totalCount" value="${requestScope.totalCount }"/>

        <c:set var="pageCount" value="10" />
        <%
            // totalPage 계산 및 소수점 내림
            int totalCount = (Integer) request.getAttribute("totalCount");
            int pageCount = 10; // 페이지당 게시물 수
            int totalPage = (int) Math.floor((totalCount + pageCount - 1) / (double) pageCount);
            request.setAttribute("totalPage", totalPage);
        %>

        <c:choose>
            <c:when test="${boardList != null and fn:length(boardList) > 0}">
                <c:forEach var="board" items="${boardList }" varStatus="status">
                    <tr>
                        <td class="small-number">${board.boardID}</td>
                        <td class="title">
                            <a href="/board/BoardDetail.no?boardID=${board.boardID}">
                                ${board.title}
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="2" class="no-posts">등록된 게시물이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

<div class="pagination">
    <c:set var="totalPage" value="${requestScope.totalPage}" /> <!-- 소수점 내림 처리된 totalPage 값 사용 -->

    <c:if test="${currentPage > 1}">
        <a href="/board/BoardList.no?page=${currentPage - 1}">이전</a>
    </c:if>

    <c:forEach var="page" begin="1" end="${totalPage}">
        <c:if test="${page == currentPage}">
            <strong>${page}</strong>
        </c:if>
        <c:if test="${page != currentPage}">
            <a href="/board/BoardList.no?page=${page}">${page}</a>
        </c:if>
    </c:forEach>

    <c:if test="${currentPage < totalPage}">
        <a href="/board/BoardList.no?page=${currentPage + 1}">다음</a>
    </c:if>
</div>
</div>
</body>
</html>
