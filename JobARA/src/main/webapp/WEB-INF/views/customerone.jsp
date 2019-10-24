<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<%@ include file="/WEB-INF/include/header.jsp"  %>
<title>Insert title here</title>
<style type="text/css">
.wrap{
    height: 500px;
    text-align: center;
    margin-right: 50px;
}

</style>
</head>
<body>
<div class="container wrap">
	<form action="customerone.do" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
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
				<tr>
					<th>이메일</th>
					<td>${dto.customer_email}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						<sec:authorize access="isAuthenticated()">
								<input type="button" value="수정하기" onclick="location.href='customerupdate.do?customer_no_seq=${dto.customer_no_seq}'"/>
								<input type="button" value="삭제하기" onclick="location.href='customerdelete.do?customer_no_seq=${dto.customer_no_seq}'"/>
						</sec:authorize>	
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