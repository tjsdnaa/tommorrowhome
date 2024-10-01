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

	<h2>커뮤니티</h2>
	
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
	    <div id="answer3" class="answer">A. 결제 후 결제 정보 변경은 불가능 합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer5')">
	        <span>Q. 질문</span>
	        <span>▼</span>
	    </div>
	    <div id="answer3" class="answer">A. 답변.</div>
	    
	    <div class="question" onclick="toggleAnswer('answer6')">
	        <span>Q. 질문1</span>
	        <span>▼</span>
	    </div>
	    <div id="answer3" class="answer">A. 답변1</div>
	      
	    <div class="question" onclick="toggleAnswer('answer7')">
	        <span>Q. 질문2</span>
	        <span>▼</span>
	    </div>
	    <div id="answer3" class="answer">A. 답변2</div>
	   
	</div>

</body>
</html>
