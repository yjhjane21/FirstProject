<%@page import="java.util.List,ch10.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<%
	final int ROW_PER_PAGE = 10;
	final int PAGE_PER_BLOCK = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum.equals("")) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1
	int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
	// 끝번호 	시작번호 + 페이지당개수 - 1			
	int endRow = startRow + ROW_PER_PAGE - 1;
	MemberDao md = MemberDao.getInstance();
	int total = md.getTotal();
	int totalPage = (int)Math.ceil((double)total / ROW_PER_PAGE);
// 시작페이지 구하는 식 : 현재페이지 - (현재페이지 - 1)%10(블럭당 페이지 숫자)
	int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
// endPage구하는 식 : 시작페이지 + 블록당페이지 수 -1
	int endPage = startPage + PAGE_PER_BLOCK - 1;
//	만약 endPage가 총페이지보다 크면 endPage는 총페이지로 변경
	if (endPage > totalPage) endPage = totalPage;
	List<Member> list = md.list(startRow, endRow); 
	pageContext.setAttribute("list", list);
%>
<table><caption>회원 목록</caption>
	<tr><th>아이디</th><th>이름</th><th>주소</th><th>가입일</th><th>탈퇴여부</th></tr>
<c:if test="${empty list}">
	<tr><th colspan="5">데이터가 없습니다</th></tr>
</c:if>
<c:if test="${not empty list}">
	<c:forEach var="member" items="${list }">
		<tr><td>${member.id }</td><td>${member.name }</td>
			<td>${member.address }</td><td>${member.reg_date }</td>
			<td>${member.del }</td></tr>
	</c:forEach>
</c:if>
</table>
<div align="center">
	<!-- 앞에 보여줄이 있어 -->
	<% if (startPage > PAGE_PER_BLOCK) { %>
		<button onclick="location.href='list.jsp?pageNum=<%=startPage-1%>'">이전</button>
	<% } %>
	<c:forEach var="i" begin="<%=startPage%>" end="<%=endPage %>">
		<button onclick="location.href='list.jsp?pageNum=${i}'">${i}</button>
	</c:forEach>
	<!-- 아직 보여줄 것이 남아 있다 -->
	<% if (endPage < totalPage) {%>
		<button onclick="location.href='list.jsp?pageNum=<%=endPage+1%>'">다음</button>
	<% } %>
	<br><button onclick="location.href='main.jsp'">메인</button>
</div>
</body>
</html>