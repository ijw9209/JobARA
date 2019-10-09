<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">


	$(function(){
		$.ajax({
			type:"GET",
			url:"https://nid.naver.com/nidlogin.logout",
			dataType:"jsonp",
			async:false,
			success :function(data){
				console.log("success" + data);
			},
			error:function(data,status,error){
				console.log("errordata" + data);
				console.log("errorstatus" + status);
				console.log("error" + error);
				if($("#login").length){
					$("#login").submit();
				}else{
					location.href="main";
				}
			}
			
		});
	});


</script>
<body>

	<c:choose>
		<c:when test="${not empty id }">
			<form id="login" action="login" method="post">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<input type="hidden" name="id" value="${id}" />
				<input type="hidden" name="password" value="${pw}" />	
			</form>
		</c:when>
	</c:choose>

</body>
</html>