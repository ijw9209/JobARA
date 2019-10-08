<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<title>Insert title here</title>
<style type="text/css">
	
	p{
	font-size: 19px;
	}

</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-7 col-sm-10 col-xs-12 center-col">
				<div class="width-100 xs-no-padding">
					<div class="width-100 padding-50px-lrb">
						<div class="sec_title_wrap margin-50px-bottom" style="margin-top: 220px;">
	 					<p class="text-info">고객님의 id는 <b class="text-primary">${id }</b> 입니다</p>
	 					<button class="btn" onclick="btn();" style="background-color: #ebebeb">닫기</button>
	 				</div>
	 			</div>
	 		</div>
	 	</div>
	 </div>
	 </div>
</body>
<script type="text/javascript">

	function btn(){
		window.self.close();
	}
</script>
</html>