<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<th>ID</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="selectone.do?id=${dto.member_no_seq}">${dto.member_no_seq}</a></td>
					<td>${dto.member_name}</td>
					<td>${dto.member_id}</td>				
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