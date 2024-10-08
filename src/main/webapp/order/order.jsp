<%@page import="com.kh.web.user.dao.UsersDAO"%>
<%@page import="com.kh.cart.web.dao.JoinProdDAO"%>
<%@page import="com.kh.web.cart.dto.JoinProdDTO"%>
<%@page import="com.kh.web.cart.dto.CartProdDTO"%>
<%@page import="com.kh.cart.service.CartService"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.web.order.dto.OrdersDTO"%>
<%@page import="com.kh.web.order.dto.OrderProdDTO"%>
<%@page import="com.kh.web.order.dao.OrdersDAO"%>
<%@page import="com.kh.web.order.dao.OrderProdDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String prodNum = request.getParameter("prod_num");
    String prodPrice = request.getParameter("prod_price");
    String productCount = request.getParameter("productCount");

    // prodNum, prodPrice, productCount를 이용하여 필요한 데이터 로드하기
%>
<% 
if (session.getAttribute("user_id") == null) {
    response.sendRedirect("/user/login.jsp"); // 로그인 페이지로 리디렉션
    return;
}
%>
<%
	String userId = (String) session.getAttribute("user_id");

    CartService cartService = new CartService();
    JoinProdDAO joinProdDAO = new JoinProdDAO();
    
    int cartNum = joinProdDAO.getCartNum(userId); // 예시값 (사용자 세션에서 가져와야 할 수 있음)
    List<JoinProdDTO> joinProducts = joinProdDAO.getCartProducts(cartNum);
    int totalAmount = 0; // 장바구니 총 금액 초기화

    if (joinProducts != null && !joinProducts.isEmpty()) {
        for (JoinProdDTO product : joinProducts) {
            int totalPrice = product.getPROD_CNT() * product.getPROD_PRICE();
            totalAmount += totalPrice;
        }
    }
%>
<%
    UsersDAO usersDAO = new UsersDAO();
    
    // userId가 null인지 확인
    if (userId == null) {
        // 사용자 ID가 null인 경우 적절한 처리 (예: 로그인 페이지로 리다이렉트)
        response.sendRedirect("login.jsp");
        return; // 이후 코드 실행 방지
    }

    String phoneNumber = usersDAO.getPhoneNumber(userId);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styless.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress; // 도로명 주소
                } else {
                    addr = data.jibunAddress; // 지번 주소
                }

                // 우편번호와 주소 정보를 필드에 넣기
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;

                // 상세주소 필드에 주소 자동 입력
                document.getElementById("sample6_detailAddress").value = '';

                // 상세주소 필드에 커서 이동
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
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
                <% if (session.getAttribute("user_id") != null) { %>
                    <li style="margin-right: 20px;"><a href="cart.jsp">장바구니</a></li>
                    <li style="margin-right: 20px;"><a href="/user/UserLogout.us">로그아웃</a></li>
                    <li><a href="customerService.jsp">고객센터</a></li>
                <% } else { %>
                    <li style="margin-right: 20px;"><a href="/user/login.jsp">로그인</a></li>
                    <li style="margin-right: 20px;"><a href="/user/register.jsp">회원가입</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</header>

    <div class="checkout">
        <h1>결제하기</h1>
        
        <h2>주문 내역</h2>
        <table>
            <tr>
                <th>상품 이미지</th>  
                <th>상품 이름</th>
                <th>수량</th>
                <th>가격</th>
            </tr>
            <%
            if (joinProducts != null && !joinProducts.isEmpty()) {
                for (JoinProdDTO product : joinProducts) {
            %>
            <tr>
                <td><img src="<%= product.getPROD_IMAGE() %>" alt="<%= product.getPROD_NAME() %>" style="width: 100px; height: auto;"></td>
                <td><%= product.getPROD_NAME() %></td>
                <td><%= product.getPROD_CNT() %></td>
                <td><%= product.getPROD_CNT() * product.getPROD_PRICE() %>원</td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">장바구니에 상품이 없습니다.</td>
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

        <h2>주문자 정보</h2>
       <form action="<%=request.getContextPath()%>/order/checkoutAction" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="totalPrice" value="<%= totalAmount %>">
    <input type="hidden" name="totalProdCnt" value="<%= joinProducts.size() %>">
	    <label for="userId">사용자 ID:</label>
	    <input type="text" id="userId" name="userId" value="<%= session.getAttribute("user_id") != null ? session.getAttribute("user_id") : "" %>" readonly>
	
	    <label for="zipCode">우편번호:</label>
	    <div class="postcode-wrapper">
	        <input type="text" id="sample6_postcode" name="zipCode" placeholder="우편번호">
	        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	    </div>
	    
	    <label for="addr">주소:</label>
	    <input type="text" id="sample6_address" name="addr" placeholder="주소">
	     
	    <label for="addrDetail">상세주소:</label>
	   <input type="text" id="sample6_detailAddress" name="addrDetail" placeholder="상세주소">
	 
	    <label for="tel">전화번호:</label>
	    <input type="text" id="tel" name="tel" value="<%= phoneNumber != null ? phoneNumber : "" %>" required><br>
	
	    <label for="req">요청 사항:</label>
	    <textarea id="req" name="req"></textarea><br>
		 
	    <h2>결제 수단 선택</h2>
		<div class="payment-methods">
		    <label>
		        <input type="radio" name="paymentMethod" value="card" checked>
		        <span>
		            <img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=72&h=72&c=c" alt="카드 결제">
		            카드 결제
		        </span>
		    </label>
		    <label>
		        <input type="radio" name="paymentMethod" value="kakaopay">
		        <span>
		            <img src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=72&h=72&c=c" alt="카카오페이 결제">
		            카카오페이
		        </span>
		    </label>
		    <label>
		        <input type="radio" name="paymentMethod" value="bankTransfer">
		        <span>
		            <img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311600677152970.png?w=72&h=72&c=c" alt="무통장 결제">
		            무통장 결제
		        </span>
		    </label>
		</div>
		 <input type="submit" value="주문하기">
	</form>
        
    </div>

    <footer>
        <p>© 2024 오늘의 집. All Rights Reserved.</p>
        <p>고객센터: 1670-0876 (09:00 ~ 18:00)</p>
        <p>이메일: contact@bucketplace.net</p>
    </footer>
    <script>
		function validateForm() {
		    // 우편번호
		    var postcode = document.getElementById("sample6_postcode").value;
		    if (postcode === "") {
		        alert("우편번호를 입력해 주세요.");
		        return false;
		    }
		
		    // 상세주소
		    var detailAddress = document.getElementById("sample6_detailAddress").value;
		    if (detailAddress === "") {
		        alert("상세주소를 입력해 주세요.");
		        return false;
		    }
		
		    // 전화번호
		    var tel = document.getElementById("tel").value;
		    var telPattern = /^(010-\d{4}-\d{4}|010\d{8})$/; // 전화번호 형식 정규식
		    if (!telPattern.test(tel)) {
		        alert("전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678 또는 01012345678");
		        return false;
		    }
		    return true; // 다른 벨리데이션 통과 시 true 반환
		
		    // 요청사항
		    var req = document.getElementById("req").value;
		    if (req.length > 100) { // 요청사항 최대 길이 검사 (예: 100자)
		        alert("요청 사항은 100자 이내로 입력해 주세요.");
		        return false;
		    }
		
		    // 모든 유효성 검사를 통과하면 폼을 제출
		    return true;
		}
		
		// 양식 제출 시 유효성 검사 함수 호출
		document.querySelector("form").onsubmit = function() {
		    return validateForm();
		};
</script>

    
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
