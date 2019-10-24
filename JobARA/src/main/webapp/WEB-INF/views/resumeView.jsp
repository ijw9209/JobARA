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
    height: 1200px;
    position: relative;
    top: -50px;
}

.wrap_info{
padding-top: 100px;
}
.title{
	text-align: center;
}



table{
	width: 95%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
    margin-top: 70px;

}
.content table tr th{
	padding: 22px 0;
    border-top: 1px solid #666;
    border-bottom: 1px solid #666;
    background-color: #fff;
    font-weight: bold;
    font-size: 18px;
    text-align: center;
}

.th_title, .td_content{
color: #575757;
}
.content table tr td{
    padding: 22px 0;
    border-bottom: 1px solid #e6e6e6;
    font-size: 18px;
    text-align: center;
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
/****페이징 버튼*****/
.paging{
     width: 340px;
    /* margin: 0 auto; */
    height: 100px;
    /* margin-top: 40px; */
    /* position: relative; */
    /* top: 20px; */
    /* padding-left: 173px; */
    margin-top: 70px;
    /* margin-left: 100px; */
    /* margin: 0 auto; */
    margin-left: 480px;
}
.paging_ul {
	float:left;
	display:inline;
}
.paging_ul li {
	float:left;
}
.paging_ul li a {
	float: left;
    padding: 8px;
    margin-right: 3px;
    width: 38px;
    color: #000;
    height: 36px;
    font: bold 14px tahoma;
    border: 1px solid #eee;
    text-align: center;
    text-decoration: none;
}
.paging_ul li a:hover, .paging_ul li a:focus {
	color:#fff;
	border: 1px solid #70a4e5;
    background-color: #70a4e5;
}
.img_box{

padding-left: 40px;
}
.padding-left-50px{
padding-left:50px;

}
</style>
</head>
<body>
	
	
	<div class="wrap">
	<div class="container wrap_info">
		<section class="myContent">
			<div class="title">
			<h1>이력서 페이지</h1>
			</div>
			<div class="content">
			<table summary="번호 사진 이름 이력서제목 등록일">
			<colgroup>
					<col width="120">
					<col width="300">
					<col width="400">
					<col width="160">
					<col width="100">
			</colgroup>
			<thead>
					<tr>
						<th>
							<div class="th_title">번호</div>
						</th>
						<th>
							<div class="th_title padding-left-50px">사진</div>
						</th>
						<th>
							<div class="th_title">이력서제목</div> 
						</th>
						<th>
							<div class="th_title">이름</div>
						</th>
						<th>
							<div class="th_title">등록일</div>
						</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${empty resume_list}">
					<tr>
						<td colspan="3">----------------내용이없습니다-------</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:forEach items="${resume_list}" var="dto" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td><div class="td_content img_box"><a href="#"><img style="width: 100px; height: 100px;" alt="사진" src="${dto.resume_photo}"/></a></div></td>
						<td><div class="td_content"><a href="#">${dto.resume_title}</a></div></td>					
						<td><div class="td_content">${dto.member_name }</div></td>
						<td><div class="td_content">${dto.resume_date }</div></td>
					</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</tbody>
				</table>
			<div class="paging">
			<ul class="paging_ul">
			<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
			<c:choose>
				<c:when test="${prevPage >0}">
					<li><a href="/buis/resumeview?page=${prevPage }">◀</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/buis/resumeview?page=1">◀</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${absolutePage}" end="${endPage}" var="i">
				<c:choose>
				<c:when test="${i eq page}">
					<li><a href="/buis/resumeview?page=${i}">${ i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/buis/resumeview?page=${i}">${ i }</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
			<c:choose>
				<c:when test="${nextPage < totalPage}">
					<li><a href="/buis/resumeview?page=${nextPage }">▶</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/buis/resumeview?page=${totalPage}">▶</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
			</div>
			</div>
		</section>
	</div>
	</div>	
</body>
<%@ include file="/WEB-INF/include/footer.jsp"%>
</html>