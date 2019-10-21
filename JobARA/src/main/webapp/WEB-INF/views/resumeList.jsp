<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이력서 관리</h1>
	
	<a href="hopeResume.do">희망 근무 조건</a>
	<table border="1">

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4">---------작성된 이력서가 존재하지 않습니다.----------</td>


				</tr>


			</c:when>
			<c:otherwise>

				<tr>
					<th>제목</th>
					<th>작성일</th>
					<th>사진</th>

				</tr>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><a href="selectOneResume.do?resume_no_seq=${dto.userresumedetaildto.resume_no_seq }&member_no_seq=${seq}">${dto.userresumedetaildto.resume_title }</a></td>
						<td>${dto.resume_date }</td>
						<td>${dto.userresumedetaildto.resume_photo }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<tr>
				<td><input type="button" value="이력서 작성하기" onclick="location.href='ResumeInsert.do?member_no_seq=${seq}'"></td>
			
			</tr>
			
		
	</table>

</body>
</html>