<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
margin-right: 100px;
}


</style>
</head>
<body>
<div class="container wrap">
	<table border="1">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>회원번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4">-----작성된 글이 존재하지 않습니다.-----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.customer_no_seq }</td>
							<td>${dto.member_no_seq }</td>
							<td><a href="customerone.do?customer_no_seq=${dto.customer_no_seq }">${dto.customer_title }</a></td>
							<td>${dto.customer_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4">
					<input type="button" value="글 작성" onclick="location.href='customerinsert.do'"/>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
<%@ include file="/WEB-INF/include/footer.jsp"  %>
</html>