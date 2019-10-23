<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<%@ include file="/WEB-INF/include/header.jsp"  %>
<link href="http://netddna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<form action="customerinsertres.do" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>
					<td><input type="text" name="customer_title"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="summernote" name="customer_content" rows="10" cols="60"></textarea></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><input type="text" name="customer_email"/></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<input type="submit" value="작성" />
						<input type="button" value="취소" onclick="location.href='customerservice.do'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : 'content',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	});
});


</script>
<%@ include file="/WEB-INF/include/footer.jsp"  %>
</html>