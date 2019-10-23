<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<%@ include file="/WEB-INF/include/header.jsp"  %>
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<form action="customerone.do" method="post">
		<input type="hidden" name="customer_no_seq" value="${dto.customer_no_seq }"/>
		<table border="1">
			<thead>
				<tr>
					<th>회원번호</th>
					<td>${dto.member_no_seq }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.customer_title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${dto.customer_content }</td>
				</tr>
				<c:if test="${!empty UserMemberDto }">
					<c:if test="${ UserMemberDto.member_role eq 'ADMIN' }">
						<tr>
							<th>Email</th>
							<td>${dto.customer_email }</td>
						</tr>
					</c:if>
				</c:if>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						<c:if test="${!empty UserMemberDto }">
							<c:if test="${ UserMemberDto.member_no_seq eq dto.member_no_seq }">
								<input type="button" value="수정하기" onclick="location.href='customerupdate.do?customer_no_seq=${dto.customer_no_seq}'"/>
								<input type="button" value="삭제하기" onclick="location.href='customerdelete.do?customer_no_seq=${dto.customer_no_seq}'"/>
							</c:if>
						</c:if>
						<input type="button" value="목록" onclick="location.href='customerservice.do'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
<%@ include file="/WEB-INF/include/footer.jsp"  %>
</html>