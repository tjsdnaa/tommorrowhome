package chat.action;

import chat.dao.ChatDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChatMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ChatDAO cdao = new ChatDAO();
		
				
		forward.setPath("/chat/chatmain.jsp");
		forward.setRedirect(false);	// forward 이동
		
		return forward;
	}

}
