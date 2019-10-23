<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
</head>
<body>

	<!-- 기업이름 
		채용공고 제목
		경력   	급여
		학력		근무형태
		나이/성별	직급/직책
		필수사항	근무일시
		우대사항	근무지
		---------------------
		모집부문 및 자격요건
		모집분야 	모집인원	담당업무/자격요건 및 우대사항
		---------------------
		지언자격
		학력
		성별
		연령
		---------------------
		근무조건 및 근무환경
		근무형태
		근무요일/시간
		급여
		회사주소
		---------------------
		접수기간
		이력서양식
		접수방법
		---------------------
		담당자
		담당자 이름 	담당자 전화번호
		담당자 EMAIL	회사 전화번호
		---------------------
		기업정보
		기업이름
		업종		대표자명
		기업주소
	-->
	 <div class="container">
	 	<table class="width-100 regist-table">
	 		<tr>
	 			<th><h4>${hiredto.hire_company_title }</h4></th>
	 		</tr>
	 		<tr>
	 			<th>${hiredto.hire_recruit_name }</th>
	 			<td>
	 				<input type="button" value="즉시지원" class="btn btn-primary" onclick="">
	 			</td>
	 		</tr>
			<tr>
				<th>경력</th>
				<td>${hiredto.hire_career }</td>
				<th>급여</th>
				<td>${hiredto.hire_salary }</td>
			</tr>
			<tr>
				<th>학력</th>
				<td>${hiredto.hire_edu }</td>
				<th>근무형태</th>
				<td>${hiredto.hire_position }</td>
			</tr>
			<tr>
				<th>나이/성별</th>
				<td>${hiredto.hire_age }/${hiredto.hire_gender }</td>
				<th>근무일시</th>
				<td>${hiredto.hire_workday }/${hiredto.hire_worktime }</td>
			</tr>
		</table>
	 </div>
	 <div class="container">
	 	<h3>모집부문 및 자격요건</h3>
	 	<table class="width-100 regist-table">
	 		<tr>
	 			<th>모집분야</th>
	 			<th>담당업무/자격 및 우대사항</th>
	 		</tr>
	 		<tr>
	 			<td>${hiredto.hire_depart }</td>
	 			<td>
	 				<b>담당업무</b>
	 				${hiredto.hire_task }<br>
	 				<b>자격요건</b>
	 				경력 : ${hiredto.hire_career }<br>
	 				<b>우대사항</b>
	 				${hiredto.hire_prefer_content }
	 			</td>
	 		</tr>
	 	</table>
	 </div>
	 <div class="container">
	 	<h3>지원자격</h3>
	 	<table class="width-100 regist-table">
	 	<tr>
	 		<th>학력</th>
	 		<td>${hiredto.hire_edu }</td>
	 	</tr>
	 	<tr>
	 		<th>성별</th>
	 		<td>${hiredto.hire_gender }</td>
	 	</tr>
	 	<tr>
	 		<th>연령</th>
	 		<td>${hiredto.hire_age }</td>
	 	</tr>
	 	</table>
	 	<h3>근무조건 및 근무환경</h3>
	 	<table class="width-100 regist-table">
	 	<tr>
	 		<th>근무형태</th>
	 		<td>${hiredto.hire_position }</td>
	 	</tr>
	 	<tr>
	 		<th>근무요일/시간</th>
	 		<td>${hiredto.hire_workday }/${hiredto.hire_worktime }</td>
	 	</tr>
	 	<tr>
	 		<th>급여</th>
	 		<td>${hiredto.hire_salary }</td>
	 	</tr>
	 	<tr>
	 		<th>회사주소</th>
	 		<td>${hiredto.hire_addr }</td>
	 	</tr>
	 	</table>
	 	<h3>접수기간 및 방법</h3>
	 	<table class="width-100 regist-table">
	 		<tr>
	 			<th>접수기간</th>
	 			<td>${hiredto.hire_startday } ~ ${hiredto.hire_endday }</td>
	 			<td>
	 				<input type="button" value="즉시지원" class="btn btn-primary" onclick="">
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>이력서양식</th>
	 			<td>${hiredto.hire_mode }</td>
	 		</tr>
	 	</table>
	 	<h3>담당자</h3>
	 	<table class="width-100 regist-table">
	 		<tr>
	 			<th>담당자 이름</th>
	 			<td>${hiredto.hire_manager_name }</td>
	 			<th>담당자 전화번호</th>
	 			<td>${hiredto.hire_manager_tel }</td>
	 		</tr>
	 		<tr>
	 			<th>담당자 Email</th>
	 			<td>${hiredto.hire_manager_email }</td>
	 			<th>회사 전화번호</th>
	 			<td>${hiredto.hire_ent_tel }</td>
	 		</tr>
	 	</table>
	 	<h3>기업 정보</h3>
	 	<table class="width-100 regist-table">
			<tr>
				<td><h3>${comdto.company_title }</h3></td>
			</tr>
			<tr>
				<th>업좀</th>
				<td>  ${comdto.company_cate }</td>
				<th>대표자명</th>
				<td>  ${comdto.company_name }</td>
			</tr>
			<tr>
				<th>기업주소</th>
				<td>  ${hiredto.hire_addr }</td>
			</tr>	 		
	 	</table>
	 </div>

</body>
</html>