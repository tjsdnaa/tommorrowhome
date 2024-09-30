package board.action;


import java.util.ArrayList;
import java.util.List;

import board.dao.BoardDAO;
import board.dao.BoardDTO;
import chat.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		int currentPage = 1;
		if(request.getParameter("page")!=null){
			currentPage=Integer.parseInt(request.getParameter("page"));
		} // 현재 페이지 (기본값 1)
		int pageSize = 10; // 페이지당 게시물 수
		int totalCount = bdao.getTotalCount(); // 전체 게시물 수
		
		request.setAttribute("boardList", bdao.getBoardList(currentPage,pageSize));
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totalCount", totalCount);
		
		forward.setPath("/board/boardlist.jsp");
		forward.setRedirect(false);	// forward 이동
		
		
		return forward;
	}
	
}
