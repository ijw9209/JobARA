<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<c:if test="${empty role or role eq 'ROLE_USER'}">
<%@ include file="/WEB-INF/include/header.jsp"%>
</c:if>
<c:if test="${not empty role and role eq 'ROLE_BUIS'}">
<%@ include file="/WEB-INF/include/header_Buis.jsp"%>
</c:if>
<style type="text/css">
.wrap{
height: 500px;

}

</style>
<title>Insert title here</title>
</head>
<body>
	<!-- 기업명	제목	지원자격	근무조건	마감일·등록일 -->
	<div class="container wrap">
		<table class="width-100 regist-table">
			<tr>
				 <th>기업명</th>
				 <th colspan="3">제목</th>
				 <th>지원자격</th>
				 <th>근무조건</th>
				 <th>마감일</th>
			</tr>
			<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th>---채용공고가 없습니다.---</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.hire_company_title }</td>
						<td colspan="3"><a href="recruitdetil.do?hire_no_seq=${dto.hire_no_seq }&member_no_seq=${dto.member_no_seq}">${dto.hire_recruit_name }</a></td>
						<td>
							경력 : ${dto.hire_career }<br>
							학력 : ${dto.hire_edu }
						</td>
						<td>${dto.hire_position }</td>
						<td>~${dto.hire_endday }</td>
					</tr>
					
				</c:forEach>
			</c:otherwise>			
			</c:choose>
				
		</table>
	</div>


</body>
<%@ include file="/WEB-INF/include/footer.jsp"%>
</html>