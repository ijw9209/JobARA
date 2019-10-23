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
</head>
<body>
<div id="container">
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>ID</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="3">-----작성된 글이 존재하지 않습니다.-----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.faq_no_seq }</td>
							<td><a href="faqone.do">${dto.faq_title }</a></td>
							<td>${dto.faq_id }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<c:if test="${!empty UserMemberDto }">
				<c:when test="${ UserMemberDto.member_role eq 'ADMIN' }">
					<tr>
						<td colspan="3">
							<input type="button" value="글 작성" onclick="location.href='faqinsert.do'"/>
						</td>
					</tr>
				</c:when>
			</c:if>
		</tbody>
		
	</table>
</div>	
</body>
<%@ include file="/WEB-INF/include/footer.jsp"  %>
</html>