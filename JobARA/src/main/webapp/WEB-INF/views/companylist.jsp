<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
</head>
<body>

	<h1>기업목록</h1>
	
	<table>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
			<td><h3>기업 정보가 없습니다</h3></td>
			</tr>
			</c:when>
		<c:otherwise>
			<tr>
				<th>기업이름</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="#">${dto.company_title}</a></td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2">
						<input type="button" onclick="location.href='insert.do'" value="고객 추가"/>
					</td>
				</tr>
		</c:otherwise>
		</c:choose>
	
</body>
</html>