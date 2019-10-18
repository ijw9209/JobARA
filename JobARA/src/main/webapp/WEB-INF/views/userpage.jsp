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
<title>User Page</title>
</head>
<body>
      <br><br>
      <div class="container text-center">
          <h1>USER PAGE</h1><br>
      </div>
      <br><br>
      <div class="container text-center">
          <h6 class="font-italic text-danger">USER 페이지입니다.<br>감사합니다. :)</h6>
      </div>
      <br><br>
      <div class="container text-center">
        <a href='<c:url value="/"/>' class="text-dark"><i class="fas fa-undo"></i></a>
      </div>
</body>
</html>