package com.kh.web.user;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		String requestURI = req.getRequestURI();
		ActionForward forward = new ActionForward();
		switch (requestURI) {
			// 로그인 버튼을 눌렀을때
			// /user/UserLogin.us 에 맞으면
			case "/user/UserLogin.us" : {
				// /web/user/login.html" 으로 이동
				forward = new ActionForward(false, "/user/login.jsp");
				break;
			}
			// 회원가입을 눌렀을때
			case "/user/UserJoin.us" : {
				forward = new ActionForward(false, "/user/join.jsp");
				break;
			}
			// 로그인을 했을때
			case "/user/UserLoginOk.us" : {
				forward = new UserLoginOkAction().execute(req,resp);
				break;
			}
			// 회원가입을 완료했을때
			case "/user/UserJoinOk.us" : {
				forward = new UserJoinAction().execute(req, resp);
			}
			// 로그아웃 했을 때
			case "/user/UserLogoutOk.us" : { 
				forward = new UserLogoutOkAction().execute(req,resp); 
				// System.out.println("프론트 컨트롤러 도착");
			}
		}
		
		// 페이지 이동에 대한 일괄처리
		if ( forward != null ) {
			
			if ( forward.isRedirect() ) {
				// redirect 방식으로 이동할 경우
				resp.sendRedirect(forward.getPath());
			} else {
				// foward 방식으로 이동할 경우
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
			
		}
	}
}
