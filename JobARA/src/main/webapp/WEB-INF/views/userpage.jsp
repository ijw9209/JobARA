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
    height: 1200px;
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

.aside_menu{
	padding-left: 25px;
    padding-top: 15px;
    font-weight: 800;
    font-size: 17px;
}

.aside_menu_resume{
	padding-top: 10px;
    padding-left: 35px;
	font-size: 17px;
}

.aside_wrap_two{
	width: 220px;
    background-color: #fff;
    height: 280px;
    border: 1px solid #ebebeb;
    float: left;
    margin-top: 35px;
}

.center_wrap_two{
	width: 75%; 
    background-color: #fff;
    height: 650px;
    border: 1px solid #ebebeb;
    margin-left: 250px;
    margin-top: 35px;
}

.title_wrap{
padding: 35px;

}
.title_wrap h3{
font-weight: 600;
}

table{
	width: 95%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;

}
.resume_list table tr th{
	padding: 22px 0;
    border-top: 1px solid #666;
    border-bottom: none;
    background-color: #fff;
    font-weight: bold;
    font-size: 18px;
}

.th_title, .td_content{
color: #575757;
}
.resume_list table tr td{
    padding: 22px 0;
    border-bottom: 1px solid #e6e6e6;
    font-size: 18px;
}
.td_content{
    text-align: center;
}

.resume_list{
    padding-left: 30px;
}
.padding-left-90px{
	padding-left: 90px;
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
     		<aside class="aside_wrap_two">
     			<ul>
     				<li class="aside_menu">이력서관리</li>
     				<li class="aside_menu_resume"><a>ㄴ이력서등록</a></li>
     				<li class="aside_menu_resume"><a>ㄴ이력서수정</a></li>
     				<li class="aside_menu_resume"><a>ㄴ이력서삭제</a></li>
     				<li class="aside_menu">개인정보관리</li>
     				<li class="aside_menu_resume"><a>ㄴ개인정보수정</a></li>
     				<li class="aside_menu_resume"><a>ㄴ회원탈퇴</a></li>
     			</ul>
     		</aside>
     		<div class="center_wrap_two">
     			<div class="title_wrap">
     				<h3>이력서 리스트</h3>
     			</div>
     			<div class="resume_list">
     			<table summary="이력서제목 이력서작성일 이력서수정 이력서삭제">
				<colgroup>
					<col width="30">
					<col width="200">
					<col width="100">
					<col width="80">
					<col width="80">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="th_title">번호</div>
						</th>
						<th>
							<div class="th_title padding-left-90px">이력서제목</div>
						</th>
						<th>
							<div class="th_title">이력서작성일</div>
						</th>
						<th>
							<div class="th_title">이력서수정</div>
						</th>
						<th>
							<div class="th_title">이력서삭제</div>
						</th>
					</tr>
				</thead>
			<c:choose>
		<c:when test="${empty resumedetail}">
			<tr>
				<td colspan="3">----------------내용이없습니다-------</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${resumedetail}" var="dto" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td><div class="td_content">${dto.resume_title}</div></td>
						<td><div class="td_content">${dto.reg}</div></td>					
						<td><div class="td_content">수정</div></td>
						<td><div class="td_content">삭제</div></td>
					</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
		</tbody>	
			</table>
			</div>
     		</div>
     	</div>
     </div>
</body>
</html>