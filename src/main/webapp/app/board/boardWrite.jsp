<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
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

		.form-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 20px;
        }
		
        label { 
            display: block; 
            margin-top: 10px; 
        } 
        input, textarea { 
            width: 100%; 
            padding: 10px; 
            margin-top: 5px; 
            box-sizing: border-box;
        } 
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-list {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .btn-list:hover {
            background-color: #0056b3;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

    </style>
    <script>
        function goToPage(page) {
            if (page === 'qna') {
                location.href = '/app/qna/qna.jsp'; 
            } else if (page === 'board') {
                location.href = '/app/board/boardList.jsp'; 
            }
        }
    </script>
</head>
<body>



<div class="category-container">
    <div class="category" onclick="goToPage('qna')">QnA</div>
    <div class="category selected" onclick="goToPage('board')">자유게시판</div>
</div>

<div class="form-container">
<h3>게시글 작성</h3>
<form method="post" name="boardForm" action="/board/BoardWriteOk.bo">
    <label for="boardtitle">제목</label>
    <input type="text" id="title" name="title" placeholder="제목을 입력하세요">
	
    <label for="boardcontents">내용</label>
    <textarea id="content" name="content" rows="10" placeholder="내용을 입력하세요"></textarea>
	

    <div class="button-container">
        <button type="submit" class="btn-submit" onclick="location.href='javascript:document.boardForm.submit();'">등록하기</button>
        <button type="button" class="btn-list" onclick="location.href='/board/BoardList.bo'">목록</button>
    </div>
</form>
</div>

</body>
</html>
