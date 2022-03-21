<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.delete(id);
	if (result > 0) {
		// 탈퇴한 브라우저를 닫지 않더라도 현 사이트를 사용 못하게 세션을 삭제 
		session.invalidate(); 
%>
<script type="text/javascript">
	alert("탈퇴 되었습니다");
	location.href="loginForm.jsp";
</script>
<%	} else {  %>
<script type="text/javascript">
	alert("탈퇴가 되지 않았습니다.");
	history.go(-1);
</script>
<%  } %>
</body>
</html>