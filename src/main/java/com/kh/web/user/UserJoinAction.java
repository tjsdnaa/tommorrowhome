package com.kh.web.user;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.user.dao.UsersDAO;
import com.kh.web.user.dao.UsersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDTO user = new UsersDTO();
		UsersDAO udao = new UsersDAO();
		
		String user_id = req.getParameter("user_id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		String tel = req.getParameter("tel");
		
		
		// 요청받아온 키값을 dto에 세팅
		user.setUser_id(user_id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setTel(tel);
		 
		forward.setRedirect(true);
			// dao에서 MyBatis로 커넥션된 db의 insert처리되면
			if ( udao.join(user) ) {
				// 회원가입 성공처리
				forward.setPath("/user/login.jsp");
			} else {
				// 회원가입 실패처리
				forward.setPath("/user/join.jsp");
			}
		return forward;
	}

	

	
	
	
}
