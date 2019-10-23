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
<%@ include file="/WEB-INF/include/header_Buis.jsp"%>
<title>Insert title here</title>
<style type="text/css">
.wrap{
	width: 100%;
    background-color: #f3f3f4;
    height: 1200px;
    position: relative;
    top: -50px;
}

.wrap_info{
padding-top: 130px;
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
.profile_photo{
    width: 125px;
    height: 130px;
    margin-left: 43px;
    margin-top: 30px;
    border: 1px solid #ebebeb;
    border-radius: 60px;
}

.profile_photo img{
	width: 125px;
    height: 130px;
    margin-left: 0px;
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

.aside_wrap_two{
	width: 220px;
    background-color: #fff;
    height: 280px;
    border: 1px solid #ebebeb;
    float: left;
    margin-top: 35px;
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
					<div class="profile_photo"><img alt="사진" src="${companyInfo.company_logo_url}"/></div>
					<div class="profile_name">
     				<strong>${dto.member_name}</strong>님
     				</div>
     				<div class="resume_view">
						<a href="/announcement.do">채용공고등록</a>
     				</div>
				</div>
			</aside>
			<div class="center_wrap">
     			<ul class="center_context">
     				<li>${hire_enroll_count}</li>
     				<li>4</li>
     				<li>1</li>
     				<li>4</li>
     			</ul>
     			<ul class="center_text_ul">
     				<li>채용공고</li>
     				<li>지원자수</li>
     				<li>채용공고열람</li>
     				<li>지원자스크랩</li>
     			</ul>
     		</div>
		</section>
		<aside class="aside_wrap_two">
     			<ul>
     				<li class="aside_menu">채용공고관리</li>
     				<li class="aside_menu_resume"><a href="/announcement.do">ㄴ공고등록</a></li>
     				<li class="aside_menu_resume"><a>ㄴ공고수정</a></li>
     				<li class="aside_menu">개인정보관리</li>
     				<li class="aside_menu_resume"><a href="/updatemember">ㄴ개인정보수정</a></li>
     				<li class="aside_menu_resume"><a href="/deletemember">ㄴ회원탈퇴</a></li>
     			</ul>
     	</aside>
     	<div class="center_wrap_two">
     			<div class="title_wrap">
     				<h3>채용공고 리스트</h3>
     			</div>
     			<div class="resume_list">
     			<table summary="공고제목 공고마감일 공고수정 공고삭제">
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
							<div class="th_title padding-left-90px">공고제목</div>
						</th>
						<th>
							<div class="th_title">공고작성일</div> 
						</th>
						<th>
							<div class="th_title">공고수정</div>
						</th>
						<th>
							<div class="th_title">공고삭제</div>
						</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${empty hire_enroll_list}">
					<tr>
						<td colspan="3">----------------내용이없습니다-------</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:forEach items="${hire_enroll_list}" var="dto" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td><div class="td_content"><a href="/recruitdetil.do?hire_no_seq=${dto.hire_no_seq }&member_no_seq=${dto.member_no_seq}">${dto.hire_company_title}</a></div></td>
						<td><div class="td_content">${dto.hire_endday}</div></td>					
						<td><div class="td_content"><a href="#">수정</a></div></td>
						<td><div class="td_content"><a href="#">삭제</a></div></td>
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
<%@ include file="/WEB-INF/include/footer.jsp"%>
</html>