<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<!-- 이 프로그램에서 jquery사용할 것 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다");	frm.password.focus();
			frm.password.value = "";		frm.password2.value = "";
			return false;
		}
	}
	function dupChk() {
		if (!frm.id.value) {	alert("아이디를 입력하고 체크하세요");
			frm.id.focus();		return false;
		}
		/* $가 jQuery사용한다 post는 메서드가 post방식 */
		$.post('confirm2.jsp','id='+frm.id.value, function(data) {
			/* #은 id, .은 클래스 */
			$('#err').html(data);
		});
		/* window.open 팝앞창으로 띄워져 */
		/* window.open("confirm1.jsp?id="+frm.id.value,"","width=300 height=300"); */
	}
</script></head><body>
<form action="join.jsp" method="post" name="frm" onsubmit="return chk()">
<table><caption>회원 가입</caption>
	<tr><th>아이디</th><td><input type="text" name="id" required="required"
		autofocus="autofocus"><input type="button" value="중복체크" onclick="dupChk()">
		<div id="err"></div></td></tr>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td><input type="password" name="password2" required="required"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name" required="required"></td></tr>
	<tr><th>주소</th><td><input type="text" name="address" required="required"></td></tr>
	<!-- pattern="010-\d{3,4}-\d{4}" 전화번호는 010 - 숫자 3또는 4자 - 숫자 4자
		 title="전화형식은 010-3/4자리-4자리" 전화번호 형식이 다르면 이 메세지를 추가해서 보여줘라
		 placeholder="010-1111-1111" 처음에 보여주고 데이터가 입력되면 꺼져 -->
	<tr><th>전화</th><td><input type="tel" name="tel" required="required"
		pattern="010-\d{3,4}-\d{4}" placeholder="010-1111-1111" 
		title="전화형식은 010-3/4자리-4자리"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
<button onclick="location.href='loginForm.jsp'">로그인</button>
</body>
</html>