<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
<style type="text/css">
	
	.top_bhr_container {
    position: relative;
    width: 100%;
    position: relative;
    top: -50px;
    }
	
	.top_bhr{
    position: relative;
    height: 168px;
    background-color: #c2c8cc;
	}
	.top_bhr_wrap{
	width: 100%;
    background-color: #fff;
    z-index: 20;
    height: 140px;
	}
	.company_logo_box{
	position: relative;
    width: 104px;
    height: 104px;
    z-index: 5;
    bottom: 50px;
    }
    .company_logo_box img{
    box-sizing: border-box;
    display: block;
    width: 100%;
    height: 100%;
    border-radius: 4px;
    border: 2px solid #e5e6e9;
    overflow: hidden;
    background-color: #fff;
	}
	
	.company_title h1{
	color: #333;
    text-decoration: none;
    margin: 0;
    padding: 0;
    font-size: 30px;
	}
	.info_wrap{
		width: 100%;
		background-color: #f3f3f4;
		height: 1185px;
	}
	.container h2{
	padding-top: 40px;
    font-size: 27px;
    font-weight: 800;
	}
	.basic_info{
	background-color: #fff;
    border-radius: 3px;
    box-sizing: border-box;
    padding: 32px;
    margin-top: 40px;
	}
	
	.basic_info_item{
		width:100%;
	}
	.basic_info_ul{
		width: 100%;
		height: 90px;
		padding-left: 100px;
    	padding-top: 10px;
	}
	.basic_info_ul li{
	float: left;
    width: 33.3%;
    box-sizing: border-box;
    }
    .basic_info_indestry{
    	width:80%;
    	float:left;
    	padding-left:15px;
    	font-size:17px;
    }
    .basic_info_more{
    	border-top: 1px solid #e5e6e9;
    	padding-left: 50px;
   		padding-top: 30px;
   		font-size: 18px;
   	    line-height: 36px;

    }
    .item_subject{
    	float: left;
    	padding-right: 28px;
    	color: #85878c;
    }
    
    dd{
    	font-weight: 600; 
    
    }
.grid line {
    stroke: lightgrey;
    stroke-opacity: 0.7;
}
svg {
}
.bar {
    fill:rgb(164, 213, 255);
}
.bar:hover {
    fill: rgb(148, 166, 255);
/*     DarkSlateBlue; */
    cursor: pointer;
}
.text {
    fill: white;
    font-weight:bold;
}
.grid line {
  stroke: lightgrey;
  stroke-opacity: 0.7;
  shape-rendering: crispEdges;
}
.toolTip {
    position: absolute;
    border: 0 none;
    border-radius: 4px 4px 4px 4px;
    background-color: white;
    padding: 5px;
    text-align: center;
    font-sizge: 11px;
}
.tick{
	font-size: 16px !important; 
}
.domain{
	stroke: none !important;
}

.basic_info_two{
	background-color: #fff;
    border-radius: 3px;
    box-sizing: border-box;
    padding: 56px;
    margin-top: 40px;
}
.basic_info_title {
    color: #666;
  	font-size: 23px;
    font-weight: bold;
}
.salary_info{
  	 margin-top: 65px;
    padding: 40px 0 20px 0;
    background-color: #fafafa;
    width: 45%;
    display: inline-block;
    float: left;
    height: 170px;
}    
.average_currency {
    color: #5a71e1;
    font-size: 40px;
    line-height: 35px;
    text-align: center;
    font-weight: bold;
    padding-top: 22px;
   }
   
