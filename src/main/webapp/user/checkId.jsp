<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.web.user.dao.UsersDAO"%>
<%
    String user_id = request.getParameter("user_id");

    // 아이디가 null이거나 빈 문자열인지 체크
    if (user_id == null || user_id.trim().isEmpty()) {
        out.print("아이디를 입력해주세요.");
    } else {
        boolean isDuplicate = new UsersDAO().checkId(user_id);
    
        if (isDuplicate) {
%>
사용할 수 있는 아이디입니다.
<%
        } else {
%>
중복된 아이디입니다.
<%
        }
    }
%>