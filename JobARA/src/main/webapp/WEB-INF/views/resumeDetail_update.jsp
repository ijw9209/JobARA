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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
	function popUpImg() {
		window.open("uploadform.do", "",
				"left=600px,top=50px,width=600px,height=600px");
	}

	$(function() {
		$(".calendar").datepicker({
			dateFormat : 'yymmdd'
		});
	});
	$(function() {
		$('#military').change(function() {
			var state = jQuery('#military option:selected').val();
			if (state == 'Y') {
				jQuery('.military_detail').show();
			} else {
				jQuery('.military_detail').hide();
			}
		});
	});
</script>
</head>
<body>
	<h3>이력서</h3>
	<form action="updateDetailres.do?resume_no_seq=${selectOneResume.userresumedetaildto.resume_no_seq }&member_no_seq=${seq}" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


		<a><input type="text" name="resume_title"
			value="${selectOneResume.userresumedetaildto.resume_title }"></a>

		<fieldset>

			<legend>인적사항</legend>
			<input type="hidden" id="resume_photo" name="resume_photo" value="${selectOneResume.userresumedetaildto.resume_photo}">
			<label><img id="kfile" alt="이력서 사진" src="${selectOneResume.userresumedetaildto.resume_photo}" onclick="popUpImg();"
				class="imageUpload" width="103px" height="132px" /></label><br> <label><input
				type="text" name="member_name" value="${memberresume.member_name }" ></label><br> <label><input
				type="text" name="member_birth" value="${memberresume.member_birth }"> </label><br>
			<label><select name="member_gender" >
					<option value="${memberresume.member_gender}" style="font-style: oblique;">${memberresume.member_gender}</option>
					<option value="여자">여자</option>
					<option value="남자">남자</option>
			</select></label> <br>
			<label><input type="text" name="member_email"
				value="${memberresume.member_email}" ></label><br> <label><input
				type="text" name="member_tel" value="${memberresume.member_tel}"></label><br> <label><input
				type="text" name="member_addr" value="${memberresume.member_addr}"></label><br>
		</fieldset>

		<fieldset>

			<legend>최종 학력</legend>
			<label><select name="resume_final_edu">
					<option value="${selectOneResume.userresumedetaildto.resume_final_edu }">
					${selectOneResume.userresumedetaildto.resume_final_edu }
					</option>
					<option value="elementary">초등학교 졸업</option>
					<option value="middle">중학교 졸업</option>
					<option value="high">고등학교 졸업</option>
					<option value="university">대학/대학원 이상 졸업</option>
			</select></label> <br>
			<label><input type="text" name="resume_schoolname"
				value="${selectOneResume.userresumedetaildto.resume_final_edu }"></label><br>
			<label><input type="text" class="calendar"
				name="resume_graduated_year"
				value="${selectOneResume.userresumedetaildto.resume_graduated_year }"></label><br>
			<label><select name="resume_graduated_state">
					<option
						value="${selectOneResume.userresumedetaildto.resume_graduated_state }">${selectOneResume.userresumedetaildto.resume_graduated_state }</option>
					<option value="졸업">졸업</option>
					<option value="재학중">재학중</option>
					<option value="휴학중">휴학중</option>
					<option value="수료">수료</option>
					<option value="중퇴">중퇴</option>
					<option value="자퇴">자퇴</option>
					<option value="졸업예정">졸업예정</option>

			</select></label><br>
		</fieldset>


		<fieldset>
			<legend>경력</legend>
			<label><input type="text" name="career_ent"
				value="${selectOneResume.careerdto.career_ent}"></label><br> <label><input
				type="text" name="career_dept" value="${selectOneResume.careerdto.career_dept}"></label> <br>
			<label><input type="text" name="career_startday" value="${selectOneResume.careerdto.career_startday}">~<input
				type="text" name="career_endday" value="${selectOneResume.careerdto.career_endday}"></label><br> <label><select
				name="career_in_office">
				<option value="${selectOneResume.careerdto.career_in_office}">${selectOneResume.careerdto.career_in_office}</option>
					<option value="Y">재직중</option>
					<option value="N">퇴사</option>

			</select></label><br> <label><input type="text" name="career_position"
				value="${selectOneResume.careerdto.career_position}" ></label><br> <label><input
				type="text" name="career_duty" value="${selectOneResume.careerdto.career_duty}"></label> <br>
			<label><input type="text" name="career_salary" value="${selectOneResume.careerdto.career_salary}"></label> <br>
			<label><a href="">추가</a></label><br>
		</fieldset>
		<fieldset>
			<legend>자격증</legend>
			<label><input type="text" name="resume_crti_one_name"
				value="${selectOneResume.userresumedetaildto.resume_crti_one_name }"></label> <br>
			<label><input type="text" name="resume_crti_one_issue"
				value="${selectOneResume.userresumedetaildto.resume_crti_one_issue }"></label> <br>
			<label><input type="text" class="calendar"
				name="resume_crti_one_day" value="${selectOneResume.userresumedetaildto.resume_crti_one_day }"></label><br>

		</fieldset>
		<fieldset>
			<legend>자격증</legend>
			<label><input type="text" name="resume_crti_two_name"
				value="${selectOneResume.userresumedetaildto.resume_crti_two_name }"></label> <br>
			<label><input type="text" name="resume_crti_two_issue"
				value="${selectOneResume.userresumedetaildto.resume_crti_two_issue }"></label> <br>
			<label><input type="text" class="calendar"
				name="resume_crti_two_day" value="${selectOneResume.userresumedetaildto.resume_crti_two_day }"></label><br>

		</fieldset>
			<fieldset>
			<legend>자격증</legend>
			<label><input type="text" name="resume_crti_three_name"
				value="${selectOneResume.userresumedetaildto.resume_crti_three_name }"></label> <br>
			<label><input type="text" name="resume_crti_three_issue"
				value="${selectOneResume.userresumedetaildto.resume_crti_three_issue }"></label> <br>
			<label><input type="text" class="calendar"
				name="resume_crti_three_day" value="${selectOneResume.userresumedetaildto.resume_crti_three_day }"></label><br>

		</fieldset>
		<fieldset>

			<legend>병역</legend>
			<label><select id="military" name="resume_military_chk">
					<option
						value="${selectOneResume.userresumedetaildto.resume_military_chk }">${selectOneResume.userresumedetaildto.resume_military_chk }</option>
					<option id="military_check" value="Y">군필/면제</option>
					<option value="N">미필/복무중</option>

			</select></label><br> <label class="military_detail" style="display: none;"><input
				type="text" class="calendar" name="resume_military_startday"
				value="${selectOneResume.userresumedetaildto.resume_military_startday }">~
				<input type="text" class="calendar" name="resume_military_endday"
				value="${selectOneResume.userresumedetaildto.resume_military_endday }"></label><br>
			<label><select name="resume_military_group">
					<option
						value="${selectOneResume.userresumedetaildto.resume_military_group }">${selectOneResume.userresumedetaildto.resume_military_group }</option>
					<option value="육군">육군</option>
					<option value="해군">해군</option>
					<option value="공군">공군</option>
					<option value="해병">해병</option>
					<option value="의경">의경</option>
					<option value="전경">전경</option>
					<option value="기타">기타</option>
					<option value="공익">공익</option>
			</select> <select name="resume_military_lastclass">
					<option	value="	${selectOneResume.userresumedetaildto.resume_military_lastclass }">${selectOneResume.userresumedetaildto.resume_military_lastclass }</option>
					<option value="이병">이병</option>
					<option value="일병">일병</option>
					<option value="상병">상병</option>
					<option value="병장">병장</option>
					<option value="하사">하사</option>
					<option value="중사">중사</option>
					<option value="상사">상사</option>
					<option value="원사">원사</option>
					<option value="준위">준위</option>
					<option value="소위">소위</option>
					<option value="중위">중위</option>
					<option value="대위">대위</option>
					<option value="소령">소령</option>
					<option value="중령">중령</option>
					<option value="대령">대령</option>
					<option value="준장">준장</option>
					<option value="소장">소장</option>
					<option value="중장">중장</option>
					<option value="대장">대장</option>
					<option value="기타">기타</option>
			</select></label><br>

		</fieldset>
		<fieldset>
			<legend>자기소개서</legend>
			<label><input type="text" name="resume_self_one_title"
				value="${selectOneResume.userresumedetaildto.resume_self_one_title }"></label><br> <label><textarea
					name="resume_self_one_content" rows="20" cols="100"
					>${selectOneResume.userresumedetaildto.resume_self_one_content }</textarea></label><br>
		</fieldset>
		<fieldset>
			<legend>자기소개서</legend>
			<label><input type="text" name="resume_self_two_title"
				value="${selectOneResume.userresumedetaildto.resume_self_two_title }"></label> <br>
			<label><textarea name="resume_self_two_content" rows="20"
					cols="100">${selectOneResume.userresumedetaildto.resume_self_two_content }</textarea></label><br>
		</fieldset>

		<input type="submit" value="수정완료">
	</form>
</body>
</html>
