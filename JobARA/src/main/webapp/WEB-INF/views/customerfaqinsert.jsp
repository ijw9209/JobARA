<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="css/customerwrite.css" rel="stylesheet" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
</head>
<body>
<div id="container">
	<form action="faqinsertres.do" method="post" novalidate onsubmit="inquiryres()">
		<table border="1">
			<thead>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="faq_id" value="${FAQDto.faq_id }"/></td>
				</tr>
				<tr>
					<th>제   목</th>
					<td><input type="text" name="faq_title"/></td>
				</tr>
				<tr>
					<th>내   용</th>
					<td><textarea id="summernote" name="faq_content" rows="10" cols="60"></textarea></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<input type="submit" value="완료"/>
						<input type="button" value="목록" onclick="location.href='customerfaq.do'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
	$('#summernote').summernote({
		tabsize : 2,
		width : 700,
		height : 500
	});
	
	function inquiryres() {
		$('textarea[name="content"]').val(
				$('#summernote').summernote('code'));
	}
</script>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</html>