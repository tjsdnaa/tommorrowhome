package board.action;

import chat.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response);
}









