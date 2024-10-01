
  package com.kh.app.board;
  
  import com.kh.app.board.dao.BoardDAO; import com.kh.app.board.dao.BoardDTO;
  import com.kh.app.board.dao.ReplyDTO; import com.kh.web.action.Action; import
  com.kh.web.action.ActionForward;
  
  import jakarta.servlet.http.HttpServletRequest; import
  jakarta.servlet.http.HttpServletResponse;
  
  public class AddReplyAction implements Action{
  
	  @Override public ActionForward execute(HttpServletRequest request,
	  HttpServletResponse response) { ActionForward forward = new ActionForward();
	  
		  BoardDAO bdao = new BoardDAO(); 
		  ReplyDTO reply = new ReplyDTO();
		  
		  int boardid = Integer.parseInt(request.getParameter("boardid")); 
		  String content = request.getParameter("content");
		  
		  reply.setBoardid(boardid);
		  reply.setContent(content);
		  
		  if(bdao.addReply(reply)) { 
			  forward.setRedirect(true);
			  forward.setPath("/board/BoardView.bo?boardid=" + boardid); 
		  }
	  
	  
	  return forward;
	  }
  
  }
 