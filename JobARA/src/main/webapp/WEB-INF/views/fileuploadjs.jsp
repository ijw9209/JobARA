
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.springframework.web.util.WebUtils"%>
<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%@page import="com.job.prj.model.validate.UploadFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
window.onload=function(){
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}
<%
//UploadFile uploadFile=new UploadFile();
UploadFile uploadFile = (UploadFile)request.getAttribute("uploadfile");
MultipartFile file = uploadFile.getFile();
String filename = file.getOriginalFilename();
UploadFile fileobj = new UploadFile();
fileobj.setFilename(filename);
String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/image");
File newfile = new File(path + "/" + filename);
InputStream inputStream = null;
OutputStream outputStream = null;
try {
	inputStream = file.getInputStream();

	System.out.println("업로드 될 실제 경로 : " + path);

	File storage = new File(path);
	if (!storage.exists()) {
		storage.mkdirs();
	}


	System.out.println("파일이름:" + filename);
	if (!newfile.exists()) {
		newfile.createNewFile();
	}

	outputStream = new FileOutputStream(newfile);

	int read = 0;
	byte[] b = new byte[(int) file.getSize()];

	while ((read = inputStream.read(b)) != -1) {
		outputStream.write(b, 0, read);
	}
	
	%>
		$(function(){
			<%-- alert(<%=filename%>); --%>
			$("#kfile",opener.document).attr('src','/resources/image/<%=filename%>');
			$("#resume_photo",opener.document).val('/resources/image/<%=filename%>');
			close();
		});
	<%

} catch (IOException e) {
	e.printStackTrace();
} finally {
	try {
		inputStream.close();
		outputStream.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
}
%>



</script>
</head>
<body>
	
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">


</body>
</html>