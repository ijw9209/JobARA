<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"  %>
<title>Insert title here</title>
</head>
<style type="text/css">

 body{
 	background-color: #212121;
 }

 .loading{
 	
 }

.loading span {
  display: inline-block;
  margin: 0 -.05em;
  animation: loading 2.0s infinite alternate;
    color: white;
    font-size: 70px;
    font-weight: 800;
}
.loading span:nth-child(2) {
  animation-delay: .2s;
}
.loading span:nth-child(3) {
  animation-delay: .4s;
}
.loading span:nth-child(4) {
  animation-delay: .6s;
}
.loading span:nth-child(5) {
  animation-delay: .8s;
}
.loading span:nth-child(6) {
  animation-delay: 1s;
}
.loading span:nth-child(7) {
  animation-delay: 1.2s;
}
.loading span:nth-child(8) {
  animation-delay: 1.5s;
}
.loading span:nth-child(9) {
  animation-delay: 1.7s;
}
.loading span:nth-child(10) {
  animation-delay: 2.0s;
}
@keyframes loading {
  0% {
    filter: blur(0);
    opacity: 1;
  }
  100% {
    filter: blur(5px);
    opacity: .2;
  }
}
</style>

<body>
	
	<div class="container" style="text-align: center; margin-top: 20%;">
	<div class="loading">
 		 <span>L&nbsp;</span>
  		 <span>O&nbsp;</span>
         <span>A&nbsp;</span>
  		 <span>D&nbsp;</span>
         <span>I&nbsp;</span>
         <span>N&nbsp;</span>
         <span>G&nbsp;</span>
         <span>.&nbsp;</span>
         <span>.&nbsp;</span>
         <span>.</span>
		</div>
		</div>
</body>

<script type="text/javascript">
 window.onload = function() {
	setTimeout(function() {
		 location.href="main";
	}, 4000);
} 


</script>
</html>