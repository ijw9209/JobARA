<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("DB_MUgASGdvy82XeU3Xz","http://localhost:8787/naverlogin.do");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback(){
		var member_id = "NaverSns" + naver_id_login.getProfileData('id');
		var member_pw = "NaverSns" + naver_id_login.getProfileData('id');
		var member_email = naver_id_login.getProfileData('email');
		
		$.ajax({
			type:"POST",
			url:"snslogin.do?member_id="+member_id+"&member_pw="+member_pw+"&member_email="+member_email,
			dataType : "Json",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data){
				alert(data.id);
				console.log(data);
				if(data.id != null && data.id != ""){
					$("#id").val(data.id);
					$("#pw").val(data.pw);
					$("#email").val(data.email);
					window.opener.name = "parentPage"; // 부모창의 이름 설정
					document.snsinfo.target = "parentPage"; // 타켓을 부모창으로 설정
					document.snsinfo.action = "/snsplusinfo.do";
					document.snsinfo.submit();
					self.close();
				}else{
				$("#snsId",opener.document).val(member_id);
				$("#snsPw",opener.document).val(member_pw);
				$("#snsLogin",opener.document).submit();
				window.self.close();
				}
			}
		});
	}

</script>

</head>
<body>

	<form action="" name="snsinfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="pw" name="pw">
		<input type="hidden" id="email" name="email">
	</form>

</body>
</html>