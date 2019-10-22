<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 

<%@ include file="/WEB-INF/include/header.jspf"  %>
<title>JobARA</title>
		<link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/component.css" />
		<script src="/resources/js/modernizr.custom.js"></script>
		<style type="text/css">
	
	.logo_a{
		max-width: 250px;
		float: left;
	}
	.logo_a img{
		max-width: 250px;
		float:left;
		margin-right:40px;
	}
	
	.header_menu{
	    width: 95%;
	}
	.header_menu_ul{
		
	}
	.header_menu_ul li{
		float:left;
		font-size: 20px;
  	 	padding-left: 28px;
	}
	.codrops-demos a:hover{
	    color: #debcc3 !important;
	}
/* 스크롤 */
.scroll{
      height: 100px;
    width: 100px;
    position: relative;
    top: 310px;
    left: 135px;
}
.scroll_a {
  padding-top: 70px;
      font-size: 20px;
}
.scroll_a span {
  position: absolute;
  top: -70px;
  left: 50%;
  width: 24px;
  height: 24px;
  margin-left: -12px;
  border-left: 1px solid #fff;
  border-bottom: 1px solid #fff;
  -webkit-transform: rotateZ(-45deg);
  transform: rotateZ(-45deg);
  -webkit-animation: sdb 1.5s infinite;
  animation: sdb 1.5s infinite;
  box-sizing: border-box;
}
@-webkit-keyframes sdb {
  0% {
    -webkit-transform: rotateY(0) rotateZ(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    -webkit-transform: rotateY(720deg) rotateZ(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
}
@keyframes sdb {
  0% {
    transform: rotateY(0) rotateZ(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: rotateY(720deg) rotateZ(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
} 

/*메뉴 위아래 밑줄연장 */
.menu_a {
  position: relative;
  display: inline-block;
  transition: .3s;
}
.menu_a::before,
.menu_a::after {
  position: absolute;
  left: 50%;
  content: '';
  width: 0;
  height: 1px;
  background-color: #ffffff;
  transition: .3s;
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
}
.menu_a::before {
  top: 0;
}
.menu_a::after {
  bottom: 0;
}
.menu_a:hover::before,
.menu_a:hover::after {
  width: 100%;
}
/*푸터설정*/
.footer-menu {
	margin-top : 0px;
	border : none;
	border-bottom: 1px solid #ffffff;
}
.footer-info{
padding-bottom: 40px;
}
.foot_area{
background-color: #61584c;
color: #fff;
}
</style>
</head>
<body>
		<!-- 관리자 페이지 보내기 -->
        <c:if test="${not empty role and role eq 'ROLE_ADMIN'}">
        <script type="text/javascript">
        	location.href="admin/adminpage";
        </script>
        </c:if>
		<c:if test="${empty role or role eq 'ROLE_USER'}">
   		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a class="logo_a" href="#"><img src="/resources/image/logo_w.png" class="logo"/></a>
				<div class="header_menu"><ul class="header_menu_ul">
								<li class="menu_list"><a class="menu_a" style="color: #fff; padding-left: 10px;" href="recruitment.do">채용공고</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;" href="companylist">기업정보</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;" href="calendar.do">취업박람회</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;">고객센터</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;" href="user/userpage">마이페이지</a></li>
		   					</ul></div>
			</div>
			<div id="boxgallery" class="boxgallery" data-effect="effect-1">
				<div class="panel"><img src="/resources/image/main1.jpg" alt="Image 1"/></div>
				<div class="panel"><img src="/resources/image/main2.jpg" alt="Image 2"/></div>
				<div class="panel"><img src="/resources/image/main3.jpg" alt="Image 3"/></div>
				<div class="panel"><img src="/resources/image/main4.jpg" alt="Image 4"/></div>
			</div>
			<header class="codrops-header">
				<h1 style="color: #fff;">Create your future<span style="color: #ebebeb;">I will be with you forever </span></h1>
				<nav class="codrops-demos">
				<sec:authorize access="isAnonymous()">
					<a class="login" href="login.do">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
   				<form action="logout" method="post" name="fr">
					<a class="logout_a" style="cursor: pointer; color: #fff;" onclick="logout();">로그아웃</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				</sec:authorize>
				<div class="scroll">
				<a class="scroll_a" style="color: #fff;"><span></span><span></span><span></span>Scroll</a>
				</div>
				</nav>
			</header>
		</div>
   		
	
   		</c:if>
   		
   		<c:if test="${not empty role and role eq 'ROLE_BUIS'}">
   		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a class="logo_a" href="#"><img src="/resources/image/logo_w.png" class="logo"/></a>
				<div class="header_menu"><ul class="header_menu_ul">
								<li class="menu_list"><a class="menu_a" style="color: #fff; padding-left: 10px;" href="announcement.do">공고등록</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;">지원자관리</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;">인재검색</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;">고객센터</a></li>
								<li class="menu_list"><a class="menu_a" style="color: #fff;" href="buis/buispage">마이페이지</a></li>
		   					</ul></div>
			</div>
			<div id="boxgallery" class="boxgallery" data-effect="effect-1">
				<div class="panel"><img src="/resources/image/main1.jpg" alt="Image 1"/></div>
				<div class="panel"><img src="/resources/image/main2.jpg" alt="Image 2"/></div>
				<div class="panel"><img src="/resources/image/main3.jpg" alt="Image 3"/></div>
				<div class="panel"><img src="/resources/image/main4.jpg" alt="Image 4"/></div>
			</div>
			<header class="codrops-header">
				<h1 style="color: #fff;">Create your future<span style="color: #ebebeb;">I will be with you forever </span></h1>
				<nav class="codrops-demos">
				<sec:authorize access="isAnonymous()">
					<a class="login" href="login.do">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
   				<form action="logout" method="post" name="fr">
					<a class="logout_a" style="cursor: pointer; color: #fff;" onclick="logout();">로그아웃</a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				</sec:authorize>
				<div class="scroll">
				<a class="scroll_a" style="color: #fff;"><span></span><span></span><span></span>Scroll</a>
				</div>
				</nav>
			</header>
		</div>
   		</c:if>  
</body>
<script src="/resources/js/classie.js"></script>
<script src="/resources/js/boxesFx.js"></script> 
<script type="text/javascript">
new BoxesFx( document.getElementById( 'boxgallery' ) );

window.onload = function() {
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}

	function logout(){
		document.fr.submit();
	}

</script>
</html>