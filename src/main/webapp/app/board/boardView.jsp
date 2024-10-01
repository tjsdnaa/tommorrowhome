<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
    <style>
	 .container {
	    max-width: 1100px;
	    margin: 0 auto;
	    padding: 20px;
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
	
	.title {
	    font-size: 24px;
	    font-weight: bold;
	    margin-top: 20px;
	}
	
	.info {
	    margin-top: 10px;
	    color: #888;
	    display: flex;
	    justify-content: space-between;
	}
	
	.content {
	    margin-top: 20px;
	    padding: 20px;
	    border: 1px solid #ccc;
	}
	
	.button-container {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.btn-list {
	    background-color: #007bff;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 16px;
	    text-decoration: none;
	    display: inline-block;
	}
	
	.btn-list:hover {
	    background-color: #0056b3;
	}
	
	/* 댓글 스타일 */
	.comments-container {
	    margin-top: 30px;
	    padding: 20px;
	    border-top: 1px solid #ccc;
	}
	
	.comment {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    width: 100%;
	    
	    margin-bottom: 15px;
        border: 1px solid #ccc;
        padding: 10px;
        border-radius: 5px;
        background-color: #f9f9f9;
	}
	
	.comment textarea {
	    display: block;
	    width: 100%;
	    margin: 0;
	    padding: 5px;
	    text-align: left;
	    box-sizing: border-box;
	    height: auto;
	    min-height: 65px;
	    resize: none;
	    white-space: normal;
	    line-height: 1.5;
	    overflow-y: hidden;
	    word-wrap: break-word;
	    border: 1px solid #ccc;
	    font-size: 14px;
	    background-color: transparent;
	}
	
	/* 버튼 스타일 */
	.btn-action {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    padding: 5px 10px;
	    cursor: pointer;
	    font-size: 14px;
	    margin: 5px;
	}
	
	.btn-action:hover {
	    background-color: #0056b3;
	}
	
	/* 댓글 작성 폼 스타일 */
	.reply-form {
	    margin-top: 20px;
	    border: 1px solid #ddd;
	    padding: 15px;
	}
	
	.reply-form input,
	.reply-form textarea {
	    width: 100%;
	    padding: 10px;
	    margin: 5px 0;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	.reply-form button {
	    background-color: #28a745;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 16px;
	}
	
	.reply-form button:hover {
	    background-color: #218838;
	}
	
	/* 수정/삭제 버튼 스타일 */
	.edit-delete-buttons {
	    display: flex;
	    gap: 10px;
	}
	
	.edit-delete-buttons .btn-action {
	    padding: 5px 15px;
	}
	
	/* 기본 textarea 스타일 */
	textarea {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    resize: none;
	    font-size: 16px;
	    box-sizing: border-box;
	}
	
	/* readonly 상태일 때 textarea를 텍스트처럼 보이게 변경 */
	textarea[readonly] {
	    background-color: transparent;  /* 배경을 투명하게 */
	    border: none;  /* 테두리를 없앰 */
	    color: #333;  /* 텍스트 색상 */
	    font-size: 16px;
	    padding: 0;
	    line-height: 1.5;
	    height: auto;
	    resize: none;  /* 크기 조절 불가 */
	    box-shadow: none;  /* 그림자 제거 */
	    overflow: hidden;  /* 스크롤바 제거 */
	}
	
	/* 수정 가능 상태 (readonly 해제)일 때 textarea 스타일 */
	textarea.editable {
	    background-color: #fff;  /* 흰색 배경 */
	    border: 1px solid #007bff;  /* 테두리 파란색 */
	    color: #333;  /* 텍스트 색상 */
	    padding: 10px;
	    resize: vertical;  /* 크기 조정 가능 */
	}
	
	.image-preview {
	    max-width: 100%; 
	    height: auto;
    }
    </style>

    <script>
    
    	// 게시판 수정, 삭제
    	
	    function enableEdit() {
	        // 제목과 내용을 편집 가능하게 함
	        document.getElementById('title').readOnly = false;
	        document.getElementById('content').readOnly = false;
	        
	        // editable 클래스 추가
	        document.getElementById('content').classList.add('editable');
	        
	        // 저장 버튼 표시
	        document.getElementById('saveButton').style.display = 'inline-block';
	
	        // 수정 버튼 숨기기
	        document.getElementById('editButton').style.display = 'none';
	    }
	
	
	    function submitForm() {
	        // hidden input 필드에 현재 값을 저장해서 서버로 전송
	        document.getElementById('hiddenTitle').value = document.getElementById('title').value;
	        document.getElementById('hiddenContent').value = document.getElementById('content').value;
	    }
	
	    function confirmDelete() {
	        return confirm("정말 이 게시글을 삭제하시겠습니까?");
	    }    
	    
	    
	    // 댓글 수정, 삭제 
	    
	    function updateReply(commentnum) {
	        let textarea = document.getElementById('reply' + commentnum);
	        	
	        // textarea 활성화
	        textarea.readOnly = false;
	
	        // 높이 자동 조정
	        textarea.style.height = 'auto';
	        textarea.style.height = textarea.scrollHeight + 'px';
	        textarea.scrollTop = 0; 
	            
	        // 수정 완료 버튼 보이기
	        document.getElementById('updateForm' + commentnum).style.display = 'block';
	        	
	        console.log("Reply " + commentnum + " is now editable");
	    }
        
        function prepareReplyUpdate(commentnum) {
            // textarea의 수정된 값을 hidden input에 저장
            let textarea = document.getElementById('reply' + commentnum);
            let hiddenInput = document.getElementById('content' + commentnum);
            hiddenInput.value = textarea.value;
        }

        function deleteReply(commentnum) {
            if (confirm("정말 이 댓글을 삭제하시겠습니까?")) {
                location.href = "${pageContext.request.contextPath}/board/DeleteReply.bo?commentnum=" + commentnum + "&boardid=" + ${board.boardid};
            }
        }
        
        function goToPage(page) {
            if (page === 'qna') {
                location.href = '${pageContext.request.contextPath}/app/qna/qna.jsp';
            } else if (page === 'board') {
                location.href = '/board/BoardList.bo';
            }
        }
        
        
    </script>
</head>
<body>

    <div class="category-container">
        <div class="category" onclick="goToPage('qna')">QnA</div>
        <div class="category selected" onclick="goToPage('board')">자유게시판</div>
    </div>

    <c:set var="board" value="${requestScope.board}" />
    <c:set var="replylist" value="${requestScope.replylist}" />

    <div class="container">
    
        <div class="title">
            제목: <input type="text" id="title" name="title" value="${board.title}" readonly />
        </div>
        
        <div class="info">
            <div>작성자: ${board.userid }</div>
            
            <!-- 수정, 삭제 버튼 -->
            <div class="edit-delete-buttons">
                <!-- 수정 버튼 -->
                <button id="editButton" class="btn-action" onclick="enableEdit()">수정</button>
                <!-- 삭제 버튼 -->
                <form action="${pageContext.request.contextPath}/board/DeleteBoard.bo" method="POST"  onsubmit="return confirmDelete();">
                    <input type="hidden" name="boardid" value="${board.boardid}">
                    <button type="submit" class="btn-action" >삭제</button>
                </form>
            </div>
        </div>

        <!-- 내용 출력 -->
        <div class="content">
            <textarea id="content" name="content" rows="10" readonly>${board.content}</textarea>
        </div>
		
<%--         <!-- 첨부된 이미지가 있을 경우 이미지 출력 -->
        <c:if test="${board != null && not empty board.imagePath}">
            <div>
                <h4>첨부 이미지</h4>
                <img src="${board.imagePath}" alt="첨부 이미지" class="image-preview">
            </div>
        </c:if>		 --%>
		
		
        <!-- 저장 버튼 -->
        <div class="button-container">
            <form action="${pageContext.request.contextPath}/board/UpdateBoard.bo" method="POST">
                <input type="hidden" name="boardid" value="${board.boardid}">
                <input type="hidden" id="hiddenTitle" name="title" value="">
                <input type="hidden" id="hiddenContent" name="content" value="">
                <button type="submit" id="saveButton" class="btn-action" style="display:none;" onclick="submitForm()">저장</button>
            </form>
        </div>
			
			
			  <!-- **댓글** 출력 -->
	    <div class="comments-container">
	        <h3>댓글</h3>
	
	        <c:choose>
	            <c:when test="${replylist != null and fn:length(replylist) > 0}">
	                <c:forEach var="reply" items="${replylist}">
	                    <div class="comment">
	                        <div><strong>${reply.userid}</strong></div>
	                        <textarea name="content" id="reply${reply.commentnum}" readonly  style="height:auto;">
							    ${reply.content}
							</textarea>
							
							<!-- **댓글** 수정 버튼 -->
							<button class="btn-action" onclick="updateReply(${reply.commentnum})">수정하기</button>
							
							<!-- **댓글** 수정 완료 버튼 -->
							<form action="${pageContext.request.contextPath}/board/UpdateReply.bo" method="post" id="updateForm${reply.commentnum}" style="display:none;" onsubmit="prepareReplyUpdate(${reply.commentnum})">
							    <input type="hidden" name="commentnum" value="${reply.commentnum}">
							    <input type="hidden" name="content" id="content${reply.commentnum}">
							    <input type="hidden" name="boardid" value="${board.boardid}">
							    <button type="submit" class="btn-action">수정 완료</button>
							</form>
	
							<!-- **댓글** 삭제 버튼 -->
	                        <button class="btn-action" onclick="deleteReply(${reply.commentnum})">삭제</button>
	                    </div>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <p>작성된 댓글이 없습니다.</p>
	            </c:otherwise>
	        </c:choose>
    	</div>

	    <!-- **댓글** 작성 폼 -->
	    <div class="reply-form">
	        <h3>댓글 작성</h3>
	        <form name="replyForm" action="${pageContext.request.contextPath}/board/AddReply.bo" method="post">
	            <input type="hidden" name="boardid" value="${board.boardid}">
	            <textarea name="content" placeholder="댓글을 입력하세요" rows="4" style="resize: none;"></textarea>
	            <button type="submit">댓글 등록</button>
	        </form>
	    </div>
			
			
			
	<div class="button-container">
	        <button type="button" class="btn-list" onclick="location.href='/board/BoardList.bo'">목록</button>
	</div>

    </div>


</body>
</html>
