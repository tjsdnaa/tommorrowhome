package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int commentnum = Integer.parseInt(request.getParameter("commentnum"));
		String content = request.getParameter("content");
		String boardid = request.getParameter("boardid");
		
		// 테스트 코드
		System.out.println("commentnum : " + commentnum);
		System.out.println("content : " + content);
		System.out.println("boardid : " + boardid);
		
		if(bdao.updateReply(commentnum, content)) {
		      System.out.println("수정할 댓글 번호: " + commentnum);
			forward.setRedirect(true);
			// 상세 보기 페이지로 이동
			forward.setPath("/board/BoardView.bo?boardid=" + boardid);
		};
		
		return forward;
	}

}
