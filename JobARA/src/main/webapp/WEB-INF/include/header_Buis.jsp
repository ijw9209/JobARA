<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
</head>
<style>
	.logo {
		max-width:200px; 
		float:left;
		margin-right:40px;
	}
	.header-menu {
		border: 1px solid #e8e8e8;
   	 	padding: 15px 15px 10px 15px;
    }
	.header-menu li {
		float:left;
		width:8%;
		text-align:center;
	}
	.search-input {
		width:400px;
		margin-top: 7px;
		border:2px solid; 
		float:left;
	}
	.search-btn {
		margin-top: 7px;
	    width: 60px;
	    height: 50px;
	    background-color: #495057;
	    border: none;
	    color:#fff;
	}
	.footer-menu {
		border: 1px solid #e8e8e8;
   	 	padding: 15px 15px 10px 15px;
    }
	.footer-menu li {
		float:left;
		width:15%;
		text-align:left;
	}
	.footer-info {
		font-size:14px;
	}
	.footer-info span{
		font-size:20px;
	}
	#logout{
		cursor: pointer;
	}
	a{
		color: black;
	}
</style>
<body>


<header style="width:100%;">
	<div class="margin-35px-top margin-50px-bottom">
		<div class="container">
			<div class="width-100">
				<a class = "menulogo" href="/" title="메인으로 이동">
				<img src="/resources/image/logo_b.png" class="logo"/>
				</a>
				<div>
				<input type="text" name="search" class="form-control search-input"/>
				<input type="submit" class="search-btn" value="검색"/>
				</div>
			</div>
		</div>
		<div class="header-menu margin-35px-top">
			<div class="container">
				<div class="width-100 display-block">
				<ul>
					<li><b>이력서관리</b></li>
					<li>채용공고</li>
					<li>이력서보기</li>
					<li>기업∙연봉</li>
					<li>뉴스∙자료</li>
					<li><a onclick="chattpop1();">사용자간 대화</a></li>
					<li class="float-right">공고등록</li>
				
					<sec:authorize access="isAnonymous()">
   						<li class="float-right"><a href="login.do">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
   					<form action="/logout" method="post" id="logout">
						<li class="float-right" id="logout"><a id="a_tag" onclick="logoutsubmit()">로그아웃</a></li>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					</sec:authorize>
				</ul>
				</div>
			</div>
		</div>
	</div>
</header>
</body>
<script type="text/javascript">
	function logoutsubmit(){
		$("#logout").submit();
	}
	
	function chattpop1() {
		const url = '/chat.do';
		const name = 'chatt';
		var option = 'width = 850 , height = 550, top = 100, left = 200, location = no';
		window.open(url, name, option);
		
	}
</script>
</html>