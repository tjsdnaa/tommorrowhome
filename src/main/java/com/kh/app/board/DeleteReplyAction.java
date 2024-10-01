package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteReplyAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = new ActionForward();
      
      BoardDAO bdao = new BoardDAO();
      // bdao.deleteReply();
      
      int commentnum = Integer.parseInt(request.getParameter("commentnum"));
      String boardid = request.getParameter("boardid");
      
      if(bdao.deleteReply(commentnum)) {
         forward.setPath("/board/BoardView.bo?boardid="+ boardid);
         forward.setRedirect(true);
         
      }  else {
    	    forward.setPath("/board/BoardView.bo?boardid=" + boardid );
    	    forward.setRedirect(true);
    	}
      
      return forward;
   }

}