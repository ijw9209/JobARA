<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<form action="faqone.do" method="post">
	<input type="hidden" name="faq_no_seq" value="${dto.faq_no_seq }"/>
	<table border="1">
		<thead>
			<tr>
				<th>작성자</th>
				<td>${dto.faq_id }</td>
			</tr>
			<tr>
				<th>제   목</th>
				<td>${dto.faq_title }</td>
			</tr>
			<tr>
				<th>내   용</th>
				<td>${dto.faq_content }</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty UserMemberDto }">
				<c:choose>
					<c:when test="${ UserMemberDto.member_role eq 'ADMIN' }">
						<tr>
							<td colspan="3">
								<input type="button" value="수정" onclick="location.href='faqupdate.do'"/>
								<input type="button" value="삭제" onclick="location.href='faqdelete.do'"/>
								<input type="button" value="목록" onclick="location.href='customerfaq.do'"/>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>
								<input type="button" value="목록" onclick="location.href='customerfaq.do'"/>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:if>
		</tbody>
	</table>
	</form>
</div>
</body>
</html>