package com.kh.web.user;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.user.dao.UsersDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		
		forward.setRedirect(true);
		if (udao.login(user_id, password)) {
			// 로그인 성공
			forward.setPath("/main/index.jsp");
		} else {
			// 로그인 실패
			forward.setPath("/user/login.jsp");
		}
		return forward;
	}

}
