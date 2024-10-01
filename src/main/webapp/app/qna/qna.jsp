<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QnA</title>
    <style>
        .question-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        .question {
            display: flex;
            justify-content: space-between; 
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            cursor: pointer;
            background-color: white;
        }

        .answer {
            display: none;
            margin: 10px 0;
            padding: 10px;
            border-top: 1px solid #ccc;
            background-color : #ebebeb;
            background-color: #f9f9f9; 
        }

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
    </style>
    <script>
        function toggleAnswer(id) {
            var answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }

        function goToPage(page) {
            if (page === 'qna') {
                location.href = '/qna';
            } else if (page === 'board') {
                location.href = '/board';  
            }
        }
    </script>
</head>
<body>

	
	<div class="category-container">
	    <div class="category selected" onclick="goToPage('qna')">QnA</div>
	    <div class="category" onclick="location.href='/board/BoardList.bo'">자유게시판</div>
	</div>

	<div class="question-container">
	    <div class="question" onclick="toggleAnswer('answer1')">
	        <span>Q. 주문 내역은 어떻게 확인할 수 있나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer1" class="answer">A. 우측 상단 프로필 사진을 클릭 후 확인 가능합니다.</div>
	
	    <div class="question" onclick="toggleAnswer('answer2')">
	        <span>Q. 비회원주문 및 전화주문이 가능한가요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer2" class="answer">A. 전화주문은 준비 중에 있습니다. 비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</div>
	
	    <div class="question" onclick="toggleAnswer('answer3')">
	        <span>Q. 신용카드 무이자 할부가 되나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer3" class="answer">A. 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer4')">
	        <span>Q. 신용카드 결제 후 할부 개월 수를 변경 가능한가요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer4" class="answer">A. 결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer5')">
	        <span>Q. 가상계좌 은행을 변경 할 수 있나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer5" class="answer">A. 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다. </div>
	    
	    <div class="question" onclick="toggleAnswer('answer6')">
	        <span>Q. 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer6" class="answer">A. 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</div>
	      
	    <div class="question" onclick="toggleAnswer('answer7')">
	        <span>Q. 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer7" class="answer">A. 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 > 고객센터 > 1:1 카톡 상담하기]를 통해 문의 부탁드립니다.</div>
	   
	    <div class="question" onclick="toggleAnswer('answer8')">
	        <span>Q. 배송비는 얼마인가요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer8" class="answer">A. 오늘의집은 상품정보 중계 및 판매 매체이며, 판매 업체 별로 배송비 정책이 상이합니다.<br> 각 상품 상세 페이지에서 배송비를 확인하실 수 있습니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer9')">
	        <span>Q. 배송은 얼마나 걸리나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer9" class="answer">A. 상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다. <br>자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer10')">
	        <span>Q. 반품 시, 사은품도 같이 반품해야 하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer10" class="answer">A. 사은품도 같이 동봉하여 반품해 주셔야 반품처리가 완료됩니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer11')">
	        <span>Q. 세금계산서를 받고 싶은데 어떻게 해야 하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer11" class="answer">A. 세금계산서 발급은 어려우며, 결제 시 지출증빙 또는 현금영수증 발행은 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer12')">
	        <span>Q. 푸시 알림 설정은 어떻게 하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer12" class="answer">A. 모바일앱을 통해 설정 가능하며 [마이페이지 > 설정 > 푸시 알림 설정]을 통해 푸시알림 수신 설정이 가능합니다.</div>	    
	    
	    <div class="question" onclick="toggleAnswer('answer13')">
	        <span>Q. 회원 탈퇴 후 재가입이 가능한가요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer13" class="answer">A. 오늘의집 재가입은 언제든지 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer14')">
	        <span>Q. 비밀번호 변경은 어떻게 하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer14" class="answer">A. 우측 상단 프로필 사진을 클릭 후 [마이홈 > 설정 > 비밀번호 변경] 페이지에서 비밀번호 변경이 가능합니다.</div>	    
	    
	    <div class="question" onclick="toggleAnswer('answer15')">
	        <span>Q. 제품의 자세한 정보는 어떻게 알 수 있나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer15" class="answer">A. 각 제품의 상세 페이지에서 확인 가능하며, 더욱 자세한 정보는 제품 상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.</div>	    
	    
	    <div class="question" onclick="toggleAnswer('answer16')">
	        <span>Q. 좋지않은 댓글을 받았습니다. 어떻게 해야하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer16" class="answer">A. 댓글 아래에 신고 버튼을 눌러 댓글 신고가 가능합니다.</div>	    
	    
	    <div class="question" onclick="toggleAnswer('answer17')">
	        <span>Q. 인기 게시글, 인기 유저의 기준은 무엇인가요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer17" class="answer">A. 오늘의집 추천 알고리즘에 따라 인기 게시글과 유저가 뽑히게 됩니다. 많은 분들에게 공감되는 인테리어 사진을 통해 인기 유저가 되어보세요.</div>	    
	    
	    <div class="question" onclick="toggleAnswer('answer18')">
	        <span>Q. 오늘의집에서 다루는 콘텐츠는 어떤 것이 있나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer18" class="answer">A. 오늘의집은 모든 사람들이 더 나은 공간에서 더 나은 삶을 만들어 갈 수 있도록, 인테리어와 라이프 스타일에 관한 콘텐츠를 공유하고 있습니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer19')">
	        <span>Q. 인테리어 상담과 시공을 직접 해주시나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer19" class="answer">A. 오늘의집 전문가 찾기 서비스는 오늘의집 사용자와 인테리어 전문가님을 중개하는 서비스로, 오늘의집이 직접 상담과 시공을 진행하지 않습니다.</div>	 	    
	    
	    <div class="question" onclick="toggleAnswer('answer20')">
	        <span>Q. 노하우는 어떻게 업로드하나요?</span>
	        <span>▼</span>
	    </div>
	    <div id="answer20" class="answer">A. 노하우는 오늘의집 유저 분들이 스스로 본인의 라이프스타일과 그 노하우를 공유하고,<br> 오늘의 집이 제안하는 다양한 라이프 스타일을 함께 확인할 수 있는 공간입니다.<br> 여러분의 다채로운 라이프스타일을 노하우 글쓰기를 통해 공유해주세요.</div>	 	    
	    
	    	    	    
	</div>

</body>
</html>
