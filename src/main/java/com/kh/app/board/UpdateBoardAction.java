package com.kh.app.board;

import java.util.HashMap;
import java.util.Map;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateBoardAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    	
    	ActionForward forward = new ActionForward();
    	BoardDAO bdao = new BoardDAO();

    	int boardid =  Integer.parseInt(request.getParameter("boardid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        System.out.println("boardid : " + boardid);
        System.out.println("title : " + title);
        System.out.println("content : " + content);
        
       if(bdao.updateBoard(boardid, title, content)) {
    	   forward.setRedirect(false);
    	   forward.setPath("/board/BoardView.bo?boardid=" + boardid);
       }
        return forward;
    }
}