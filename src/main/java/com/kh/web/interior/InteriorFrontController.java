package com.kh.web.interior;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.in")
public class InteriorFrontController extends HttpServlet{
	// doGet, doPost, doProcess
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		// 인테리어/생활 메뉴로 이동  
		if ( requestURI.equals("/interior/interiorHome.in") ) {
			// System.out.println("front !!");
			forward = new ActionForward(true, "/interior/interiorlife.jsp");
		} else if ( requestURI.equals("") ) {
			// 인테리어생활 게시글 중 QNA 메뉴로 이동
			forward = new ActionForward(true, "/interior/counsel.jsp");
			
		}
			
		
		// 페이지 이동에 대한 일괄처리
		if ( forward != null ) {
			if (forward.isRedirect()) {
				// true : redirect방식으로 페이지를 이동할 경우
				resp.sendRedirect(forward.getPath());
			} else {
				// false : forward방식으로 페이지를 이동할 경우
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		} 
	}
}
