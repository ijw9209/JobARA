<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>전체 목록</h1>
	
	<table border="1">
		<c:choose>
			<c:when test="${empty list}">
		<tr>
			<td><h3>고객 정보가 없습니다</h3></td>
		</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<th>NO</th>
				<th>NAME</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="selectone.do?id=${dto.no}">${dto.no}</a></td>
					<td>${dto.name}</td>				
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2">
						<input type="button" onclick="location.href='insert.do'" value="고객 추가"/>
					</td>
				</tr>
		</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
