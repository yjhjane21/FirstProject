<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = MemberDao.getInstance();
	int result = md.loginChk(id, password);
	if (result > 0) {
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
%>
<%  } else if (result == 0) { %>
<script type="text/javascript">
	alert("암호가 다릅니다"); 
	history.back();
</script>
<%  } else { %>
<script type="text/javascript">
	alert("없는 아이디입니다. 꺼져"); 
	history.back();
</script>
<%  } %>
</body>
</html>