<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
</style>

<header style="width:100%;">
	<div class="margin-35px-top margin-50px-bottom">
		<div class="container">
			<div class="width-100">
				<img src="/resources/image/logo_b.png" class="logo"/>
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
					<li><b>지역별</b></li>
					<li><b>직업별</b></li>
					<li>공채</li>
					<li>추천</li>
					<li>기업∙연봉</li>
					<li>뉴스∙자료</li>
					<li>인재검색</li>
					
					<li class="float-right">공고등록</li>
					<li class="float-right">로그인</li>
				</ul>
				</div>
			</div>
		</div>
	</div>
</header>