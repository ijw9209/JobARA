<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/hopeMap.js"></script>

</head>
<body>
<h2>희망근무조건</h2>
<table>
	<tr>
		<th>고용형태</th>
		<td><select>
			<option value=""></option>
			<option value="정규직">정규직</option>
			<option value="계약직">계약직</option>
			<option value="병역특례">병역특례</option>
			<option value="프리랜서">프리랜서</option>
			<option value="헤드헌팅">헤드헌팅</option>
			<option  value="파견대행">파견대행</option>
			<option value="인턴직">인턴직</option>
		</select></td>
	<td><input type="text" placeholder="희망연봉"></td>
	<td><button onclick="">면접 후 결정</button></td>
	</tr>
	<tr>
		<th>희망 근무지1</th>
		<td>
			<input type="hidden" name="hope_addr_one" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
		<tr>
		<th>희망 근무지2</th>
		<td>
			<input type="hidden" name="hope_addr_two" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
		<tr>
		<th>희망 근무지3</th>
		<td>
			<input type="hidden" name="hope_addr_three" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_one"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_two"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_three"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_four"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_five"></td>
	</tr>
	
	

</table>
</body>
</html>