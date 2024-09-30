<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<html>
<head>
    <title>채팅방</title>
    <style>
        /* 전반적인 레이아웃 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .chat-container {
            background-color: white;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        /* 제목 스타일 */
        .chat-title {
            text-align: center;
            background-color: #35C5F0;
            color: white;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
        }

        /* 채팅창 */
        .chatbox {
            border-bottom: 1px solid #ccc;
            height: 300px;
            overflow-y: auto;
            padding: 10px;
            background-color: #fafafa;
        }

        /* 입력 섹션 */
        .input-section {
            display: flex;
            flex-direction: column;
            padding: 15px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: calc(100% - 22px); /* 패딩과 보더 보정 */
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="text"]::placeholder {
            color: #aaa;
        }

        button {
            padding: 10px;
            background-color: #35C5F0;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }


        /* 채팅 메시지 스타일 */
        .chat-message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #e1f5fe;
            text-align: left;
        }

        .chat-message .sender {
            font-weight: bold;
            color: #007BFF;
        }

        .chat-message .message-text {
            margin-top: 5px;
            color: #333;
        }

        .chat-message.receiver {
            background-color: #c8e6c9;
        }

        /* 스크롤바 스타일 */
        .chatbox::-webkit-scrollbar {
            width: 5px;
        }

        .chatbox::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 10px;
        }

        .chatbox::-webkit-scrollbar-track {
            background-color: #fafafa;
        }
    </style>

    <script>
        window.onload = function() {
            // 함수 호출
            loadMessages();
        };

        function sendMessage() {
            var message = document.getElementById('message').value;
            var sendID = document.getElementById('sendID').value;
            var userID = document.getElementById('userID').value;

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'sendMessage.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onload = function() {
                loadMessages(userID);  // 메시지 전송 후 채팅창 업데이트
            };

            xhr.send('userID=' + encodeURIComponent(userID) + '&sendID=' + encodeURIComponent(sendID) + '&message=' + encodeURIComponent(message));
            
            document.getElementById('message').value = '';  // 입력 필드 초기화
        }

        function loadMessages(userID) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'getMessages.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                var chatbox = document.getElementById('chatbox');
                chatbox.innerHTML = xhr.responseText;  // 채팅창에 메시지 표시

                // 스크롤을 맨 아래로 이동
                chatbox.scrollTop = chatbox.scrollHeight; // 스크롤 위치 조정
            };
            xhr.send('userID=' + encodeURIComponent(userID));
        }
    </script>
</head>
<body>
    <div class="chat-container">
        <div class="chat-title">채팅방</div> <!-- 채팅방 제목 추가 -->
        <div id="chatbox" class="chatbox">
            <!-- 채팅 메시지가 여기 표시됨 -->
        </div>
        <div class="input-section">
            <input type="text" id="userID" placeholder="유저아이디를 입력하세요">
            <input type="hidden" id="sendID" value="로그인 해야 뜸">
            <input type="text" id="message" placeholder="메시지를 입력하세요">
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>
</body>
</html>
