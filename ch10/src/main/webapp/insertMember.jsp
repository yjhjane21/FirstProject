<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	for (int i = 10; i < 230; i++) {
		Member member = new Member();
		member.setId("k"+i);
		member.setPassword("1");
		member.setName("로제"+i);
		member.setAddress("강남"+i);
		member.setTel("010-1111-"+(1000+i));
		md.insert(member);
	}
%>
입력 완료
</body>
</html>