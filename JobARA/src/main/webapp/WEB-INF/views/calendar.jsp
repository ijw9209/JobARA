<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/header.jspf"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1600px;
	margin: 0 auto;
}
</style>
<link href="/resources/js/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<link href="/resources/js/fullcalendar/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<script type="text/javascript"
	src="/resources/js/fullcalendar/moment.min.js"></script>
<script type="text/javascript"
	src="/resources/js/fullcalendar/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/js/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="/resources/js/fullcalendar/ko.js"></script>
<script type="text/javascript">
	jQuery(document).ready(
			function() {
				jQuery("#calendar").fullCalendar(
						{
							height : 750,
							defaultDate : new Date(),
							eventLimit : true,
							events : [ {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 코스닥/코넥스 상장기업 취업박람회",
								start : "2019-11-13T10:00:00",
								end : "2019-11-13T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 글로벌 일자리대전",
								start : "2019-11-12",
								end : "2019-11-13"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 코스닥/코넥스 상장기업 취업박람회",
								start : "2019-11-13T10:00:00",
								end : "2019-11-13T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-11-07T13:20:00",
								end : "2019-11-07T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "Conference",
								start : "2016-05-11",
								end : "2016-05-13"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜오이솔루션(도시락 미팅)",
								start : "2019-11-07T12:00:00",
								end : "2019-11-07T13:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-11-05T16:00:00",
								end : "2019-11-05T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-11-04T15:00:00",
								end : "2019-11-04T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-11-01T13:30:00",
								end : "2019-11-07T17:30:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-10-30T13:20:00",
								end : "2019-10-30T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 관광산업 일자리박람회",
								start : "2019-10-30T10:00:00",
								end : "2019-10-30T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 원자력 일자리 박람회",
								start : "2019-10-30T10:00:00",
								end : "2019-10-30T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "카버코리아(유니레버 인턴쉽)",
								start : "2019-10-30T15:00:00",
								end : "2019-10-30T16:30:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-10-29T15:00:00",
								end : "2019-10-29T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 관광산업 일자리박람회",
								start : "2019-10-29T10:00:00",
								end : "2019-10-29T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 원자력 일자리 박람회",
								start : "2019-10-29T10:00:00",
								end : "2019-10-29T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코스맥스㈜",
								start : "2019-10-28T15:00:00",
								end : "2019-10-28T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "이랜드그룹 전략기획본부(ESI)",
								start : "2019-10-28T16:30:00",
								end : "2019-10-28T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 인천 여성 취업박람회",
								start : "2019-10-24T14:00:00",
								end : "2019-10-24T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "이랜드그룹 전략기획본부(ESI)",
								start : "2019-10-28T16:30:00",
								end : "2019-10-28T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "하이네켄코리아",
								start : "2019-10-22T10:00:00",
								end : "2019-10-22T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 성동 희망 일자리 박람회",
								start : "2019-10-22T14:00:00",
								end : "2019-10-22T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "삼성전자로지텍㈜",
								start : "2019-10-22T16:00:00",
								end : "2019-10-28T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "삼성전자로지텍㈜",
								start : "2019-10-22T15:00:00",
								end : "2019-10-22"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "본그룹",
								start : "2019-10-22T14:00:00",
								end : "2019-10-22T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "2019 성동 희망 일자리 박람회",
								start : "2019-10-22T14:00:00",
								end : "2019-10-22T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "삼성전자로지텍㈜",
								start : "2019-10-21T16:00:00",
								end : "2019-10-21T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜이랜드시스템스",
								start : "2019-10-18T10:00:00",
								end : "2019-10-28T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜다원시스",
								start : "2019-10-18T15:00:00",
								end : "2019-10-18T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "시큐아이㈜",
								start : "2019-10-18T10:00:00",
								end : "2019-10-18T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "한미약품㈜S",
								start : "2019-10-17T11:00:00",
								end : "2019-10-17T13:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜한미글로벌",
								start : "2019-10-17T10:00:00",
								end : "2019-10-17T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "종근당",
								start : "2019-10-17T10:00:00",
								end : "2019-10-17T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "시큐아이㈜",
								start : "2019-10-17T10:00:00",
								end : "2019-10-17T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "삼성전자로지텍㈜",
								start : "2019-10-17T15:00:00",
								end : "2019-10-17"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "현대백화점그룹",
								start : "2019-10-16T10:00:00",
								end : "2019-10-16T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "한미약품㈜",
								start : "2019-10-16T14:00:00",
								end : "2019-10-16T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "Spyder(스파이더) Korea",
								start : "2019-10-16T14:00:00",
								end : "2019-10-16T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "보령제약㈜",
								start : "2019-10-15T15:00:00",
								end : "2019-10-15T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "종로구 문화예술관광분야 청년취업 박람회",
								start : "2019-10-14T14:00:00",
								end : "2019-10-14T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "시큐아이㈜",
								start : "2019-10-14T10:00:00",
								end : "2019-10-14T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "수협은행",
								start : "2019-10-14T16:00:00",
								end : "2019-10-14T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "코나아이㈜",
								start : "2019-10-12T14:00:00",
								end : "2019-10-12T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "교보생명보험㈜S",
								start : "2019-10-12T13:30:00",
								end : "2019-10-12T15:30:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "KB손해보험㈜",
								start : "2019-10-11T10:00:00",
								end : "2019-10-11T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "SBA 2019 서울기업 채용캠프",
								start : "2019-10-11T09:00:00",
								end : "2019-10-11T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜교원",
								start : "2019-10-11T14:00:00",
								end : "2019-10-11T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "KB손해보험㈜",
								start : "2019-10-10T10:00:00",
								end : "2019-10-10T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "CJ프레시웨이㈜ (전문인재)",
								start : "2019-10-10T16:00:00",
								end : "2019-10-10T18:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "SBA 2019 서울기업 채용캠프",
								start : "2019-10-10T09:30:00",
								end : "2019-10-10T14:50:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "SSG.COM",
								start : "2019-10-08T10:00:00",
								end : "2019-10-08T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "LIG넥스원㈜",
								start : "2019-10-08T10:00:00",
								end : "2019-10-08T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "HP",
								start : "2019-10-08T15:00:00",
								end : "2019-10-08T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "국가보안기술연구소",
								start : "2019-10-07T11:00:00",
								end : "2019-10-07T12:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "HP Printing Korea(겨울방학 인턴)",
								start : "2019-10-07T15:00:00",
								end : "2019-10-07T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜교원",
								start : "2019-10-11T14:00:00",
								end : "2019-10-11T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "게임빌컴투스",
								start : "2019-10-07T10:00:00",
								end : "2019-10-07T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "SSG.COM 온라인 채용 설명회",
								start : "2019-10-05T14:00:00",
								end : "2019-10-05T15:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜대웅제약",
								start : "2019-10-05T14:00:00",
								end : "2019-10-05T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "LIG넥스원㈜",
								start : "2019-10-04T14:00:00",
								end : "2019-10-04T16:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "㈜이랜드시스템스",
								start : "2019-10-04T10:00:00",
								end : "2019-10-04T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "SSG.COM",
								start : "2019-10-02T10:00:00",
								end : "2019-10-02T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "JW그룹",
								start : "2019-10-02T16:00:00",
								end : "2019-10-02T19:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "한미약품㈜",
								start : "2019-10-02T10:00:00",
								end : "2019-10-02T12:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "관악구 취업박람회",
								start : "2019-10-02T14:00:00",
								end : "2019-10-02T17:00:00"
							}, {
								color : "#AAB19D",
				              	textColor : "#FFF",
								title : "CJ LIVE CITY",
								start : "2019-10-01T14:00:00",
								end : "2019-10-01T15:00:00"
							}
							],
							eventClick : function(event) {

								alert(event.title + "\n" + event.start + "\n"
										+ event.end, "wicked",
										"width=700,height=600");
								return false;

							}

						});
			});
</script>
</head>
<body>

	<div id="calendar"></div>

</body>
</html>