.chart_info{
	width: 45%;
    display: inline-block;
}   
</style>
</head>
<body>
	<div class="top_bhr_container">
		<div class="top_bhr"></div>
		<div class="top_bhr_wrap">
			<div class="container">
			<div class="company_logo_box">
				<img src="${dto.company_logo_url}"/><a class="company_logo_a"></a>
			</div>
			<div class="company_title">
				<h1>${dto.company_title }</h1>
			</div>
			</div>
		</div>
	</div>
	<div class="info_wrap">
		<div class="container">
		<h2>기업정보</h2>
		<div class="basic_info">
			<ul class="basic_info_ul">
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_indestry.png" style="width:17%;float:left;">
					<div class="basic_info_indestry">
					<span class="info_item_subject"><strong>${dto.company_cate}</strong></span><br/>
					<span style="width: 100%; box-sizing: border-box; font-size: 13px; color: #a4a6ad;">산업</span>
					</div>
				</div>
				
				</li>
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_employees.png" style="width:17%;float:left;">
					<div class="basic_info_indestry">
					<span class="info_item_subject"><c:if test="${empty dto.company_all_people}"><strong>-</strong></c:if><strong>${dto.company_all_people}</strong></span><br/>
					<span style="width: 100%; box-sizing: border-box; font-size: 13px; color: #a4a6ad;">사원수</span>
					</div>
				</div>
				</li>
				<li>
				<div class="basic_info_item">
					<img alt="" src="/resources/image/company_detail_establish.png" style="width:17%;float:left;">
					<div class="basic_info_indestry">
					<span class="info_item_subject"><strong>${dto.company_regdate}</strong></span><br/>
					<span style="width: 100%; box-sizing: border-box; font-size: 13px; color: #a4a6ad;">설립일</span>
					</div>
				</div>
				</li>
			</ul>
			<ul class="basic_info_more">
				<li>
					<dl>
						<dt class="item_subject">대표</dt>
						<dd>${dto.company_name}</dd>
						<dt class="item_subject">주소</dt>
						<dd>${addr}</dd>
						<dt class="item_subject">웹사이트</dt>
						<dd><a href="${dto.company_url}">${dto.company_url}</a></dd>
						<dt class="item_subject">자본금</dt>
						<c:if test="${empty dto.company_capital}">
						<dd>-</dd>
						</c:if>
						<dd>${dto.company_capital}</dd>
						<dt class="item_subject">매출액</dt>
						<c:if test="${empty dto.company_take}">
						<dd>-</dd>
						</c:if>
						<dd>${dto.company_take}</dd>
					</dl>
				</li>
			</ul>
		</div>
		<h2>평균연봉</h2>
			<div class="basic_info_two">
				<p class="basic_info_title">2019년 평균 연봉</p>
				<div class="salary_info">
					<p class="average_currency">
					<em><fmt:formatNumber value="${dto.company_salray}" pattern="#,##0"/></em> 
					만원</p>			
				</div>
			<div class="chart_info">	
			<svg width="500" height="320" style="margin-left:50px;"></svg>
			</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
	</div>
	<input type="hidden" id="salary" value="${dto.company_salray }"/>
</body>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
	
	
    var dataset = [ {x : '2018', y : 3111}
                        , {x : '2019', y : $("#salary").val()}];
 
    var svg = d3.select("svg");
    var width  = parseInt(svg.style("width"), 10) -20;
    var height = parseInt(svg.style("height"), 10)-20;
    var svgG = svg.append("g")
        .attr("transform", "translate(50, 0)");
    var xScale = d3.scaleBand()
        .domain(dataset.map(function(d) { return d.x;} ))
        .range([0, width]).padding(0.2);
    var yScale = d3.scaleLinear()
        .domain([0, d3.max(dataset, function(d){ return d.y; })])
        .range([height, 0]);
 
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
 
    var barG = svgG.append("g");
 
    barG.selectAll("rect")
        .data(dataset)
        .enter().append("rect")
            .attr("class", "bar")
            .attr("height", function(d, i) {return height-yScale(d.y)})
            .attr("width", xScale.bandwidth()-100)
            .attr("x", function(d, i) {return xScale(d.x)+50})     
            .attr("y", function(d, i) {return yScale(d.y)})
            .on("mouseover", function() { tooltip.style("display", null); })
            .on("mouseout",  function() { tooltip.style("display", "none"); })
            .on("mousemove", function(d) {
                tooltip.style("left", (d3.event.pageX + 10) + "px");
                tooltip.style("top", (d3.event.pageY - 10) + "px");
                tooltip.text("평균연봉 : " + d.y); 
            });
 
    barG.selectAll("text")
        .data(dataset)
        .enter().append("text")
        .text(function(d) {return d.y})
            .attr("class", "text")
            .attr("x", function(d, i) {return xScale(d.x)+xScale.bandwidth()/2})
            .style("text-anchor", "middle")
            .attr("y", function(d, i) {return yScale(d.y) + 15});
 
    var tooltip = d3.select("body").append("div")
        .attr("class", "toolTip")
        .style("display", "none");
 
</script>
</html>