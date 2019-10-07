<%@page import="com.job.prj.dto.UserMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<title>Insert title here</title>
</head>
<body>

<br><br>
      <div class="container text-center">
          <h1>메인</h1><br>
        <sec:authorize access="isAnonymous()">
   			<a href="login.do">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
   			<form action="logout" method="post">
			<input type="submit" value="로그아웃">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
   		<p><sec:authentication property="principal.username"/>님, 반갑습니다.</p>
		</sec:authorize>
		<c:if test="${empty role or role eq 'ROLE_USER'}">
   		<p>메인</p>
   		</c:if>
   		
   		<c:if test="${not empty role and role eq 'ROLE_BUIS'}">
   		<p>기업페이지</p>
   		</c:if>
   		
      <%-- </div>
      <br><br>
      <div class="container text-center col-2">
          <a href='<c:url value="/user/userpage"/>' role="button" class="btn btn-outline-secondary btn-block">USER</a>
          <a href='<c:url value="/buis/buispage"/>' role="button" class="btn btn-outline-secondary btn-block">Buis</a> --%>
      </div> 


	<a href="maria.do">maria</a>
	
	<a href="user.do">user</a> 
	
	<a href="login.do">loginform</a>
	
	<a href="/user/userpage">user</a>
	
	<a href="/buis/buispage">buis</a>
</body>
</html>