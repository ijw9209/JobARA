<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<%@ include file="/WEB-INF/include/header.jspf"%>
<title>Insert title here</title>
</head>
<style>
.grid line {
    stroke: lightgrey;
    stroke-opacity: 0.7;
}
.lineChart {
    fill: none;
    stroke: steelblue;
    stroke-width: 1.5px;
}
.lineChart:hover {
    stroke: black;
    stroke-width: 3px;
}
.toolTip {
    position: absolute;
    border: 1px solid;
    border-radius: 4px 4px 4px 4px;
    background: rgba(0, 0, 0, 0.8);
    color : white;
    padding: 5px;
    text-align: center;
    font-size: 12px;
    min-width: 30px;
}
/* 사이드바 */
.side_menu_nav{
	float: left;
    width: 15%;
    height: 780px;
    position: absolute;
    top: 0px;
}
.sidenav {
			height:100%;
			width: 0;
			position: fixed;
			z-index:1;
			top: 0;
			left: 0;
			background-color: #3275ae;
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			padding-top: 60px;
			
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #fff;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: #000;
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		
		
		/* 미디어쿼리 적용 */
		@media screen and (max-height:450px) {
			.sidenav {
				padding-top:15px;
			}
			.sidenav a {
				font-size: 18px;
			}
		}

.adminpage_wrap{
	margin-top: 100px;
	

}


.admin_title{
	text-align: center;
	height: 160px;
}
.chart_title{
	height: 70px;

}
.chart_wrap{
	height: 80px;
}
.chart_wrap_content{

}
</style>
<body>
	<!-- side menu -->
	<nav class="side_menu_nav">
	<div id="mysidenav" class="sidenav" style="width: 250px;">
		<div style="width : 250px;">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="#">유저관리</a>
		<a href="#">공고관리</a>
		<a href="#">이력서관리</a>
		<a href="#">고객센터</a>		
			<sec:authorize access="isAuthenticated()">
   				<form action="/logout" method="post" name="fr">
					<a class="logout_a" style="cursor: pointer; color: #fff;" onclick="logout();">관리자 로그아웃</a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</sec:authorize>
		</div>
	</div>
	</nav>
	
	<div class="container adminpage_wrap">
		<div class="admin_title">
		<h1>관리자 페이지</h1>
		</div>
		<div class="chart_wrap">
			<div class="chart_title">
				<h2>일반/기업회원 가입자 수</h2>
			</div>
			<div class="chart_wrap_content">
			<svg width="900" height="500" id="chart"></svg>
			</div>
		</div>
	</div>
<script src="https://d3js.org/d3.v4.min.js"></script>


</body>

<script type="text/javascript">
window.onload = function() {
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
}

	function logout(){
		document.fr.submit();
	}

 
    var series = ["일반회원","기업회원"];
 
    var dataset = [
    	{'1월': 6, '2월':1, '3월':15, '4월':11, '5월':20, '6월':14, '7월':30, '8월':21, '9월':11, '10월':20, '11월':14, '12월':9},
        {'1월': 9, '2월':19, '3월':29, '4월':39, '5월':29, '6월':19, '7월':9, '8월':7, '9월':17, '10월':27, '11월':17, '12월':7}];
 
    var keys = d3.keys(dataset[0]);
    var data = [];
 
    dataset.forEach(function(d, i) {
    data[i] = keys.map(function(key) { return {x: key, y: d[key]}; })
    });
 
    var margin = {left: 20, top: 10, right: 10, bottom: 20};
    var svg = d3.select("svg");
    var width  = parseInt(svg.style("width"), 10) - margin.left - margin.right;
    var height = parseInt(svg.style("height"), 10)- margin.top  - margin.bottom;
    var svgG = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    var xScale = d3.scalePoint()//scaleBand() scaleOrdinal
        .domain(keys)
        .rangeRound([0, width]);
    var yScale = d3.scaleLinear()
        .domain([0, d3.max(dataset, function(d) { return d3.max(keys, function(key) { return d[key];});})])
        .nice()
        .range([height, 0]);
    var colors = d3.scaleOrdinal(d3.schemeCategory10);
 
    svgG.append("g")
        .attr("class", "grid")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(xScale)
            .tickSize(-height)
        );
 
    svgG.append("g")
        .attr("class", "grid")
        .call(d3.axisLeft(yScale)
            .ticks(5)
            .tickSize(-width)
           );
 
    var line = d3.line()
        //.curve(d3.curveBasis)
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); });
    var lineG = svgG.append("g")
        .selectAll("g")
        .data(data)
           .enter().append("g");
 
    lineG.append("path")
        .attr("class", "lineChart")
        .style("stroke", function(d, i) { return colors( series[i]); })
        .attr("d", function(d, i) {return line(d); });
 
    lineG.selectAll("dot")
        .data(function(d) {return d })
        .enter().append("circle")
            .attr("r", 3)
            .attr("cx", function(d) { return xScale(d.x) })
            .attr("cy", function(d) { return yScale(d.y);})
            .on("mouseover", function() { tooltip.style("display", null); })
            .on("mouseout",  function() { tooltip.style("display", "none"); })
            .on("mousemove", function(d) {
                tooltip.style("left", (d3.event.pageX+10)+"px");
                tooltip.style("top",  (d3.event.pageY-10)+"px");
                tooltip.html("month. " + d.x + "<br/>" + "data value : " + d.y);
            });

    var tooltip = d3.select("body")
        .append("div")
        .attr("class", "toolTip")
        .style("display", "none");
 
    var legend = svgG.append("g")
        .attr("text-anchor", "end")
        .selectAll("g")
        .data(series)
        .enter().append("g")
        .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });
 
    legend.append("rect")
          .attr("x", width - 20)
          .attr("width", 19)
          .attr("height", 19)
          .attr("fill", colors);
 
      legend.append("text")
          .attr("x", width - 30)
          .attr("y", 9.5)
          .attr("dy", "0.32em")
          .text(function(d) { return d; });

      /*
      function closeNav() {
    		document.getElementById('mysidenav').style.width = '0';
    	}

    	$(document).ready(function(){
    	 	$(".side_menu_nav").mouseenter(function(){
    			$("#mysidenav").width('250px');
    		});
    		$(".side_menu_nav").mouseleave(function(){
    			$("#mysidenav").width('0px');
    		}); 
    		
    	});	 */
</script>
</html>