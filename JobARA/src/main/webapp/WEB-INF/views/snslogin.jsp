<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>

</head>
<body>

	<form id="snsLogin" action="login" method="post">
		<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="snsId" name="id" value="${id}"/>
		<input type="hidden" id="snsPw" name="password" value="${pw}"/>	
	</form>
</body>
<script type="text/javascript">
	window.onload=function(){
		$("#snsLogin").submit();
	}
</script>

</html>