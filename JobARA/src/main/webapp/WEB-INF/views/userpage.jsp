<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>User Page</title>
<style type="text/css">
.wrap{
	width: 100%;
    background-color: #f8f8f8;
    height: 1000px;
    position: relative;
    top: -50px;
}
.aside_wrap{
    width: 220px;
    background-color: #fff;
    height: 280px;
    border: 1px solid #ebebeb;
    float: left;
}

.profile_info{
	float: left;
    width: 190px;
}
.wrap_info{
padding-top: 130px;
}
.profile_photo{
    width: 150px;
    height: 130px;
    margin-left: 35px;
    margin-top: 30px;
    border: 1px solid #ebebeb;
    border-radius: 60px;
}
.profile_name{
	margin-left: 25px;
    margin-top: 15px;
    font-size: 19px;
    color: #333;
    text-align: center;
}
.resume_view a{
	padding: 2px 7px 4px;
    border: 1px solid #e7e9e9;
    font-size: 16px;
    color: #333;
}
.resume_view{
	text-align: center;
    margin-top: 10px;
    margin-left: 25px;
}
.center_wrap{
	width: 75%; 
    background-color: #fff;
    height: 280px;
    border: 1px solid #ebebeb;
    margin-left: 250px;
}

.center_context{
    height: 170px;
}

.center_context li {
  	float: left;
    text-align: center;
    background-color: #f8f8f8;
    border-radius: 80px;
    width: 150px;
    height: 130px;
    margin-left: 40px;
    margin-top: 33px;
    border: 1px solid #ebebeb;
    border-radius: 60px;
    font-size: 50px;
    font-weight: normal;
    color: #46a5ff;
    text-align: center; 
    line-height: 115px;
}
.center_text_ul{

}
.center_text_ul li{
	float: left;
    text-align: center;
    margin-left: 40px;
    margin-top: 15px;
    width: 150px;
    font-size: 19px;
    color: #444;
    font-weight: 800;
    
}
</style>
</head>
<body>


     <div class="wrap">
     	<div class="container wrap_info">
     		<section class="myContent">
     		<aside class="aside_wrap">
     			<div class="profile_info">
     				<div class="profile_photo"></div>
     				<div class="profile_name">
     				<strong>${dto.member_name}</strong>님
     				</div>
     				<div class="resume_view">
						<a href="#">내이력서</a>     				
     				</div>
     			</div>
     		</aside>	
     		<div class="center_wrap">
     			<ul class="center_context">
     				<li>${countresume}</li>
     				<li>4</li>
     				<li>1</li>
     				<li>4</li>
     			</ul>
     			<ul class="center_text_ul">
     				<li>이력서</li>
     				<li>입사지원완료</li>
     				<li>이력서 열람 횟수</li>
     				<li>스크랩</li>
     			</ul>
     		</div>
     		</section>
     		<aside class="aside_wrap">
     			
     		</aside>
     	</div>
     </div>
</body>
</html>