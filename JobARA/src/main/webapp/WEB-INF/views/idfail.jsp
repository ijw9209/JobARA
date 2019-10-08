<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 					<p class="text-info">id를 찾을수 없습니다. 이름과 이메일을 다시 확인해주세요</p>
	 					<button class="btn" onclick="btn();" style="background-color: #ebebeb">돌아가기</button>
	 				</div>
	 			</div>
	 		</div>
	 	</div>
	 </div>
	 </div>

</body>
<script type="text/javascript">
	function btn(){
		location.href="findId.do";
	}
</script>
</html>