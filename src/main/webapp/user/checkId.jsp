<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.web.user.dao.UsersDAO"%>
<%
    String user_id = request.getParameter("user_id");
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
%>
