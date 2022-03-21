<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript">
	function del() {
		// 확인을 check하면 true이고, 취소를 체크하면 false 
		var ch = confirm("정말로 탈퇴하시겠습니까 ?")
		if(ch) location.href="delete.jsp";
		else alert("탈퇴가 취소 되었습니다");
	}
	function chk() {
		// 회원 목록은 관리자가 볼 수 있음
		// 자바 스크립트에서 자바변수를 사용할 때는 따옴표를 묶어서 사용
		var id = "<%= id%>";
		// 자바에서는 문자를 비교할 때 equals 메소드로, 자바스크립트에서 ==로 비교
		if (id != 'master'){
			alert("리스트를 볼 권한이 없습니다");
			return;
		} else location.href="list.jsp";
	}
</script>
</head><body>
<table><caption>회원 관리</caption>
	<tr><th><button onclick="location.href='updateForm.jsp'">회원 수정</button></th></tr>
	<tr><th><button onclick="del()">회원 탈퇴</button></th></tr>
	<tr><th><button onclick="chk()">회원 목록</button></th></tr>
	<tr><th><button onclick="location.href='logout.jsp'">로그 아웃</button></th></tr>
</table>
</body>
</html>