package chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import board.action.BoardListAction;
import chat.action.ActionForward;
import chat.action.ChatMainAction;
import chat.dao.ChatDAO;
import chat.dao.ChatDTO;
import board.action.BoardDetailAction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.ch")
public class ChatFrontcontroller extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // MessageDAO를 사용해 데이터베이스에서 메시지 리스트를 가져옴
        ChatDAO cdao = new ChatDAO();
        
        // JSP 페이지로 전달
        request.getRequestDispatcher("/chat/chatmain.jsp").forward(request, response);
    }
}