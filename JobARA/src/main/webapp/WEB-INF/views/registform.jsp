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
							<h1>회원가입</h1>
						</div>
						<div>
							<form action="regist" method="post" name="fr" onsubmit="return check();">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<table class="width-100 regist-table">
								<tr>
									<th>아이디</th>
									<td><input type="text" name="member_id" id="job_id" onchange="idchk()" class="form-control">
									<span id="id_span"></span></td>
								</tr>					
								<tr>
									<th>비밀번호</th>
									<td>
										<input type="text" name="member_pw" id="job_pw" onchange="pwchk()" class="form-control">
										<span id="pw_span"></span>
									</td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td><input type="text" id="chk_pw" onchange="repwchk()" class="form-control">
										<span id="repw_span"></span></td>
								</tr> 
								<tr>
									<th>이름</th>	
									<td><input type="text" name="member_name" id="job_name" class="form-control"></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="text" name="member_birth" id="job_birth" class="form-control" readonly="readonly"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
									<input type="button" id="originfindaddr" class="form-control" value="주소 찾기" /><br/>
									<input type="text" name="member_addr" id="originaddr1" readonly="readonly" class="form-control"/>&nbsp;
									<input type="text" name="member_addr" id="originaddr2" readonly="readonly" class="form-control"/>
									</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input type="text" name="member_addr" id="addrDetail" class="form-control"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="member_tel" id="job_tel" class="form-control"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text" name="member_email" id="job_email" class="form-control width-48 float-left">
										<span class="float-left padding-10px-top">@</span>
										<input type="text" name="member_email_addr" id="job_eamil_addr" class="form-control width-48 float-left" placeholder="이메일주소">
										<!-- <select onchange="emailAddrChange(this.value)">
											<option value="etc">직접입력</option>
											<option>naver.com</option>
											<option>daum.net</option>
											<option>nate.com</option>
											<option>hotmail.com</option>
											<option>yahoo.com</option>
											<option>empas.com</option>
											<option>korea.com</option>
											<option>dreamwiz.com</option>
											<option>gmail.com</option>
										</select> -->
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<input type="radio" name="member_gender" value="남성">남성
										<input type="radio" name="member_gender" id="job_gender" value="여성">여성
									</td>
								</tr>	
							</table>
							<input type="submit" value="회원가입" class="btn">
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


//var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
var getName= RegExp(/^[가-힣]+$/);
var idConfirm = false;
var pwConfirm = false;
var pwConfirm2 = false;
//var emailConfrim = false;


	function check(){
		
		if(fr.job_id.value == ""){
			$("#id_span").css('color','red');
			$("#id_span").html('아이디를 입력해주세요');
			fr.job_id.focus();
			return false;
		}
		if(!idConfirm) {
			fr.job_id.focus();
			return false;
		}
		if(!pwConfirm){
			fr.job_pw.focus();
			return false;
		}
		if(!pwConfirm2){
			fr.chk_pw.focus();
			return false;
		}
		
		if(fr.job_pw.value == ""){
			alert("비밀번호를 입력해주세요.");
			fr.job_pw.focus();
			return false;
		}
		
		if(fr.chk_pw.value == ""){
			alert("비밀번호확인을 입력해주세요.")
			fr.chk_pw.focus();
			return false;
		}
		
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
		if(fr.job_addr.value == ""){
			alert("주소를 입력해주세요");
			fr.job_addr.focus();
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
		

		if($("#input:radio[name=member_gender]").is('checked') == false){
			var gender = $(':input[name=member_gender]:radio:checked').val();

			if(gender){
				alert(gender + "를 선택했습니다");
				//$("#snsLogin").submit();
				return true;
			}else{
			alert("성별을 체크해 주세요!");
			return false;
			}
		} 
		
	}
	function idchk(){
		var id = $("#job_id").val();
		idConfirm = false;
		
		//아이디 유효성검사 
		if(!getCheck.test($("#job_id").val())){
			$("#id_span").css('color','red');
			$("#id_span").html('대문자와 소문자 + 숫자로 입력가능합니다.(4~12자리)');
			$("#job_id").val(""); 
			$("#job_id").focus();
			return false; 
		}
		
		$.ajax({
			type:"POST",
			url:"idchk?id="+id,
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);            
				},
				success : function(data){				
					if(data == 1){
						$("#id_span").css('color', 'red');
						$("#id_span").html("중복된 id 입니다");
						$("#job_id").focus();
						idConfirm = false;
						return false;
					}else{
						$("#id_span").css('color', 'red');
						$("#id_span").html("사용가능한 id 입니다");
						$("#job_pw").focus();
						idConfirm = true;
						return false;
					}
					
				},
				error: function(data, status, error){
					alert('통신실패');
				}	
		});
	}
	function pwchk(){
		//아이디 비밀번호 같음 확인 
		if($("#job_id").val() == $("#job_pw").val()){ 
		$("#pw_span").css('color','red');
		$("#pw_span").html('아이디와 비밀번호가 같습니다.');
		$("#job_pw").val("");
		$("#job_pw").focus();
		return false;
		}
		//비밀번호 유효성검사
		if(!getCheck.test($("#job_pw").val())){
			$("#pw_span").css('color','red');
			$("#pw_span").html('대문자와 소문자 + 숫자로 입력가능합니다.(4~12자리)');
			$("#job_pw").val("");
			$("#job_pw").focus();
			return false;
		}
		$("#pw_span").css('color','red');
		$("#pw_span").html('사용가능한 비밀번호입니다');
		pwConfirm = true;
	}	
	function repwchk(){
		if (fr.job_pw.value != fr.chk_pw.value) {
			$("#repw_span").css('color','red');
			$("#repw_span").html('비밀번호가 다릅니다.');
			fr.chk_pw.value = "";
			fr.chk_pw.focus();
			return false;
		}else{
			$("#repw_span").css('color','red');
			$("#repw_span").html('비밀번호 확인 성공.');
			pwConfirm2 = true;
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