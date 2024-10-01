<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <style>
    
        .category-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .category {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #f0f0f0;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
        }

        .category.selected {
            background-color: #007bff; 
            color: white;
        }

        .category:hover {
            background-color: #ddd;
        }

        .board-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        a {
            text-decoration: none;
            color: black;
        }
        
         .top-bar {
            display: flex;
            justify-content: space-between;
             align-items: center;
            width: 100%;
            box-sizing: border-box; 
            margin-bottom: 10px;
        }

        .search-box {
            display: flex;
            align-items: center;
        }

        .search-box input {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-box button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            margin-left: 5px;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-box button:hover {
            background-color: #0056b3;
        }

        .btn-write {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-write:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function goToPage(page) {
            if (page === 'qna') {
                location.href = '/app/qna/qna.jsp';
            } else if (page === 'board') {
                location.href = '/board/BoardList.bo';
            }
        }
    </script>
</head>
<body>

<h2>커뮤니티</h2>

   <c:set var = "boardList" value = "${requestScope.boardList }"/>
   <c:set var = "totalCnt" value = "${requestScope.totalCnt }"/>
   
   <c:set var = "nowPage" value = "${requestScope.nowPage }"/>
   <c:set var = "startPage" value = "${requestScope.startPage }"/>
   <c:set var = "endPage" value = "${requestScope.endPage }"/>
   <c:set var = "totalPage" value = "${requestScope.totalPage }"/>

<div class="category-container">
    <div class="category" onclick="goToPage('qna')">QnA</div>
    <div class="category selected" onclick="goToPage('board')">자유게시판</div>
</div>

<div class="board-container">
    <div class="top-bar">
        <div class="search-box">
            <form action="/app/board/boardList.jsp" method="get">
                <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                <button type="submit">검색</button>
            </form>
        </div>
        <button class="btn-write" onclick="location.href='/app/board/boardWrite.jsp'">게시판 작성</button>
    </div>

<div class="board-container">
    <h3>자유게시판 목록</h3>
   <%--   <tr align="right" valign="middle">
        <td>글 개수 : ${totalCnt } 개</td>
     </tr> --%>
    
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <!-- <th>작성일</th>
            <th>조회수</th> -->
        </tr>
<c:choose>
   <c:when test="${boardList != null and fn:length(boardList) > 0}">
        <c:forEach var="board" items="${boardList}">
            <tr align="center" valign="middle" 
                onmouseover="this.style.background = '#bbdefb'"
                onmouseout="this.style.background = ''">
                <td height="23px">
                    ${board.boardid}
                </td>
                <td height="23px">
                    <a href="/board/BoardView.bo?boardid=${board.boardid}">${board.title}</a>
                </td>
                <td height="23px">
                    ${board.userid}
                </td>
              <%--   <td height="23px">
                    ${board.boarddate}
                </td>
                <td height="23px">
                    ${board.boardreadcount}
                </td> --%>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <tr style="height:50px;">
            <td colspan="3" style="text-align:center;">등록된 게시물이 없습니다.</td>
        </tr>
    </c:otherwise>
</c:choose>
      
   </table>
   <br>
   <table style = "border : 0px; width: 1060px;">
      <tr align = "center" valign = "middle">
         <td>
            <c:if test = "${nowPage > 1 }">
               <a href = "/board/BoardList.bo?page=${nowPage - 1}">[&lt;]</a>
            </c:if>
            
            <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
               <c:choose>
                  <c:when test = "${i == nowPage }">[${i}]</c:when>
                  <c:otherwise>
                     <a href = "/board/BoardList.bo?page=${i}">[${i}]</a>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <c:if test = "${nowPage < totalPage }">
               <a href = "/board/BoardList.bo?page=${nowPage + 1}">[&gt;]</a>
            </c:if>
         </td>
      </tr>
   </table>
   </div>
</body>
</html>