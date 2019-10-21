<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<script type="text/javascript">

	function del(){
		if(confirm("삭제 하시겠습니까?")){
			location.href='deleteResumeDetail.do?resume_no_seq=${selectOneResume.resume_no_seq}&member_no_seq=${selectOneResume.member_no_seq}'
		}
	}

</script>
</head>
<body>
	<h3>이력서</h3>


	<a>제목:${selectOneResume.userresumedetaildto.resume_title }</a>

	<fieldset>

		<legend>인적사항</legend>
		<label><img alt="이력서 사진"
			src="${selectOneResume.userresumedetaildto.resume_photo}"
			width="103px" height="132px" /></label><br> 
			<label>이름:${memberresume.member_name }</label><br> 
			<label>생일:${memberresume.member_birth }</label><br>
			<label>성별:${memberresume.member_gender}	</label> <br> 
			<label>이메일:${memberresume.member_email}</label><br> 
			<label>전화번호:${memberresume.member_tel}</label><br> 
			<label>주소:${memberresume.member_addr}</label><br>
	</fieldset>

	<fieldset>

		<legend>최종 학력</legend>
		<label>${selectOneResume.userresumedetaildto.resume_final_edu }</label>
		<br> <label>학교명 :
			${selectOneResume.userresumedetaildto.resume_schoolname }</label><br> <label>졸업년도
			:${selectOneResume.userresumedetaildto.resume_graduated_year }</label><br>
		<label>상태 :
			${selectOneResume.userresumedetaildto.resume_graduated_state } </label><br>
	</fieldset>


	<fieldset>
		<legend>경력</legend>
		<label>회사이름:${selectOneResume.careerdto.career_ent}</label><br>
		<label>부서명:${selectOneResume.careerdto.career_dept}</label>
		<br> <label>입사년월:${selectOneResume.careerdto.career_startday}~퇴사년월:${selectOneResume.careerdto.career_endday}</label><br> 
		<label>재직(Y)/퇴사(N):${selectOneResume.careerdto.career_in_office}</label><br>
		 <label>직급/직책:${selectOneResume.careerdto.career_position}</label><br> 
		 <label>직무:${selectOneResume.careerdto.career_duty}</label> <br>
		  <label>연봉:${selectOneResume.careerdto.career_salary}</label> <br> <label>
		  <a href="">추가</a></label><br>
	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label>${selectOneResume.userresumedetaildto.resume_crti_one_name }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_one_issue }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_one_day }</label><br>

	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label>${selectOneResume.userresumedetaildto.resume_crti_two_name }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_two_issue }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_two_day }</label><br>

	</fieldset>
	<fieldset>
		<legend>자격증</legend>
		<label>${selectOneResume.userresumedetaildto.resume_crti_three_name }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_three_issue }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_crti_three_day }</label><br>

	</fieldset>
	<fieldset>

		<legend>병역</legend>
		<label>
			${selectOneResume.userresumedetaildto.resume_military_chk }</label><br>
		<label>${selectOneResume.userresumedetaildto.resume_military_startday }~
			${selectOneResume.userresumedetaildto.resume_military_endday }</label><br>
		<label>${selectOneResume.userresumedetaildto.resume_military_group }</label>
		<label>
			${selectOneResume.userresumedetaildto.resume_military_lastclass }</label> <br>

	</fieldset>
	<fieldset>
		<legend>자기소개서</legend>
		<label>${selectOneResume.userresumedetaildto.resume_self_one_title }</label><br>
		<label>${selectOneResume.userresumedetaildto.resume_self_one_content }</label><br>
	</fieldset>
	<fieldset>
		<legend>자기소개서</legend>
		<label>${selectOneResume.userresumedetaildto.resume_self_two_title }</label>
		<br> <label>${selectOneResume.userresumedetaildto.resume_self_two_content }</label><br>
	</fieldset>


	<input type="button" value="수정하기"
		onclick="location.href='updateResumeres.do?resume_no_seq=${selectOneResume.userresumedetaildto.resume_no_seq }&member_no_seq=${seq }'">
	<input type="button" value="삭제하기" onclick="del()">
</body>
</html>
