<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	// session 정보 지우기
	session.invalidate();
	// 단위 초이고 해당 시간이 지나면 자동으로 세션 삭제
	// session.setMaxInactiveIntercal(60*60)
%>
<script type="text/javascript">>
	alert("로그아웃 되었습니다.");
	location.href="loginForm.jsp";
</script>
</body>
</html>