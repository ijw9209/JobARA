<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<style>
	.find-frm {
		border-top: 1px solid #ccc;
    	margin-top: 5px;
	}
</style>
<title>아이디 찾기</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="width-100 padding-50px-all xs-no-padding">
				<div class="width-100">
					<div class="sec_title_wrap margin-50px-bottom">
						<h1>아이디 찾기</h1>
					</div>
					<div>
						※ 회원가입시 등록된 이름과 이메일을 입력해주세요.
						<form action="idsearch" method="post" class="padding-25px-top find-frm" name="fr" onsubmit="return check();">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<ul>
								<li class="margin-20px-bottom"><input type="text" name="member_name" placeholder="이름" id="job_name" class="form-control"/></li>
								<li class="margin-25px-bottom"><input type="text" name="member_email" placeholder="이메일" id="job_email" class="form-control"/></li>
								<li><button type="submit" class="btn btn-primary width-100" onchange="idsearch()">아이디 찾기</button></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var getName= RegExp(/^[가-힣]+$/);

	function check(){
		if(fr.job_name.value == ""){
			alert("아이디를 입력해주세요");
			fr.job_id.focus();
			return false;
		}
		if(fr.job_email.value == ""){
			alert("이메일을 입력해주세요");
			fr.job_email.focus();
			return false;
		}	
	}

	/* function idsearch(){
		var member_name = $("#job_name").val();
		var member_email = $("#job_email").val();
		$.ajax({
			type:"POST",
			url:"idsearch?member_name=" + member_name +"&member_email="+member_email,
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(data){
				alert(data.id);
				alert('통신성공');
			},
			error :function(data ,status,error){
				alert('통신실패');
			}
		});
	} */
</script>
</html>