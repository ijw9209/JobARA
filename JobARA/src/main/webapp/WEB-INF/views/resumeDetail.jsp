<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>



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
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = 'deleteResumeDetail.do?resume_no_seq=${selectOneResume.resume_no_seq}&member_no_seq=${selectOneResume.member_no_seq}'
		}
	}
</script>

<style type="text/css">
	
#detail{
	padding-left: 300px;
	height: 2500px;
	
	

}
#sidebanner {
	position: fixed;
	top: 50px;
	left: 50%;
	margin-left: 500px;
	width: 200px;
	height: 400px;
		padding-top: 200px;
}
#sidebanner_ul input {
	border: 3px solid gray;
	background-color: rgba(0, 0, 0, 0);
	color: black;
	font-size: 20px;
}

#sidebanner_ul li {
	padding-bottom: 20px;
}



</style>
</head>
<body>

	<div id="sidebanner">
	
		<ul style="list-style: none;"id="sidebanner_ul">
			<li><input type="button" value="수정하기"
		onclick="location.href='updateResumeres.do?resume_no_seq=${selectOneResume.userresumedetaildto.resume_no_seq }&member_no_seq=${seq }'"></li>
		<li><input type="button" value="삭제하기" onclick="del()"></li>
		
		</ul>
	
	
	
	</div>

	<div id="detail">
	<h1>이력서</h1>
	<a><b>제목</b>:${selectOneResume.userresumedetaildto.resume_title }</a>
	<fieldset>
		<legend>인적사항</legend>
		<label><img alt="이력서 사진"
			src="${selectOneResume.userresumedetaildto.resume_photo}"
			width="103px" height="132px" /></label><br> <label><b>이름</b>:${memberresume.member_name }</label><br>
		<label><b>생일</b>:${memberresume.member_birth }</label><br> <label><b>성별</b>:${memberresume.member_gender}
		</label> <br> <label><b>이메일:</b>${memberresume.member_email}</label><br> <label><b>전화번호:</b>${memberresume.member_tel}</label><br>
		<label><b>주소:</b>${memberresume.member_addr}</label><br>
	</fieldset>

	<fieldset>

		<legend><b>최종 학력</b></legend>
		<label>${selectOneResume.userresumedetaildto.resume_final_edu }</label>
		<br> <label><b>학교명 :</b>
			${selectOneResume.userresumedetaildto.resume_schoolname }</label><br> <label><b>졸업년도
			:</b>${selectOneResume.userresumedetaildto.resume_graduated_year }</label><br>
		<label><b>상태 :</b>
			${selectOneResume.userresumedetaildto.resume_graduated_state } </label><br>
	</fieldset>


	<fieldset>
		<legend>경력</legend>
		<label><b>회사이름:</b>${selectOneResume.careerdto.career_ent}</label><br> 
		<label><b>부서명:</b>${selectOneResume.careerdto.career_dept}</label><br> 
		<label><b>입사년월:</b>${selectOneResume.careerdto.career_startday}</label><br>
		<label><b>퇴사년월:</b>${selectOneResume.careerdto.career_endday}</label><br>
		<label><b>재직(Y)/퇴사(N):</b>${selectOneResume.careerdto.career_in_office}</label><br>
		<label><b>직급/직책:</b>${selectOneResume.careerdto.career_position}</label><br>
		<label><b>직무:</b>${selectOneResume.careerdto.career_duty}</label><br> 
		<label><b>연봉:</b>${selectOneResume.careerdto.career_salary}</label><br> 
	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label><b>자격증 명 :</b> ${selectOneResume.userresumedetaildto.resume_crti_one_name }</label><br> 
		<label><b>발행처/ 기관:</b> ${selectOneResume.userresumedetaildto.resume_crti_one_issue }</label><br> 
		<label><b>취득일:</b> ${selectOneResume.userresumedetaildto.resume_crti_one_day }</label><br>

	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label><b>자격증 명:</b>${selectOneResume.userresumedetaildto.resume_crti_two_name }</label><br> 
		<label><b>발행처/기관:</b> ${selectOneResume.userresumedetaildto.resume_crti_two_issue }</label><br> 
		<label><b>취득일:</b> ${selectOneResume.userresumedetaildto.resume_crti_two_day }</label><br>

	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label><b>자격증 명:</b>${selectOneResume.userresumedetaildto.resume_crti_three_name }</label><br> 
		<label><b>발행처/기관:</b> ${selectOneResume.userresumedetaildto.resume_crti_three_issue }</label><br> 
		<label><b>취득일:</b> ${selectOneResume.userresumedetaildto.resume_crti_three_day }</label><br>

	</fieldset>
	<fieldset>

		<legend>병역</legend>
		<label><b>병역 대상:</b> ${selectOneResume.userresumedetaildto.resume_military_chk }</label><br>
		<label><b>병역 기간:</b> ${selectOneResume.userresumedetaildto.resume_military_startday }~
			${selectOneResume.userresumedetaildto.resume_military_endday }</label><br>
		<label><b>군별:</b> ${selectOneResume.userresumedetaildto.resume_military_group }</label><br>
		<label><b>제대 계급:</b> ${selectOneResume.userresumedetaildto.resume_military_lastclass }</label> <br>

	</fieldset>
	<fieldset>
		<legend>자기소개서</legend>
		<label><b>제목:</b> ${selectOneResume.userresumedetaildto.resume_self_one_title }</label><br>
		<label><b>내용:</b> ${selectOneResume.userresumedetaildto.resume_self_one_content }</label><br>
	</fieldset>
	<fieldset>
		<legend>자기소개서</legend>
		<label><b>제목:</b> ${selectOneResume.userresumedetaildto.resume_self_two_title }</label><br> 
		<label><b>내용:</b> ${selectOneResume.userresumedetaildto.resume_self_two_content }</label><br>
	</fieldset>

	<fieldset>
		<legend>희망근무조건</legend>
		<label><b>고용형태:</b> ${selectOneResume.hopedto.hope_employform }</label><br> 
		<label><b>희망연봉:</b> ${selectOneResume.hopedto.hope_salary }</label><br>
		<label>희망연봉: ${selectOneResume.hopedto.hope_afterinterview }</label><br>
		<label><b>희망근무지1:</b> ${selectOneResume.hopedto.hope_addr_one }</label><br> 
		<label><b>희망근무지2:</b> ${selectOneResume.hopedto.hope_addr_two }</label><br>
		<label><b>희망근무지3:</b> ${selectOneResume.hopedto.hope_addr_three }</label><br> 
		<label><b>직무 산업 키워드1:</b> ${selectOneResume.hopedto.hope_duty_keyword_one }</label><br>
		<label><b>직무 산업 키워드2:</b> ${selectOneResume.hopedto.hope_duty_keyword_two }</label><br>
		<label><b>직무 산업 키워드3:</b> ${selectOneResume.hopedto.hope_duty_keyword_three }</label><br>
		<label><b>직무 산업 키워드4:</b> ${selectOneResume.hopedto.hope_duty_keyword_four }</label><br>
		<label><b>직무 산업 키워드5:</b> ${selectOneResume.hopedto.hope_duty_keyword_five}</label><br>




	</fieldset>


	
	
	</div>
</body>
<%@ include file="/WEB-INF/include/footer.jsp"%>
</html>
