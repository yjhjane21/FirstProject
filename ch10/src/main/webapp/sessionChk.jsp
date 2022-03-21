<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if (id == null || id.equals("")) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>