<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping_category_electronics</title>
<link href="/app/shopping/css/shopping_category.css" rel="stylesheet" type="text/css">
<style>
	svg[Attributes Style] {
	    width: 12;
	    height: 12;
	    fill: currentcolor;
	}

	vg:not(:root) {
	    overflow-clip-margin: content-box;
	    overflow: hidden;
	}
</style>
</head>
<body>
<div class="wrap">
	<div class="category_wrap">
		<div class="sidebar_wrap">
			<div class="title">
				<a href="/shopping/ShoppingCategory.sh?prod_category=electronics">가전·디지털</a>
			</div>
			<div class="tree">
				<ul>
					<li>
						<div class="category_header">
							<a href="#">냉장고</a>
							<button class="category_open">
								<div class="img_ex">
									<svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
									<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path>
								</div>
							</button>
						</div>
						
						<div class="category_expanded">
							<ul>
								<li>
									<div class="category_entry_header">
										<a href="#">일반냉장고</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">양문형냉장고</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">미니냉장고</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">김치냉장고</a>
									</div>
								</li>
							</ul>
						</div>
					</li>
					
					<li>
						<div class="category_header">
							<a href="#">TV</a>
							<button class="category_open">
								<div class="img_ex">
									<svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
									<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path>
								</div>
							</button>
						</div>
						
						<div class="category_expanded">
							<ul>
								<li>
									<div class="category_entry_header">
										<a href="#">~109cm(~43")")</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">110~123cm(44~49"")</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">124~163cm(50~64"")</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">164~188cm(65~74"")</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">189cm~(75""~)</a>
									</div>
								</li>
							</ul>
						</div>
					</li>
					
					<li>
						<div class="category_header">
							<a href="#">세탁기·건조기</a>
							<button class="category_open">
								<div class="img_ex">
									<svg class="icon" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet"><path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
									<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path>
								</div>
							</button>
						</div>
						
						<div class="category_expanded">
							<ul>
								<li>
									<div class="category_entry_header">
										<a href="#">일반세탁기</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">드럼세탁기</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">건조기·탈수기</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">세탁기+건조기</a>
									</div>
								</li>
								<li>
									<div class="category_entry_header">
										<a href="#">의류관리기</a>
									</div>
								</li>
							</ul>
						</div>
					</li>
					
					
				</ul>
				<div class="hr"><hr></div>
				<ul class="category_other_title">
					<li>
						<a href="/shopping/ShoppingCategory.sh?prod_category=furniture">가구</a>
					</li>
					<li>
						<a href="/shopping/ShoppingCategory.sh?prod_category=fabric">패브릭</a>
					</li>
				</ul>
			</div>
			<div>
				
			</div>
		</div>
		<div class="contents_wrap">
			<div class="contents_head">
				<div class="category_header">
					가전·디지털
				</div>
				<div class="banner">
					<div class="img_ex">
						<a href="#">
							<img src="#">
						</a>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>매주 바뀌는 핫세일</h2>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172681539361821029.webp">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172681539371360735.webp">
							</a>
						</div>
					</div>
					<div class="title_image">
						<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172681540357989313.webp">
							</a>
						</div>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>이달의 브랜드관</h2>
					</div>
					<div class="title_image">
						<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172622890357921283.jpeg">
							</a>
						</div>
					</div>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>내일의집 exclusive</h2>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172605056237521217.webp">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172605056686185622.webp">
							</a>
						</div>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172560946471144444.webp">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172560946465667132.webp">
							</a>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="contents_body">
			
				<div class="product_wrap">

				<!-- 추천 상품 4개 -->
				<c:forEach var="product" items="${shoppingCategoryList}">
					<div class="product_one">
						<a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
							<input type="hidden" name="prod_num" value="${product.prod_num}">
				    		<%-- <input type="hidden" name="prod_category" value="${product.prod_category}"> --%>
							<div class="image_ex">
								<img src="${product.prod_image}">
							</div>
							<div class="description_wrap">
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
	</div>	
</div>
	
<script>
	
	// category_open button을 클릭하면 category_expanded에 show class를 추가하고 
	// .show css가 적용되도록한다.
	document.addEventListener('DOMContentLoaded', function() {
    const openButtons = document.querySelectorAll('.category_open');
    
    openButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryExpanded = this.closest('li').querySelector('.category_expanded');
            categoryExpanded.classList.toggle('show'); // 'show' 클래스 토글
	        });
	    });
	});

</script>
</body>
</html>