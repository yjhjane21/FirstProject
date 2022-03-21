<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<%	String id = request.getParameter("id"); %>
<script type="text/javascript">
	function wincl() {
		// opener 지금 이창을 띄운 부모 창
		opener.frm.id.value = "<%=id%>";
		window.close();
	}
</script>
</head><body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	if (result > 0) {
%>
<h2>중복된 아이디이니 다른 것을 입력하세요</h2>
<!-- action 비어있으면 현재 작업 다시 실행 -->
<form action="">
	아이디 : <input type="text" name="id" required="required"
		autofocus="autofocus"><p>
	<input type="submit" value="확인">
</form>
<%  } else { %>
<h2>사용 가능합니다</h2>
<button onclick="wincl()">창닫기</button>
<%  } %>
</body>
</html>