<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
/* function send(){
	
	
	window.opener.document.img.kfile.value=document.form.file.value;
	self.close();
} */



</script>
<body>

<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile"
 action="upload.do?${_csrf.parameterName}=${_csrf.token}" name="form">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> 
		파일 : <input type="file" name="file"/><br/>
		<p style="color: red; font-weight: bold;">
			<form:errors path="file" />
		</p>
	<input type="submit" id="submit" value="전송"/>
	</form:form>
</body>
</html>