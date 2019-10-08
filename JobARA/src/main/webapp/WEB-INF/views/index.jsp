<%@page import="com.job.prj.dto.UserMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.header{
	    background-color: #00c362;
		height: 70px;
	}
	.logo {
		max-width:200px; 
		float:left;
		margin-right:40px;
	}
	.header_menu_ul{
	
	}
	
	.header_menu_ul li{
		float: left;
   		width: 15%;
    	text-align: center;
    	margin-top: 19px;
	}
	
	.menu_list > a{
    color: white;
    font-weight: bold;
    font-size: 18px;
    }
    
	.header_menu{
		float: left;
		width: 60%;
	}
	

</style>
<%@ include file="/WEB-INF/include/header.jspf"  %>
<title>Insert title here</title>
</head>
<body>
          
		<c:if test="${empty role or role eq 'ROLE_USER'}">
   		<header class="header">
   			<div class="container">
   				<div class="width-100">
					<a class = "menulogo" href="/" title="메인으로 이동">
						<img src="/resources/image/logo_w.png" class="logo"/>
					</a>
   				</div>
   				<div class="header_menu">
   					<div class="container">
   						<div class="width-100 display-block">
							<ul class="header_menu_ul">
								<li class="menu_list"><a style="padding-left: 20px;">채용공고</a></li>
								<li class="menu_list"><a>기업정보</a></li>
								<li class="menu_list"><a>취업박람회</a></li>
								<li class="menu_list"><a>고객센터</a></li>
		   					</ul>
   					</div>
   				</div>
   			</div>
   			</div>
   			
   			
   			
   			
   			
   		</header>
   		
   		<p>메인</p>
   		</c:if>
   		
   		<c:if test="${not empty role and role eq 'ROLE_BUIS'}">
   		<p>기업페이지</p>
   		</c:if>
   		
   
	<a href="maria.do">maria</a>
	
	<a href="user.do">user</a> 
	
	<a href="login.do">loginform</a>
	
	<a href="/user/userpage">user</a>
	
	<a href="/buis/buispage">buis</a>
	
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
</body>
</html>