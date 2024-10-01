package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		BoardDTO board = new BoardDTO();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boardtype = 1;
		
		board.setTitle(title);
		board.setContent(content);
		board.setBoardtype(boardtype);
		
		System.out.println(title);
		
		forward.setRedirect(true);
		
		if(bdao.insertBoard(board)) {	// 성공
			// boardnum seq 조회
			

			int boardid = bdao.getSeq();
			// 성공한 글의 게시글 상세보기
			forward.setPath("/board/BoardView.bo?boardid=" + boardid);
		} else {						// 실패
			forward.setPath("/board.BoardWrite.bo?flag=false");
		}
		
		
		return forward;
	}

}
