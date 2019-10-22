<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	border-spacing: 0 20px;
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
							<h1>개인정보 수정</h1>
					</div>
					<div>
						<form action="/update" method="post" name="fr" onsubmit="return check();">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="member_no_seq" value="${seq}"/>
						<table class="width-100 regist-table">
							<tr>
								<th>이름</th>	
								<td><input type="text" name="member_name" id="job_name" class="form-control" value="${dto.member_name}"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="member_birth" id="job_birth" class="form-control" readonly="readonly" placeholder="텍스트상자를 클릭하여 주세요." value="${dto.member_birth}"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
								<input type="text" name="member_addr" id="originaddr1" readonly="readonly" class="form-control" placeholder="주소찾기 버튼을 클릭하여주세요."/><br/>
								<input type="text" name="member_addr" id="originaddr2" readonly="readonly" class="form-control"/><br/>
								<input type="button" id="originfindaddr" class="form-control" value="주소 찾기" />
								</td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="text" name="member_addr" id="addrDetail" class="form-control" placeholder="상세주소를 입력해주세요"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="member_tel" id="job_tel" class="form-control" placeholder="전화번호 예)010-0000-0000" value="${dto.member_tel}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<input type="text" name="member_email" id="job_email" class="form-control width-48 float-left">
									<span class="float-left padding-10px-top">@</span>
									<input type="text" name="member_email_addr" id="job_eamil_addr" class="form-control width-48 float-left" placeholder="이메일주소">
								</td>
							</tr>	
						</table>
						<input type="submit" value="정보수정" class="btn btn-primary">
						</form>
					</div>
					</div>
				</div>	
			</div>
		</div>			
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
<script type="text/javascript">

window.onload = function() {
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}


function check(){
	if(fr.job_name.value == ""){
		alert("이름을 입력해주세요.");
		fr.job_name.focus();
		return false;
	}
	if(fr.job_birth.value == ""){
		alert("생년월일을 입력해주세요");
		fr.job_birth.focus();
		return false;
	}
	if(fr.originaddr1.value == ""){
		alert("주소찾기 버튼을 클릭하여주세요.");
		fr.originaddr1.focus();
		return false;
	}
	if(fr.addrDetail.value == ""){
		alert('상세주소를 입력해주세요');
		fr.addrDetail.focus();
		return false;
	}
	if(fr.job_tel.value == ""){
		alert("전화번호를 입력해주세요");
		fr.job_tel.focus();
		return false;
	}
	if(fr.job_email.value == ""){
		alert("이메일을 입력해주세요.");
		fr.job_email.focus();
		return false;
	}
} 

$(function(){
    $("#originfindaddr").click(function(){
       new daum.Postcode({
           oncomplete: function(data) {
           var fullRoadAddr = data.roadAddress;
           var extraRoadAddr = '';
           
           if(data.bname !== '' && data.apartment === 'Y'){
              extraRoadAddr += data.bname;
           }
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' +data.buildingName : data.build)
           }
           if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           if(fullRoadAddr !== ''){
              fullRoadAddr += extraRoadAddr;
           }
          document.getElementById("originaddr1").value = data.zonecode; // 우편번호
          document.getElementById("originaddr2").value = fullRoadAddr;
           }
       }).open();
    })
 });




$(function() {
	//  $("#job_birth").datepicker();

	$("#job_birth").datepicker({
		dateFormat : 'yy-mm-dd',
		changeYear : true,
		changeMonth : true,
		yearRange: '1950:2013',
	});
}); 


</script>
</html>