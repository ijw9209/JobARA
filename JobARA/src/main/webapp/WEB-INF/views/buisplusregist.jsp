<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.regist-table {
		border-collapse: separate;
    	border-spacing: 0 25px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-7 col-sm-10 col-xs-12 center-col">
				<div class="width-100 xs-no-padding">
					<div class="width-100 padding-50px-lrb">
						<div class="sec_title_wrap margin-50px-bottom">
							<h1>기업 추가정보 입력</h1>
						</div>
						<div>
							<form action="buis_plusinfo" method="post" name="fr" onsubmit="return check();">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="member_no_seq" value="${member_no_seq}"/>
							<table class="width-100 regist-table">
								 <tr>
									<th>회사명</th>
									<td><input type="text" name="company_title" id="com_title" class="form-control" placeholder="회사이름을 입력해주세요">
									<span id="com_title_span"></span></td>
								 </tr>
								 <tr>
									<th>대표자</th>
									<td><input type="text" name="company_name" id="com_name" class="form-control"  placeholder="대표자 성명을 입력해주세요">
									<span id="com_name_span"></span></td>
								 </tr>
								 <tr>
									<th>업종/카테고리</th>
									<td><input type="text" name="company_cate" id="com_cate"  class="form-control">
									<span id="com_cate_span"></span></td>
								</tr>
								<tr>
									<th>회사 자본금</th>
									<td>
										<input type="text" name="company_capital" id="com_capital" class="form-control" placeholder="회사 자본금을 입력해주세요">	
										<span id="com_capital_span"></span>
									</td>
								</tr>
								<tr>
									<th>회사 매출액</th>
									<td><input type="text" name="company_take" id="com_take" class="form-control"  placeholder="회사 매출액을 입력해주세요">
										<span id="com_take_span"></span></td>
								</tr>
								<tr>
									<th>회사 설립일</th>
									<td><input type="text" name="company_regdate" id="com_regdate" class="form-control" readonly="readonly" placeholder="텍스트를 클릭하여 주세요.">
										<span id="com_regdate_span"></span></td>
								</tr>
								<tr>
									<th>총 사원수</th>
									<td><input type="text" name="company_all_people" id="com_people" class="form-control" placeholder="총 사원수를 입력하여 주세요">
										<span id="com_people_span"></span></td>
								</tr>
								<tr>
									<th>평균 연봉</th>	
									<td><input type="text" name="company_salary" id="com_salary" class="form-control" placeholder="평균연봉을 입력해주세요 단위:만원">
										<span id="com_salary_span"></span>
									</td>
								</tr>
								<tr>
									<th>회사 url</th>	
									<td><input type="text" name="company_url" id="com_url" class="form-control" placeholder="회사 홈페이지 주소를 입력하여 주세요">
										<span id="com_url_span"></span>
									</td>
								</tr>
							</table>
							<input type="submit" value="정보입력" class="btn btn-primary">
							</form>
						</div>		
					</div>
				</div>
			</div>
		</div>
	</div>					
</body>
<%@ include file="/WEB-INF/include/footer.jsp"%>
<script type="text/javascript">
	
	function check(){
		if(fr.com_title.value == ""){
			$("#com_title_span").css('color','red');
			$("#com_title_span").html('회사이름을 입력해주세요');
			fr.com_title.focus();
			return false;
		}
		if(fr.com_name.value == ""){
			$("#com_name_span").css('color','red');
			$("#com_name_span").html('대표자 이름을 입력해주세요');
			fr.com_name.focus();
			return false;
		}
		if(fr.com_cate.value == ""){
			$("#com_cate_span").css('color','red');
			$("#com_cate_span").html('업종을 선택해주세요');
			fr.com_cate.focus();
			return false;
		}
		if(fr.com_capital.value == ""){
			$("#com_capital_span").css('color','red');
			$("#com_capital_span").html('회사 자본금을 입력해주세요');
			fr.com_capital.focus();
			return false;
		}
		if(fr.com_take.value == ""){
			$("#com_take_span").css('color','red');
			$("#com_take_span").html('회사 매출액을 입력해주세요');
			fr.com_take.focus();
			return false;
		}
		
		if(fr.com_regdate.value == ""){
			$("#com_regdate_span").css('color','red');
			$("#com_regdate_span").html('회사 설립일을 입력해주세요');
			fr.com_regdate.focus();
			return false;
		}
		if(fr.com_people.value ==""){
			$("#com_people_span").css('color','red');
			$("#com_people_span").html('총 사원수를 입력해주세요');
			fr.com_people.focus();
			return false;
		}
		if(fr.com_salary.value == ""){
			$("#com_salary_span").css('color','red');
			$("#com_salary_span").html('회사 평균 연봉을 입력해주세요');
			fr.com_salary.focus();
			return false;
		}
		
		if(fr.com_url.value == ""){
			$("#com_url_span").css('color','red');
			$("#com_url_span").html('회사홈페이지 주소를 입력해주세요');
			fr.com_url.focus();
			return false;
		}
		
		
	}
	$(function() {
		//  $("#job_birth").datepicker();

		$("#com_regdate").datepicker({
			dateFormat : 'yy-mm-dd',
			changeYear : true,
			changeMonth : true,
			yearRange: '1950:2019',
		});
	}); 


</script>
</html>