<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header_Buis.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">

	.wrap{
		   margin-left: 500px;
	}
	.duty {	
		
	}

</style>
<title>Insert title here</title>

<script type="text/javascript">
	
	function dutypop() {
		
		const url = 'dutypop.do';
		const name = 'duty';
		var option = 'width = 500 , height = 300, top = 100, left = 200, location = no'
		window.open(url, name, option);
		
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
	

	
	
</script>

</head>
<body>
	<div class="container wrap">
	<form action="announcementres.do" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<div class="width-100 padding-50px-lrb">
				<h2>공고 제목</h2>
				<label>
				<input type="text" name="hire_recruit_name" class="form-control" style="width: 700px">
				</label>
			</div>
			<div class="duty">		
				<b>직종/직무</b>
				<label>
					<input type="text" id="duty" name="hire_sector" placeholder="직종을 입력해 주세요." class="form-control">
					<input type="button" value="전체 카테고리" onclick="dutypop(); " class="form-control">
				</label>
			</div>	
			<div>
				<b>근무형태</b>
				<label>
					<input type="checkbox" value="정규직" name="hire_position"> 정규직
					<input type="checkbox" value="계약직" name="hire_position"> 계약직
					<input type="checkbox" value="인턴" name="hire_position"> 인턴
					<input type="checkbox" value="아르바이트" name="hire_position"> 아르바이트
				</label>
			</div>
			<div>
				<b>근무부서</b>
				<label>
					<input type="text" name="hire_depart" class="form-control">
				</label>
			</div>
			<div>
				<b>담당업무</b>
				<label>
					<input type="text" name="hire_task" class="form-control">
				</label>
			</div>
			<div>
				<b>경력사항</b>
				<label>
				 	<input type="radio" value="신입" name="hire_career">
				 	<span>신입</span>
				</label>
				<label>
					<input type="radio" value="경력" name="hire_career">
					<span>경력</span>
				</label>
				<label>
					<input type="radio" value="무관" name="hire_career">
					<span>경력 무관</span>
				</label>
			</div>
			<div>
			<h3>자격요건</h3>
				<label>
					<input type="radio" value="초졸" name="hire_edu">
					<span>초졸</span>
				</label>
				<label>
					<input type="radio" value="중졸" name="hire_edu">
					<span>중졸</span>
				</label>
				<label>
					<input type="radio" value="고졸" name="hire_edu">
					<span>고졸</span>
				</label>
				<label>
					<input type="radio" value="2·3년제" name="hire_edu">
					<span>2·3년제</span>
				</label>
				<label>
					<input type="radio" value="대졸" name="hire_edu">
					<span>대졸</span>
				</label>
				<label>
					<input type="radio" value="졸업예정" name="hire_edu">
					<span>졸업예정자 가능</span>
				</label></br>
				<label>
					<span>기타 학력사항</span>
					<input type="text" name="hire_edu" class="form-control">
				</label>
			</div>
			<div>
				<b>성별</b>
				<label>
					<input type="radio" value="무관" name="hire_gender">
					<span>성별무관</span>
				</label>
				<label>
					<input type="radio" value="남자" name="hire_gender">
					<span>남자</span>
				</label>
				<label>
					<input type="radio" value="여자" name="hire_gender">
					<span>여자</span>
				</label>
			</div>
			<div>
				<b>연령</b>
				<label>
					<select name="hire_age">
						<option value="연령무관" selected="selected">전체</option>
						<option value="20~30세">20~30</option>
						<option value="20~40세">20~40</option>
						<option value="20~50세">20~50</option>
						<option value="20~60세">20~60</option>
					</select>
				</label>
			</div>
			<div>
				<h3>근무조건</h3>
				<label>
					<b>급여</b>
						<input type="text" placeholder="급여을 입력하세요" name="hire_salary" class="form-control">
				</label>
				<label>
						<input type="radio" value="회사내규에 따라 다름" name="hire_salary">회사내규에 따라 다름
				</label>
				<label>
					<b>기타급여/수당</b>
					<input type="text" name="hire_salary" class="form-control">
				</label>
				<div>
				<label>
					<b>근무요일</b>
					<select name="hire_workday">
						<option value="근무요일 협의" selected="selected">근무요일 협의</option>
						<option value="주5일(월~금)">주5일(월~금)</option>
						<option value="주6일(월~토)">주6일(월~토)</option>
					</select>
				</label>
				</div>
				<div>
					<b>근무시간</b>
					<select name="hire_worktime">
						<option value="근무시간 협의" selected="selected">근무시간 협의</option>
						<option value="오전9시~오후6시">오전9시~오후6시</option>
						<option value="오전10시~오후7시">오전10시~오후7시</option>
					</select>
				</div>
			</div>
			<div>
				<h3>접수기간 및 방법</h3>
				<label>
					<b>접수기간</b>
					<span>~</span>
					<input type="date" name="hire_endday">
				</label>
			</div>
			<div>
				<label>
					<b>접수양식</b>
					<input type="radio" value="jobARA양식" name="hire_mode">
					<span>jobARA양식</span>
					<input type="radio" value="회사이력서 양식" name="hire_mode">
					<span>회사이력서 양식</span>
				</label>
			</div>
			<div>
				<h3>근무지 주소</h3>
					<label style="width: 500">
						<input type="text" name="hire_addr" id="originaddr1" readonly="readonly" placeholder="주소찾기 버튼을 클릭하여주세요." class="form-control"/><br/>
						<input type="text" name="hire_addr" id="originaddr2" readonly="readonly" class="form-control"/><br/>
						<input type="button" id="originfindaddr" value="주소 찾기" class="form-control"/><br/>
						<input type="text" name="hire_addr" id="addrDetail" placeholder="상세주소를 입력해주세요" class="form-control">
					</label>
			</div>
			<div>
				<h3>우대조건</h3>
				<label>
					<textarea rows="10" cols="100" name="hire_prefer_content"></textarea>
				</label>
			</div>
			<div>
				<h3>담당자 연락처</h3>
				<div>
					<b>담당자</b>
					<label>
						<b>이름</b>
						<input type="text" name="hire_manager_name" class="form-control">
					</label>
				</div>
				<div>
					<b style="position: relative;">연락처</b>
					<label>
						<b>담당자 휴대폰</b>
						<input type="text" name="hire_manager_tel" class="form-control"><br/>
						<b>담당자 e메일</b>
						<input type="text" name="hire_manager_email" class="form-control"><br/>
						<b>회사 전화번호</b>
						<input type="text" name="hire_ent_tel" class="form-control">
					</label>
				</div>
				<input type="submit" value="공고 등록">
			</div>
	</form>
	</div>

</body>
</html>