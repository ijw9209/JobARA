<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<link rel="stylesheet"  href="/resources/css/login.css" type="text/css">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<div class="container">
	
		<div class="row">
			<div class="col-md-7 col-sm-10 col-xs-12 center-col">
				<div class="width-100 padding-50px-lrb xs-no-padding">
					<div class="width-100">
						<div class="sec_title_wrap margin-50px-bottom">
							<h1>로그인</h1>
						</div>
						<div class="login-menu">
							<ul>
								<li class="menu active" onclick="changeMenu('client')" id="client">일반회원</li>
								<li class="menu" onclick="changeMenu('company')" id="company">기업회원</li>
							</ul>
						</div>
						<div class="login-content">
							<form action="login" method="post" class="margin-25px-top" name="fr" onsubmit="return check();">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<ul>
									<li class="margin-20px-bottom"><input type="text" name="id" placeholder="아이디" class="form-control"/></li>
									<li class="margin-20px-bottom"><input type="password" name="password" placeholder="패스워드" class="form-control"/></li>
								</ul>
								<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							    <font color="red">
							        <p>아이디나 패스워드를 다시확인해주세요 <br/></p>
							       <%--  <p> ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p> --%>
							        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
							        </font>
							   	</c:if>
								<button type="submit" class="btn btn-primary">로그인</button>
								<button type="button" class="btn user_regist_btn" onclick="location.href='registform'">회원가입</button>
								<button type="button" class="btn buis_regist_btn" onclick="location.href='buisregistform'">기업회원 회원가입</button>
							</form>
							<div class="margin-15px-top"  style="float:left;">
								<input type="checkbox" id="id-remember" name="id-remember">
								<label for="id-remember">아이디 저장</label>
							</div>
							<div class="margin-15px-top" style="float:right;">
								<a href="#" style="padding-right: 7px;" onclick="findId()">아이디 찾기</a>
								<a href="#" style="border-left: 1px solid;padding-left: 10px;" onclick="findPw()">비밀번호 찾기</a>
							</div>
						</div>
						<div class="row sns-login margin-15px-top">	
							<div class="col-xs-6" style="padding-left: 34px;padding-right: 44px;">
								<a id="kakao-login-btn" class="center-block" href="javascript:kakaoLogin();">
									<img src="/resources/image/kakaologin_btn.jpg"/>
								</a>
						    </div>
							<div id="naver_id_login" class="col-xs-6"></div>
						</div>
						<div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- sns로그인폼 -->
	<form id="snsLogin" action="login" method="post">
		<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="snsId" name="id" />
		<input type="hidden" id="snsPw" name="password" />	
	</form>
	<!-- 추가정보입력폼 -->
	<form action="" name="snsinfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="pw" name="pw">
		<input type="hidden" id="email" name="email">
	</form>
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script type="text/javascript" src="/resources/js/login.js"></script>
<script>
window.onload = function() {
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
	$(".buis_regist_btn").hide();
}

Kakao.init('10ebbec45f0bab4b9e878300976afda2');
// 카카오 로그인 버튼을 생성합니다.
function kakaoLogin() {
	Kakao.Auth.loginForm({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					var member_id = "KakaoSns" + res.id;
					var member_pw = "KakaoSns" + res.id;
					var member_email = res.kaccount_email;
					$.ajax({
						type : "post",
						url : "snslogin.do?member_id=" + member_id
								+ "&member_pw=" + member_pw + "&member_email="
								+ member_email,
						dataType : "Json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							if (data.id != null && data.id != "") {
								$("#id").val(data.id);
								$("#pw").val(data.pw);
								$("#email").val(data.email);
								document.snsinfo.action = "/snsplusinfo.do";
								document.snsinfo.submit();
								// self.close();
							} else {
								$("#snsId").val(member_id);
								$("#snsPw").val(member_pw);
								$("#snsLogin").submit();
								window.self.close();
							}
						}
					});
				}
			});
		},
		fail : function(error) {
			alert(JSON.stringify(error));
		}

	});
}
// callback-url
var naver_id_login = new naver_id_login("DB_MUgASGdvy82XeU3Xz",
		"http://localhost:8787/naverlogin.do");
var state = naver_id_login.getUniqState();
naver_id_login.setPopup();
naver_id_login.setButton("green", 3, 49);
// service-url
naver_id_login.setDomain("http://localhost:8787/naverlogin.do");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();
/* 설정정보를 초기화하고 연동을 준비 */



	function findId() {
		window.open("findId.do", "find_id", "width=500,height=500");
	}
	
	function findPw() {
		window.open("findPw.do", "find_pw", "width=550,height=500");
	}
</script>
</html>