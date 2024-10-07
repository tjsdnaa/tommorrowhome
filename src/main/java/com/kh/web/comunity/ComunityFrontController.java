package com.kh.web.comunity;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.co")
public class ComunityFrontController extends HttpServlet{
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
		// 커뮤니티 게시글 중 집들이 메뉴로 이동
		if ( requestURI.equals("/comunity/homeproject.co") ) {
			// System.out.println("front !!");
			forward = new ActionForward(true, "/comunity/welcomehouse.jsp");
		} else if ( requestURI.equals("") ) {
			// 집들이 글쓰기
			forward = new ComunityWriteOkAction().execute(req, resp);
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
