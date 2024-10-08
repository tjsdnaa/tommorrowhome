<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>공지사항</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
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

</body>
</html>
