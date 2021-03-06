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
		width: 10%;
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
		cursor: pointer;
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
	.menu_list{
		cursor: pointer;
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
					<li><b class="menu_list"><a href="/recruitment.do">채용공고</a></b></li>
					<li><b class="menu_list"><a href="/companylist">기업</a></b></li>
					<li><b class="menu_list"><a href="/calendar.do">채용박람회</a></b></li>
					<li><b class="menu_list" style="margin-left: 20px;">기업∙연봉</b></li>
					<li style="width: 10%; margin-left: 15px;"><b class="menu_list"><a onclick="chattpop();">사용자간 대화</a></b></li>
					<li class="float-right"><b><a href="/user/userpage/">마이페이지</a></b></li>
				
					<sec:authorize access="isAnonymous()">
   						<li class="float-right"><b><a href="login.do">로그인</a></b></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
   					<form action="/logout" method="post" id="logout">
						<li class="float-right" id="logout"><a id="a_tag" style="font-weight: 600;" onclick="logoutsubmit()">로그아웃</a></li>
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
	
	function chattpop() {
		const url = '/chat.do';
		const name = 'chatt';
		var option = 'width = 850 , height = 550, top = 100, left = 200, location = no';
		window.open(url, name, option);
		
	}
</script>
</html>