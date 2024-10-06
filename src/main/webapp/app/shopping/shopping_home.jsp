<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping_home</title>
<link href="/app/shopping/css/shopping_home.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="wrap">
	<div class="main_images">
		<a href="#"><img src="/app/shopping/images/home_banner1.png" alt="home_banner1"></a>
	</div>
	
	<div class="tab_wrap">
		<ul>
			<li>
				<a href="#"><span>추천</span></a>
			</li>
			<li>
				<a href="#"><span>소파</span></a>
			</li>
			<li>
				<a href="#"><span>파티션</span></a>
			</li>
			<li>
				<a href="#"><span>최근본상품</span></a>
			</li>
		</ul>
	</div>
	
	
	
		
	<div class="recommend_wrap">
		<ul>
			<%-- 추천 상품 6개 반복 --%>
			<c:forEach var="product" items="${shoppingList}">
			    <li>
			        <a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
			        	<input type="hidden" name="prod_num" value="${product.prod_num}">
			    		<input type="hidden" name="prod_category" value="${product.prod_category}">
			        	<div class="image_ex">
			        		<img src="${product.prod_image}" alt="product_image">
			            </div>
			            
			            <div class="brand_name">브랜드네임</div>
			            <span>
			                ${product.prod_name}
			            </span>
			        </a>
			        <p><b>${product.prod_price}</b></p>
			    </li>
			</c:forEach>
			<%-- 여기까지 추천 상품 6개 반복 --%>
			
		</ul>
	</div>
	
	<div class="category_wrap">
		<div class="category_title">
			<h2>카테고리</h2>
		</div>
		
		<div class="category_kind">
			<ul>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=furniture">
						<img src="/app/shopping/images/165698403420736265.avif" alt="가구">
						<p>가구</p>
					</a>
				</li>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=fabric">
						<img src="/app/shopping/images/172474528642703614.avif" alt="패브릭">
						<p>패브릭</p>
					</a>
				</li>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=electronics">
						<img src="/app/shopping/images/172474529155729560.avif" alt="가전·디지털">
						<p>가전·디지털</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="product_all">
		<div class="tab_wrap">
			<ul>
				<li>
					<a href="#"><span>추천</span></a>
				</li>
				<li>
					<a href="#"><span>예쁜</span></a>
				</li>
				<li>
					<a href="#"><span>유용한</span></a>
				</li>
				<li>
					<a href="#"><span>귀여운</span></a>
				</li>
				<li>
					<a href="#"><span>오늘의딜</span></a>
				</li>
			</ul>
		</div>
		<div class="product_wrap">

			<!-- 추천 상품 4개 -->
			<c:forEach var="product" items="${shoppingAllList}">
				<div class="product_one">
				
					<a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
						<div class="image_ex">
							<img src="${product.prod_image}">
						</div>
						<div class="description_wrap">
						<input type="hidden" name="prod_num" value="${product.prod_num}">
			    		<input type="hidden" name="prod_category" value="${product.prod_category}">
							<div class="description_brand">
								브랜드네임
							</div>
							<div class="description_content">
								${product.prod_name}
							</div>
							<div class="description_price">
								${product.prod_price}
							</div>
							<div class="description_rating">
								<div class="icon_star"><img src="/app/shopping/images/icon_star.png" alt="icon_star"></div>
								<div class="rating_num"><strong>4.5</strong> </div>
								<div class="review_num">리뷰 999</div>
							</div>
							<div class="description_etc">
								<div class="special">특가</div><div class="free">무료배송</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
			<!-- 여기까지 추천 상품 4개 반복 -->
			

		</div>
	</div>
</div>
</body>
</html>