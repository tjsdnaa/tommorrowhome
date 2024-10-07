<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 완료</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styless.css">
</head>
<body>
	<div class="confirmation">
        <h1>구매가 완료되었습니다!</h1>
        <p>주문해주셔서 감사합니다.</p>
        <button onclick="location.href='<%=request.getContextPath()%>/index.jsp'">확인</button>
    </div>
    <footer>
        <p>© 2024 오늘의 집. All Rights Reserved.</p>
    </footer>
</body>
</html>
