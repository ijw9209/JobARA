<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
<style type="text/css">
	
	.top_bhr_container {
    position: relative;
    width: 100%;
    position: relative;
    top: -50px;
    }
	
	.top_bhr{
    position: relative;
    height: 168px;
    background-color: #c2c8cc;
	}
	.top_bhr_wrap{
	width: 100%;
    background-color: #fff;
    z-index: 20;
    height: 140px;
	}
	.company_logo_box{
	position: relative;
    width: 104px;
    height: 104px;
    z-index: 5;
    bottom: 50px;
    }
    .company_logo_box img{
    box-sizing: border-box;
    display: block;
    width: 100%;
    height: 100%;
    border-radius: 4px;
    border: 2px solid #e5e6e9;
    overflow: hidden;
    background-color: #fff;
	}
	
	.company_title h1{
	color: #333;
    text-decoration: none;
    margin: 0;
    padding: 0;
    font-size: 30px;
	}
	.info_wrap{
		width: 100%;
		background-color: #f3f3f4;
		height: 600px;
	}
	.container h2{
	padding-top: 40px;
    font-size: 27px;
    font-weight: 800;
	}
	.basic_info{
	background-color: #fff;
    border-radius: 3px;
    box-sizing: border-box;
    padding: 32px;
    margin-top: 40px;
	}
	
	.basic_info_item{
		width:100%;
	}
	.basic_info_ul{
		width: 100%;
		height: 100px;
	}
	.basic_info_ul li{
	float: left;
    width: 25%;
    box-sizing: border-box;
    }
    .basic_info_indestry{
    	width:80%;
    	float:left;
    	padding-left:15px;
    	font-size:17px;
    }
</style>
</head>
<body>
	<div class="top_bhr_container">
		<div class="top_bhr"></div>
		<div class="top_bhr_wrap">
			<div class="container">
			<div class="company_logo_box">
				<img src="${dto.company_logo_url}"/><a class="company_logo_a"></a>
			</div>
			<div class="company_title">
				<h1>${dto.company_title }</h1>
			</div>
			</div>
		</div>
	</div>
	<div class="info_wrap">
		<div class="container">
		<h2>기업정보</h2>
		<div class="basic_info">
			<ul class="basic_info_ul">
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_indestry.png" style="width:20%;float:left;">
					<div class="basic_info_indestry">
					<span class="info_item_subject"><strong>${dto.company_cate}</strong></span><br/>
					<span style="width: 100%; box-sizing: border-box; font-size: 13px; color: #a4a6ad;">산업</span>
					</div>
				</div>
				
				</li>
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_building.png">
				</div>
				</li>
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_employees.png">
				</div>
				</li>
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_establish.png">
				</div>
				</li>
			</ul>
		</div>
		</div>
	</div>

</body>
</html>