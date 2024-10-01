package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		 ActionForward forward = new ActionForward();
	      
	     BoardDAO bdao = new BoardDAO();
	     
	     int boardid = Integer.parseInt(request.getParameter("boardid"));
	     String title = request.getParameter("title");
	     String content = request.getParameter("content");
		
	     if(bdao.deleteBoard(boardid)) {
	    	 forward.setPath("/board/BoardList.bo");
	         forward.setRedirect(true);
	     } else {
	    	 forward.setPath("/board/BoardList.bo");
	         forward.setRedirect(true);
	     }
		return forward;
	}

}
