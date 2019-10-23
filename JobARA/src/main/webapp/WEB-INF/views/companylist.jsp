<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<style>
	.company-list {
		border-top: 1px solid #ebebeb;
    	border-left: 1px solid #ebebeb;
	}
	.company-list li {
		width:33.33333%;
		border: 1px solid #ebebeb;
    	border-top: 0px;
    	border-left:0px;
    	height:100px;
	}
	.company-list img {
		max-height:99px;
	}
	
	.company-list a {
		padding-left:40px;
	}
	
	ul.tabs {
    padding: 0;
    float: left; 
    list-style: none;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-size:14px;
    margin-bottom:0px;
    }
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
  	width: 20%;
    height: 40px;
    line-height: 38px; 
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    width:100%;
    border-left: 1px solid #ebebeb;
    margin-top: 38px;
    border-top: 1px solid #ebebeb; 
}
.tab_content {
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    list-style:none;
    width:33.333%;
    float:left;
        border: 1px solid #ebebeb;
    border-top: 0px;
    border-left: 0px;
    height: 100px;
}

.tab_container .tab_content ul li a{
   padding-left:40px;
}

.tab_container .tab_content ul li img{
   max-height:99px;
}

</style>
<title>Insert title here</title>
</head>
<body>

	
	<div class="container">
		<div>
			<h1>베스트 기업목록</h1>
			<ul class="row company-list margin-35px-top">
				<c:choose>
					<c:when test="${empty list }">
					<li><h3>기업 정보가 없습니다</h3></li>
					</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
						<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		<div class="row margin-50px-top">
			<h1>베스트 기업목록</h1>
		    <ul class="tabs">
		        <li class="active" rel="tab1">제조/화학</li>
		        <li rel="tab2">서비스업</li>
		        <li rel="tab3">의료/제약/복지</li>
		        <li rel="tab4">유통/무역/운송</li>
		        <li rel="tab5">교육업</li>
		        <li rel="tab6">건설업</li>
		        <li rel="tab7">IT/웹/통신</li>
		        <li rel="tab8">미디어/디자인</li>
		        <li rel="tab9">은행/금융업</li>
		        <li rel="tab10">기관/협회</li>
		    </ul>
		    <div class="tab_container">
		    	<div id="tab1" class="tab_content">
			        <ul>
			            <c:forEach items="${cate_1_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
			        </ul>
		        </div>
		        <!-- #tab1 -->
		        <div id="tab2" class="tab_content">
					<ul>
						<c:forEach items="${cate_2_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <!-- #tab2 -->
		        <div id="tab3" class="tab_content">
					<ul>
						<c:forEach items="${cate_3_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <!-- #tab3 -->
		        <div id="tab4" class="tab_content">
					<ul>
						<c:forEach items="${cate_4_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <div id="tab5" class="tab_content">
		        	<ul>
						<c:forEach items="${cate_5_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <div id="tab6" class="tab_content">
					<ul>
						<c:forEach items="${cate_6_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <div id="tab7" class="tab_content">
					<ul>
						<c:forEach items="${cate_7_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <div id="tab8" class="tab_content">
					<ul>
						<c:forEach items="${cate_8_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		        <div id="tab9" class="tab_content">
		        	<ul>
						<c:forEach items="${cate_9_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
		        </div>
		        <div id="tab10" class="tab_content">
					<ul>
						<c:forEach items="${cate_10_list}" var="dto">
							<li><img src="${dto.company_logo_url}"/><a href="company_detail?company_no_seq=${dto.company_no_seq}">${dto.company_title}</a></li>
						</c:forEach>
					</ul>
				</div>
		    </div>
		    <!-- .tab_container -->
		</div>
		<!-- #container -->
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
	<script>
	$(function () {

	    $(".tab_content").hide();
	    $(".tab_content:first").show();

	    $("ul.tabs li").click(function () {
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
	        $(".tab_content").hide()
	        var activeTab = $(this).attr("rel");
	        $("#" + activeTab).fadeIn()
	    });
	});
	
	</script>
</body>
</html>