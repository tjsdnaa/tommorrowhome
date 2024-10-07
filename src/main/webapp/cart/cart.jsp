<%@page import="com.kh.cart.web.dao.JoinProdDAO"%>
<%@page import="com.kh.web.cart.dto.JoinProdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kh.web.cart.dto.CartProdDTO" %>
<%@ page import="com.kh.cart.service.CartService" %>
<%@ page import="com.kh.web.cart.dto.ProductDTO" %>
<%
	CartService cartService = new CartService();
    int cartNum = new JoinProdDAO().getCartNum((String)session.getAttribute("user_id")); // 예시값
	
    List<JoinProdDTO> joinProducts = new JoinProdDAO().getCartProducts(cartNum);
    int totalAmount = 0; // 장바구니 총 금액 초기화
    boolean isLoggedIn = session.getAttribute("user_id") != null; // 로그인 여부 체크
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Poppins:wght@300&display=swap" rel="stylesheet" />
</head>
<body>
    <header>
        <div class="header-wrapper">
            <div class="logo">
                <h1><a href="${pageContext.request.contextPath}/index.jsp">내일의 집</a></h1>
            </div>
            <nav>
                <ul>
                    <li><a href="community.jsp">커뮤니티</a></li>
                    <li><a href="productList.jsp">쇼핑</a></li>
                    <li><a href="interior.jsp">인테리어/생활</a></li>
                </ul>
                <form action="search.jsp" method="get" class="search-form">
                    <input type="text" name="search" placeholder="쇼핑 검색">
                    <button type="submit">검색</button>
                </form>
            </nav>
            <div class="header-right">
                <ul style="display: flex; margin: 0; padding: 0; list-style: none;">
                    <li style="margin-right: 20px;"><a href="cart.jsp">장바구니</a></li>
                    <% if (isLoggedIn) { %>
                        <li style="margin-right: 20px;"><a href="/user/UserLogout.us">로그아웃</a></li>
                        <li><a href="customerService.jsp">고객센터</a></li>
                    <% } else { %>
                        <li style="margin-right: 20px;"><a href="/user/UserLogin.us">로그인</a></li>
                        <li style="margin-right: 20px;"><a href="/user/UserJoin.us">회원가입</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </header>

    <div class="cart">
        <h1>장바구니</h1>
        <table>
            <tr>
                <th>상품 이미지</th>
                <th>상품 이름</th>
                <th>수량</th>
                <th>가격</th>
                <th>삭제</th>
            </tr>
            <%
            if (joinProducts != null && !joinProducts.isEmpty()) {
                                for (JoinProdDTO product : joinProducts) {
                                    if (product != null) {
                                        int totalPrice = product.getPROD_CNT() * product.getPROD_PRICE(); // 수량에 맞는 총 가격 계산
                                        totalAmount += totalPrice; // 장바구니 총 금액에 추가
            %>
            <tr>
                <td>
    			<img src="<%= request.getContextPath() + product.getPROD_IMAGE() %>" alt="<%= product.getPROD_NAME() %>" class="product-image">
				</td>
                <td><%=product.getPROD_NAME() %></td>
                <td>
                    <form action="updateCart.jsp" method="post">
                        <input type="hidden" name="cartNum" value="<%= cartNum %>">
                        <input type="hidden" name="prodNum" value="<%= product.getPROD_NUM() %>">
                        <input type="number" name="prodCnt" value="<%= product.getPROD_CNT() %>" min="1">
                        <input type="submit" class="btn btn-update" value="수량 변경">
                    </form>
                </td>
                <td><%= totalPrice %>원</td> <!-- 수량에 따른 총 가격 출력 -->
                <td>
                    <form action="removeFromCart.jsp" method="post">
                        <input type="hidden" name="cartNum" value="<%= cartNum %>">
                        <input type="hidden" name="prodNum" value="<%= product.getPROD_NUM() %>">
                        <input type="submit" class="btn btn-delete" value="삭제">
                    </form>
                </td>
            </tr>
            <%
                        } else {
            %>
            <tr>
                <td colspan="5">상품 정보를 불러올 수 없습니다.</td>
            </tr>
            <%
                        }
                    }
                } else {
            %>
            <tr>
                <td colspan="5">장바구니에 상품이 없습니다.</td>
            </tr>
            <%
                }
            %>
        </table>

        <div class="cart-summary">
            <h2>총 상품금액: <%= totalAmount %>원</h2>
            <h2>총 배송비: + 0원</h2>     
            <h2>결제금액: <%= totalAmount %>원</h2> 
        </div>
       <a href="/order/order.jsp" class="back-link">결제하기</a>
    </div>

    <footer>
        <p>© 2024 오늘의 집. All Rights Reserved.</p>
        <p>고객센터: 1670-0876 (09:00 ~ 18:00)</p>
        <p>이메일: contact@bucketplace.net</p>
    </footer>
</body>
</html>
