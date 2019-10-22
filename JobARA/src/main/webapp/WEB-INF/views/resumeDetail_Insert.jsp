<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" th:content="${_csrf.token}" />
<meta name="_csrf_header" th:content="${_csrf.headerName}" />


<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/resources/js/hopeMap.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function popUpImg() {
		window.open("uploadform.do", "",
				"left=600px,top=50px,width=600px,height=600px");
	}

	$(function() {
		$(".calendar").datepicker({
			dateFormat : 'yy-mm-dd',
			changeYear : true,
			changeMonth : true,
		});
	});

	$(function() {
		$('#military').change(function() {
			var state = jQuery('#military option:selected').val();
			if (state == 'Y') {
				jQuery('.military_detail').show();
			} else {
				jQuery('.military_detail').hide();
			}
		});
	});
	// 학력
	$(function() {

		var edubody = document.getElementById("edubody");
		var major = document.getElementById("major");
		var schoolname = '';

		$("#elementary").click(function() {
			edubody.style.display = "block";
			major.style.display = "none";
			$("#edutxt").val("초등학교 졸업");

			$.ajax({
				type : 'get',
				url : 'school.do',
				data : 'gubun=' + 'elem_list',
				success : function(data) {
					schoolname = data.split("/");
					$('#schoolname').autocomplete({
						source : schoolname,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});
				},
				error : function(error) {
					alert("실패")
				}
			})

		})
		$("#middle").click(function() {
			edubody.style.display = "block";
			major.style.display = "none";
			$("#edutxt").val("중학교 졸업");

			$.ajax({
				type : 'get',
				url : 'school.do',
				data : 'gubun=' + 'midd_list',
				success : function(data) {
					schoolname = data.split("/");
					$('#schoolname').autocomplete({
						source : schoolname,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});

				},
				error : function(error) {
					alert("실패")
				}
			})

		})

		$("#high").click(function() {
			edubody.style.display = "block";
			major.style.display = "none";
			$("#edutxt").val("고등학교 졸업");

			$.ajax({
				type : 'get',
				url : 'school.do',
				data : 'gubun=' + 'high_list',
				success : function(data) {
					schoolname = data.split("/");
					$('#schoolname').autocomplete({
						source : schoolname,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});
				},
				error : function(error) {
					alert("실패")
				}
			})
		})

		$("#university").click(function() {
			var major = document.getElementById("major");
			edubody.style.display = "block";
			major.style.display = "block";
			$("#edutxt").val("대학~대학원 이상 졸업");

			$.ajax({
				type : 'get',
				url : 'school.do',
				data : 'gubun=' + 'univ_list',
				success : function(data) {
					schoolname = data.split("/");
					$('#schoolname').autocomplete({
						source : schoolname,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});

				},
				error : function(error) {
					alert("실패")
				}
			})

		})

	})

	//자격증

	$(
			function() {

				var crtibodyone = document.getElementById("crtibody1");
				var crtibodytwo = document.getElementById("crtibody2");
				var crtibodythr = document.getElementById("crtibody3");
				var crtiarr = [ '굴삭기운전기능사', '기중기운전기능사', '로더운전기능사', '롤러운전기능사',
						'불도저운전기능사', '양화장치운전기능사', '지게차운전기능사', '천공기운전기능사',
						'천장크레인운전기능사', '컨테이너크레인운전기능사', '타워크레인운전기능사', '배관기능사',
						'배관기능장', '배관산업기사', '거푸집기능사', '건축구조기술사', '건축기계설비기술사',
						'건축기사', '건축도장기능사', '건축목공기능사', '건축목공산업기사', '건축목재시공기능장',
						'건축산업기사', '건축설비기사', '건축설비산업기사', '건축시공기술사', '건축일반시공기능장',
						'건축일반시공산업기사', '건축품질시험기술사', '도배기능사', '미장기능사', '방수기능사',
						'방수산업기사', '비계기능사', '실내건축기능사', '실내건축기사', '실내건축산업기사',
						'온수온돌기능사', '유리시공기능사', '전산응용건축제도기능사', '조적기능사', '철근기능사',
						'타일기능사', '세탁기능사', '사회조사분석사1급', '사회조사분석사2급',
						'소비자전문상담사1급', '소비자전문상담사2급', '컨벤션기획사1급', '컨벤션기획사2급',
						'금속가공기술사', '금속재료기능장', '금속재료기사', '금속재료기술사', '금속재료산업기사',
						'금속재료시험기능사', '금속제련기술사', '세라믹기술사', '압연기능사', '압연기능장',
						'열처리기능사', '재료조직평가산업기사', '제강기능사', '제강기능장', '제선기능사',
						'제선기능장', '축로기능사', '금형기능사', '금형기술사', '금형제작기능장',
						'사출금형산업기사', '사출금형설계기사', '프레스금형산업기사', '프레스금형설계기사',
						'건설기계기술사', '건설기계설비기사', '건설기계설비산업기사', '건설기계정비기능사',
						'건설기계정비기능장', '건설기계정비기사', '건설기계정비산업기사', '공조냉동기계기능사',
						'공조냉동기계기사', '공조냉동기계기술사', '공조냉동기계산업기사', '궤도장비정비기능사',
						'궤도장비정비기사', '궤도장비정비산업기사', '기계정비기능사', '기계정비산업기사',
						'농기계정비기능사', '농업기계기사', '농업기계산업기사', '메카트로닉스기사',
						'반도체장비유지보수기능사', '산업기계설비기술사', '생산자동화기능사', '생산자동화산업기사',
						'설비보전기능사', '설비보전기사', '승강기기능사', '승강기기사', '승강기산업기사',
						'전자부품장착기능사', '전자부품장착산업기사', '공유압기능사', '기계가공기능장',
						'기계가공조립기능사', '기계기술사', '기계설계기사', '기계설계산업기사', '기계조립산업기사',
						'연삭기능사', '일반기계기사', '전산응용기계제도기능사', '정밀측정기능사',
						'정밀측정산업기사', '치공구설계산업기사', '컴퓨터응용가공산업기사', '컴퓨터응용밀링기능사',
						'컴퓨터응용선반기능사', '농화학기술사', '시설원예기사', '시설원예기술사', '원예기능사',
						'유기농업기능사', '유기농업기사', '유기농업산업기사', '종자기능사', '종자기사',
						'종자기술사', '종자산업기사', '화훼장식기능사', '화훼장식기사', '화훼장식산업기사',
						'원형기능사', '주조기능사', '주조기능장', '주조산업기사', '교통기사', '교통기술사',
						'교통산업기사', '도시계획기사', '도시계획기술사', '광고도장기능사', '금속도장기능사',
						'표면처리기능사', '표면처리기능장', '표면처리기술사', '표면처리산업기사', '시각디자인기사',
						'시각디자인산업기사', '웹디자인기능사', '제품디자인기사', '제품디자인기술사',
						'제품디자인산업기사', '제품응용모델링기능사', '컬러리스트기사', '컬러리스트산업기사',
						'컴퓨터그래픽스운용기능사', '가구제작기능사', '가구제작산업기사', '귀금속가공기능사',
						'귀금속가공기능장', '귀금속가공산업기사', '도자공예기능사', '목공예기능사',
						'보석가공기능사', '보석감정사', '보석감정산업기사', '보석디자인산업기사', '석공예기능사',
						'피아노조율기능사', '피아노조율산업기사', '국제의료관광코디네이터', '임상심리사1급',
						'임상심리사2급', '누설비파괴검사기사', '방사선비파괴검사기능사', '방사선비파괴검사기사',
						'방사선비파괴검사산업기사', '비파괴검사기술사', '와전류비파괴검사기사', '자기비파괴검사기능사',
						'자기비파괴검사기사', '자기비파괴검사산업기사', '초음파비파괴검사기능사',
						'초음파비파괴검사기사', '초음파비파괴검사산업기사', '침투비파괴검사기능사',
						'침투비파괴검사기사', '침투비파괴검사산업기사', '직업상담사1급', '직업상담사2급',
						'공장관리기술사', '포장기사', '포장기술사', '포장산업기사', '품질경영기사',
						'품질경영산업기사', '품질관리기술사', '섬유기사', '섬유기술사', '섬유디자인산업기사',
						'섬유산업기사', '염색기능사(날염)', '염색기능사(침염)', '의류기사', '의류기술사',
						'스포츠경영관리사', '수산제조기사', '수산제조기술사', '식육가공기사', '식품가공기능사',
						'식품기사', '식품기술사', '식품산업기사', '가스기능사', '가스기능장', '가스기사',
						'가스기술사', '가스산업기사', '건설안전기사', '건설안전기술사', '건설안전산업기사',
						'기계안전기술사', '농작업안전보건기사', '방재기사', '산업안전기사', '산업안전산업기사',
						'산업위생관리기사', '산업위생관리기술사', '산업위생관리산업기사', '소방기술사',
						'소방설비기사(기계분야)', '소방설비기사(전기분야)', '소방설비산업기사(기계분야)',
						'소방설비산업기사(전기분야)', '인간공학기사', '인간공학기술사', '전기안전기술사',
						'화공안전기술사', '화재감식평가기사', '화재감식평가산업기사', '수산양식기능사',
						'수산양식기사', '수산양식기술사', '수산양식산업기사', '어로기술사', '어로산업기사',
						'어업생산관리기사', '기상감정기사', '기상기사', '기상예보기술사',
						'신재생에너지발전설비기능사(태양광)', '신재생에너지발전설비기사(태양광)',
						'신재생에너지발전설비산업기사(태양광)', '에너지관리기능사', '에너지관리기능장',
						'에너지관리기사', '에너지관리산업기사', '텔레마케팅관리사', '용접기능사', '용접기능장',
						'용접기사', '용접기술사', '용접산업기사', '특수용접기능사', '농기계운전기능사',
						'철도운송산업기사', '위험물기능사', '위험물기능장', '위험물산업기사', '신발류제조기능사',
						'양복기능사', '양장기능사', '패션디자인산업기사', '패션머천다이징산업기사', '한복기능사',
						'한복산업기사', '미용사(네일)', '미용사(메이크업)', '미용사(일반)', '미용사(피부)',
						'미용장', '이용사', '이용장', '사진기능사', '인쇄기능사', '인쇄기사',
						'인쇄산업기사', '전자출판기능사', '버섯산업기사', '버섯종균기능사', '산림기능사',
						'산림기사', '산림기술사', '산림산업기사', '식물보호기사', '식물보호산업기사',
						'임산가공기능사', '임산가공기사', '임산가공산업기사', '임업종묘기능사', '임업종묘기사',
						'그린전동자동차기사', '자동차보수도장기능사', '자동차정비기능사', '자동차정비기능장',
						'자동차정비기사', '자동차정비산업기사', '자동차차체수리기능사', '차량기술사',
						'건축전기설비기술사', '발송배전기술사', '전기공사기사', '전기공사산업기사', '전기기능사',
						'전기기능장', '전기기사', '전기산업기사', '전기응용기술사', '전기철도기사',
						'전기철도기술사', '전기철도산업기사', '철도신호기사', '철도신호기술사', '철도신호산업기사',
						'철도전기신호기능사', '3D프린터개발산업기사', '3D프린터운용기능사', '광학기기산업기사',
						'광학기능사', '광학기사', '로봇기구개발기사', '로봇소프트웨어개발기사',
						'로봇하드웨어개발기사', '반도체설계기사', '반도체설계산업기사', '산업계측제어기술사',
						'의공기사', '의공산업기사', '의료전자기능사', '임베디드기사', '전자계산기기능사',
						'전자계산기기사', '전자계산기제어산업기사', '전자기기기능사', '전자기기기능장', '전자기사',
						'전자산업기사', '전자응용기술사', '전자캐드기능사', '멀티미디어콘텐츠제작전문가',
						'사무자동화산업기사', '전자계산기조직응용기사', '정보관리기술사', '정보기기운용기능사',
						'정보처리기능사', '정보처리기사', '정보처리산업기사', '컴퓨터시스템응용기술사',
						'떡제조기능사', '제과기능사', '제과기능장', '제빵기능사', '조경기능사', '조경기사',
						'조경기술사', '조경산업기사', '복어조리기능사', '복어조리산업기사', '양식조리기능사',
						'양식조리산업기사', '일식조리기능사', '일식조리산업기사', '조리기능장', '조주기능사',
						'중식조리기능사', '중식조리산업기사', '한식조리기능사', '한식조리산업기사',
						'동력기계정비기능사', '선체건조기능사', '전산응용조선제도기능사', '조선기사', '조선기술사',
						'조선산업기사', '화약류관리기사', '화약류관리기술사', '화약류관리산업기사',
						'화약취급기능사', '철도차량기사', '철도차량기술사', '철도차량산업기사',
						'철도차량정비기능사', '철도차량정비기능장', '식육처리기능사', '축산기능사', '축산기사',
						'축산기술사', '축산산업기사', '건설재료시험기능사', '건설재료시험기사',
						'건설재료시험산업기사', '농어업토목기술사', '도로및공항기술사', '도화기능사',
						'상하수도기술사', '석공기능사', '수자원개발기술사', '응용지질기사', '잠수기능사',
						'잠수기능장', '잠수산업기사', '전산응용토목제도기능사', '지도제작기능사', '지적기능사',
						'지적기사', '지적기술사', '지적산업기사', '지질및지반기술사', '철도기술사',
						'철도토목기능사', '철도토목기사', '철도토목산업기사', '측량기능사',
						'측량및지형공간정보기사', '측량및지형공간정보기술사', '측량및지형공간정보산업기사',
						'콘크리트기능사', '콘크리트기사', '콘크리트산업기사', '토목구조기술사', '토목기사',
						'토목산업기사', '토목시공기술사', '토목품질시험기술사', '토질및기초기술사',
						'항공사진기능사', '항로표지기능사', '항로표지기사', '항로표지산업기사', '항만및해안기술사',
						'해양공학기사', '해양기술사', '해양자원개발기사', '해양조사산업기사', '해양환경기사',
						'금속재창호기능사', '판금제관기능사', '판금제관기능장', '판금제관산업기사',
						'플라스틱창호기능사', '항공기관기술사', '항공기관정비기능사', '항공기사', '항공기체기술사',
						'항공기체정비기능사', '항공산업기사', '항공장비정비기능사', '항공전자정비기능사',
						'바이오화학제품제조산업기사', '생물공학기사', '화공기사', '화공기술사', '화약류제조기사',
						'화약류제조산업기사', '화학분석기능사', '화학분석기사', '농림토양평가관리산업기사',
						'대기관리기술사', '대기환경기사', '대기환경산업기사', '생물분류기사(동물)',
						'생물분류기사(식물)', '소음진동기사', '소음진동기술사', '소음진동산업기사',
						'수질관리기술사', '수질환경기사', '수질환경산업기사', '온실가스관리기사',
						'온실가스관리산업기사', '자연생태복원기사', '자연생태복원산업기사', '자연환경관리기술사',
						'토양환경기사', '토양환경기술사', '폐기물처리기사', '폐기물처리기술사',
						'폐기물처리산업기사', '환경기능사', '환경위해관리기사', '비서1급', '비서2급',
						'비서3급', '워드프로세서', '전산회계운용사 1급', '전산회계운용사 2급',
						'전산회계운용사 3급', '전자상거래관리사1급', '전자상거래관리사2급', '전자상거래운용사',
						'컴퓨터활용능력1급', '컴퓨터활용능력2급', '한글속기1급', '한글속기2급', '한글속기3급',
						'영사기능사', '영사산업기사', '광산보안기능사', '광산보안기사', '광산보안산업기사',
						'광해방지기사', '광해방지기술사', '시추기능사', '자원관리기술사', '무선설비기능사',
						'무선설비기사', '무선설비산업기사', '방송통신기능사', '방송통신기사', '방송통신산업기사',
						'전파전자통신기능사', '전파전자통신기사', '전파전자통신산업기사', '정보통신기사',
						'정보통신기술사', '정보통신산업기사', '통신기기기능사', '통신선로기능사',
						'통신선로산업기사', '통신설비기능장', '방사선관리기술사', '원자력기사', '원자력발전기술사',
						'정보보안기사', '정보보안산업기사', '게임그래픽전문가', '게임기획전문가',
						'게임프로그래밍전문가', '사회복지사 1급', '정수시설운영관리사1급', '정수시설운영관리사2급',
						'정수시설운영관리사3급', '공인노무사', '산업보건지도사(산업위생공학)',
						'산업보건지도사(직업환경의학)', '산업안전지도사(건설안전)', '산업안전지도사(기계안전)',
						'산업안전지도사(전기안전)', '산업안전지도사(화공안전)', '감정사', '검량사', '검수사',
						'경영지도사(1차공통)', '경영지도사(마케팅)', '경영지도사(생산관리)',
						'경영지도사(인적자원관리)', '경영지도사(재무관리)', '기술지도사(1차공통)',
						'기술지도사(금속)', '기술지도사(기계)', '기술지도사(생명공학)', '기술지도사(생산관리)',
						'기술지도사(섬유)', '기술지도사(전기전자)', '기술지도사(정보처리)', '기술지도사(화공)',
						'기술지도사(환경)', '기계경비지도사', '일반경비지도사', '가맹거래사',
						'관광통역안내사(독어)', '관광통역안내사(러시아어)', '관광통역안내사(말레이/인도네시아어)',
						'관광통역안내사(베트남어)', '관광통역안내사(불어)', '관광통역안내사(스페인어)',
						'관광통역안내사(아랍어)', '관광통역안내사(영어)', '관광통역안내사(이탈리아어)',
						'관광통역안내사(일본어)', '관광통역안내사(중국어)', '관광통역안내사(태국어)',
						'국내여행안내사', '박물관및미술관준학예사', '한국어교육능력검정시험', '호텔경영사',
						'호텔관리사', '호텔서비스사', '문화재수리기능자(가공석공)', '문화재수리기능자(대목수)',
						'문화재수리기능자(도금공)', '문화재수리기능자(드잡이공)', '문화재수리기능자(모사공)',
						'문화재수리기능자(목조각공)', '문화재수리기능자(박제및표본제작공)',
						'문화재수리기능자(번와와공)', '문화재수리기능자(보존처리공)', '문화재수리기능자(석조각공)',
						'문화재수리기능자(세척공)', '문화재수리기능자(소목수)', '문화재수리기능자(식물보호공)',
						'문화재수리기능자(실측설계사보)', '문화재수리기능자(쌓기석공)', '문화재수리기능자(온돌공)',
						'문화재수리기능자(제작와공)', '문화재수리기능자(조경공)', '문화재수리기능자(철물공)',
						'문화재수리기능자(칠공)', '문화재수리기능자(표구공)', '문화재수리기능자(한식미장공)',
						'문화재수리기능자(화공)', '문화재수리기능자(훈증공)', '문화재수리기술자(단청)',
						'문화재수리기술자(보수)', '문화재수리기술자(보존과학)', '문화재수리기술자(식물보호)',
						'문화재수리기술자(실측설계)', '문화재수리기술자(조경)', '관세사', '1급 청소년상담사',
						'1급 청소년지도사', '2급 청소년상담사', '2급 청소년지도사', '3급 청소년상담사',
						'3급 청소년지도사', '기술행정사', '외국어번역행정사', '일반행정사', '경매사(수산)',
						'경매사(약용)', '경매사(양곡)', '경매사(청과)', '경매사(축산)', '경매사(화훼)',
						'농산물품질관리사', '손해평가사', '감정평가사', '공인중개사', '물류관리사',
						'주택관리사보', '수산물품질관리사', '소방시설관리사', '소방안전교육사', '세무사',
						'변리사', '기록물관리 전문요원', '기업재난관리사', '1급 산림치유지도사',
						'2급 산림치유지도사', '목구조관리기술자', '목구조시공기술자', '산림교육전문가', '간호사',
						'간호조무사', '물리치료사', '방사선사', '보육교사', '안경사', '안마사', '약사',
						'영양사', '위생사', '응급구조사', '의무기록사', '의사', '의지보조기기사',
						'임상병리사', '작업치료사', '장례지도사', '정신보건간호사', '정신보건사회복지사',
						'정신보건임상심리사', '조산사', '치과기공사', '치과위생사', '치과의사', '한약사',
						'한약조제사', '한의사', '사회환경교육지도사2급', '사회환경교육지도사3급',
						'환경영향평가사', '환경측정분석사', '직업능력개발훈련교사', '고속구조정수', '구명정수',
						'기관사', '도선사', '소형선박조종사', '수면비행선박조종사', '수산질병관리사', '운항사',
						'통신사', '항해사', '자동차운전기능검정원', '자동차운전면허', '자동차운전전문강사',
						'경기지도사', '경주심판', '무대예술전문인', '문화예술교육사', '사서', '생활체육지도사',
						'무선통신사', '아마츄어무선기사', '보세사', '방사선취급감독자면허',
						'방사성동위원소취급자일반면허', '방사성동위원소취급자특수면허', '원자로조종감독자면허',
						'원자로조종사면허', '핵연료물질취급면허 [감독자]', '핵연료물질취급면허 [취급자]',
						'가축인공수정사', '농산물검사원', '말조련사', '수의사', '장제사', '재활승마지도사',
						'유통관리사', '건축사', '건축사(예비)', '교통안전관리자', '버스운전자',
						'사업용 조종사', '운송용 조종사', '자가용 조종사', '철도차량운전면허',
						'초경량비행장치 조종자', '택시운전자격', '항공교통관제사', '항공기관사', '항공사',
						'항공운항관리사', '항공정비사', '화물운송종사자', '보건교사', '사서교사', '실기교사',
						'영양교사', '전문상담교사', '정교사', '준교사', '평생교육사', '1급 소방안전관리자',
						'2급 소방안전관리자', '3급 소방안전관리자', '특급 소방안전관리자', '화재조사관',
						'주류제조관리사', '동력수상레저기구조종면허', '변호사', '법무사', '공인회계사',
						'보험계리사', '보험중개사', '손해사정사',
						'한자·한문전문지도사(지도사1,2급,훈장특급,1,2급)',
						'한자급수자격검정(사범,1급,준1급,2급)', '병원행정사', '실천예절지도사', '신용관리사',
						'한자한문학습지도사', '한국실용글쓰기검정(1,2,3급)', 'CRA(신용위험분석사)',
						'국제금융역', '신용분석사', '여신심사역', '외환전문역I,II종(CFES I, II)',
						'자산관리사', '수화통역사', '분재관리사(1,2급,전문관리사)', '수목보호기술자',
						'점역교정사(1,2,3급)', '한자능력급수', '지역난방설비관리사',
						'실용영어(PELT)(1,2,3급)', '실용한자(1,2,3,4급)',
						'자동차진단평가사자격증(평가장,1급,2급)', '문서실무사(1,2,3,4급)', '한자어능력',
						'공무원정보이용능력평가(NIT)', '디지털정보활용능력(DIAT)(초,중,고급)',
						'리눅스마스터(1,2급)', '인터넷정보관리사(전문가,1,2급)',
						'CS Leaders(관리사)', 'PC Master(정비사)', '종이접기마스터',
						'샵마스터(3급)', '패션스타일리스트',
						'E-TEST Professionals(1,2,3,4급)', '실용수학(1급,2급,3급)',
						'한국영어검정(TESL)(1,2,2A급)', '한국한자검정(1,2,3,준3급)',
						'행정관리사(1,2,3급)', '한자·한문지도사(특,1,2,3급)',
						'한자실력급수(사범,1급,2급,3급)', 'TEPS(영어능력검정)(1+,1,2,2+급)',
						'국어능력인증시험', '영어회화능력평가시험(ESPT-성인 1급,2급)',
						'PC활용능력평가시험(PCT)(A,B급)', '브레인트레이너',
						'FLEX 일본어(1A ~ 3C)', 'FLEX독일어(1A~3C)',
						'FLEX러시아(듣기/읽기)', 'FLEX스페인어(1A~3C)',
						'FLEX영어(1A~3C(9개등급))', 'FLEX중국어', 'FLEX프랑스어(1A~3C)',
						'가구설계제도사', '기계설계제도사', '무역영어(1,2,3급)',
						'상공회의소 한자(1,2,3급)', '컴퓨터운용사', '정보기술프로젝트관리전문가(IT-PMP)',
						'도로교통사고감정사', '매경TEST', '재경관리사', '회계관리(1,2급)',
						'Mate Speaking(Expert ~ Moderate Mid)',
						'Mate Writing(Expert ~ Moderate Mid)', 'YBM 商務漢檢',
						'경제이해력검증시험(TESAT)', 'AT자격시험(FAT, TAT)', '한자.한문지도사',
						'SQLS', '데이터분석전문가', '데이터분석준전문가', '데이터아키텍처전문가(DAP)',
						'지식재산능력시험', 'RFID기술자격검정(RFID-GL, RFID-SL)',
						'ERP물류정보관리사', 'ERP생산정보관리사', 'ERP인사정보관리사', 'ERP회계정보관리사',
						'GTQ', 'SMAT서비스경영자격', '정보기술자격(ITQ)시험(A,B,C급)',
						'세무회계(1,2,3급)', '전산세무회계(전산세무1,2급, 전산회계1,2급)',
						'열쇠관리사(1,2급)', '옥외광고사(2급)', '의료기기RA전문가(2급)',
						'정보보호전문가(SIS)(1,2급)', 'PC정비사(1,2급)', '네트워크관리사(2급)',
						'정보시스템감리사,한자능력자격(1,2,준2,3급)' ];
				$("#crti").click(function() {
					crtibodyone.style.display = "block";
					$('#crtinameone').autocomplete({
						source : crtiarr,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});

				})

				$("#criinsert").click(function() {
					crtibodytwo.style.display = "block";
					crtibodythr.style.display = "block";
					$('#crtinametwo').autocomplete({
						source : crtiarr,
						matchContains : true,
						selectFirst : false,
						focus : function(event, ui) {
							return false;
						}
					});

				})

			})
	
	$(function(){
		
		var school=documemnt.getElementById("school")
	$("#schoolbutton").click(function(){
		
		if(school.style.display='none'){
			
			school.style.display='block'
		}else{
			alert("내용을 삭제하겠습니까?")
			school.style.display='none';
			
			var text=document.getElementsByClassName("input-text")
			for(var i=0; i<el.length; i++){

				el[i].value = '';

			}



		}
		
		
	});
	
	})
</script>

<style type="text/css">
#sidebanner {
	position: fixed;
	top: 50px;
	left: 50%;
	margin-left: 500px;
	width: 200px;
	height: 400px;
}

#content {
	width: 980px;
	height: 1500px;
	margin: 0 auto;
}

#sidebanner_ul input {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	font-size: 20px;
}

#sidebanner_ul li {
	padding-bottom: 20px;
}
</style>
</head>
<body>

	<div id="sidebanner">

		<ul style="list-style: none;" id="sidebanner_ul">
			<li><input type="button" id="schoolbutton" value="학력"></li>

			<li><input type="button" id="careerbutton" value="경력"></li>

			<li><input type="button" id="certifibutton" value="자격증"></li>

			<li><input type="button" id="militarybutton" value="병역"></li>

			<li><input type="button" id="selfbutton" value="자기소개서"></li>
		</ul>



	</div>
	<div id="content">
		<form action="/user/ResumeDetailInsertRes.do?member_no_seq=${seq }"
			method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="member_no_seq"
				value="${seq }"> <input type="hidden" name="member_no_seq"
				value="${seq }"> <input type="hidden" name="member_no_seq"
				value="${seq }"> 
				<input type="hidden" name="member_no_seq"
				value="${seq }"> 
				<a><input type="text"
				name="resume_title" placeholder="기업에게 나를 알려줍시다."></a>
			<fieldset>
				<legend>사진등록</legend>

				<input type="hidden" id="resume_photo" name="resume_photo" value="">
				<label><img id="kfile" alt="이력서 사진" onclick="popUpImg();"
					class="imageUpload" width="103px" height="132px" /></label><br>

			</fieldset>

			<fieldset>

				<legend>인적사항</legend>
				<label><input type="text" name="member_name"
					value="${memberresume.member_name }"></label><br> <label><input
					type="text" name="member_birth" class="calendar"
					value="${memberresume.member_birth }"> </label><br> <label><select
					name="member_gender">
						<option value="${memberresume.member_gender}"
							style="font-style: oblique;">${memberresume.member_gender}</option>
						<option value="여자">여자</option>
						<option value="남자">남자</option>
				</select></label> <br> <label><input type="text" name="member_email"
					value="${memberresume.member_email}"></label><br> <label><input
					type="text" name="member_tel" value="${memberresume.member_tel}"></label><br>
				<label><input type="text" name="member_addr"
					value="${memberresume.member_addr}"></label><br>
			</fieldset>

			<div id="school">
				<table>
					<tr>
						<td><input type="button" value="초등학교 졸업" id="elementary">
							<input type="button" value="중학교 졸업" id="middle" onclick="">
							<input type="button" value="고등학교 졸업" id="high" onclick="">
							<input type="button" value="대학~대학원 이상 졸업" id="university"
							onclick=""></td>
					</tr>
					<tbody id="edubody" style="display: none;">
						<tr>
							<th>학교명</th>
							<td><input type="text" name="resume_final_edu" id="edutxt"
								style="display: none;"> <input type="text"
								placeholder="학교명 입력" class="input-text" name="resume_schoolname" id="schoolname">
							</td>
						</tr>
						<tr>
							<th>졸업 년도</th>
							<td><input type="date" id="start"
								name="resume_graduated_year"> <select
								name="resume_graduated_state">
									<option value="졸업" selected="selected">졸업</option>
									<option value="졸업 예정">졸업 예정</option>
									<option value="중퇴">중퇴</option>
							</select></td>
						</tr>
					</tbody>
					<tr id="major" style="display: none;">
						<th>전공</th>
						<td><select name="major">
								<option value="어문학" selected="selected">어문학</option>
								<option value="영어/영문">영어/영문</option>
								<option value="중어/중문">중어/중문</option>
								<option value="일어/일문">일어/일문</option>
								<option value="국어/국문">국어/국문</option>
								<option value="인문과학">인문과학</option>
								<option value="사회과학">사회과학</option>
								<option value="상경계열">상경계열</option>
								<option value="경제/경영">경제/경영</option>
								<option value="회계학">회계학</option>
								<option value="법학계열">법학계열</option>
								<option value="사법계열">사법계열</option>
								<option value="종교학">종교학</option>
								<option value="생활과학">생활과학</option>
								<option value="예/체능">예/체능</option>
								<option value="자연과학계열">자연과학계열</option>
								<option value="농수산/해양/축산">농수산/해양/축산</option>
								<option value="수학/통계학">수학/통계학</option>
								<option value="물리/천문/기상학">물리/천문/기상학</option>
								<option value="화학/생물">화학/생물</option>
								<option value="공학계열">공학계열</option>
								<option value="전기/전자/정보통신공학">전기/전자/정보통신공학</option>
								<option value="컴퓨터/시스템공학">컴퓨터/시스템공학</option>
								<option value="금속/비금속공학">금속/비금속공학</option>
								<option value="생명/화학/환경/바이오">생명/화학/환경/바이오</option>
								<option value="도시/토목/건축공학">도시/토목/건축공학</option>
								<option value="에너지/원자력공학">에너지/원자력공학</option>
								<option value="산업/자동차/우주공학">산업/자동차/우주공학</option>
								<option value="기계/조선/항공공학">기계/조선/항공공학</option>
								<option value="신소재/재료/섬유공학">신소재/재료/섬유공학</option>
								<option value="식품/유전/안전공학">식품/유전/안전공학</option>
								<option value="의학계열">의학계열</option>
						</select></td>
						<td><input type="text" class="input-text" placeholder="전공학과 입력"></td>
					</tr>

				</table>
			</div>
			<div id="career">
			<fieldset>
				<legend>경력</legend>
				<label><input type="text" name="career_ent"
					placeholder="회사이름"></label><br> <label><input
					type="text" name="career_dept" placeholder="부서명"></label> <br>
				<label><input type="text" readonly="readonly"
					name="career_startday" class="calendar">~<input type="text"
					readonly="readonly" name="career_endday" class="calendar"></label><br>
				<label><select name="career_in_office">
						<option value="Y">재직중</option>
						<option value="N">퇴사</option>

				</select></label><br> <label><input type="text" name="career_position"
					placeholder="직급/직책"></label><br> <label><input
					type="text" name="career_duty" placeholder="직무"></label> <br>
				<label><input type="text" name="career_salary" placeholder="연봉"></label> <br>
			</fieldset>
			</div>
			<div id="certificate">
				<input type="button" value="자격증" id="crti">
				<table>
					<tbody id="crtibody1" style="display: none">

						<tr>
							<th>자격증</th>
							<td><input type="text" placeholder="자격증명 입력"
								name="resume_crti_one_name" id="crtinameone"> <input
								type="button" value="자격증추가" id="criinsert"></td>
						</tr>
						<tr>
							<th>발행처/기관</th>
							<td><input type="text" placeholder="발행처/기관 입력"
								name="resume_crti_one_issue" id="crtiissueone"></td>
						</tr>
						<tr>
							<th>취득일</th>
							<td><input type="text" placeholder="취득일 입력"
								name="resume_crti_one_day" id="crtidayone"></td>
						</tr>
					</tbody>
					<tbody id="crtibody2" style="display: none">
						<tr>
							<th>자격증</th>
							<td><input type="text" placeholder="자격증명 입력"
								name="resume_crti_two_name" id="crtinametwo"></td>
						</tr>
						<tr>
							<th>발행처/기관</th>
							<td><input type="text" placeholder="발행처/기관 입력"
								name="resume_crti_two_issue" id="crtiissuetwo"></td>
						</tr>
						<tr>
							<th>취득일</th>
							<td><input type="text" placeholder="취득일 입력"
								name="resume_crti_two_day" id="crtidaytwo"></td>
						</tr>
					</tbody>
					<tbody id="crtibody3" style="display: none">
						<tr>
							<th>자격증</th>
							<td><input type="text" placeholder="자격증명 입력"
								name="resume_crti_three_name" id="crtinamethree"></td>
						</tr>
						<tr>
							<th>발행처/기관</th>
							<td><input type="text" placeholder="발행처/기관 입력"
								name="resume_crti_three_issue" id="crtiissuethree"></td>
						</tr>
						<tr>
							<th>취득일</th>
							<td><input type="text" placeholder="취득일 입력"
								name="resume_crti_three_day" id="crtidaythree"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="military">
			<fieldset>

				<legend>병역</legend>
				<label><select id="military" name="resume_military_chk">
						<option value="">병역대상</option>
						<option id="military_check" value="Y">군필/면제</option>
						<option value="N">미필/복무중</option>

				</select></label><br> <label class="military_detail" style="display: none;"><input
					type="text" class="calendar" name="resume_military_startday"
					readonly="readonly" placeholder="입대일">~ <input type="text"
					class="calendar" name="resume_military_endday" readonly="readonly"
					placeholder="제대일"></label><br> <label><select
					name="resume_military_group">
						<option value="">군별</option>
						<option value="육군">육군</option>
						<option value="해군">해군</option>
						<option value="공군">공군</option>
						<option value="해병">해병</option>
						<option value="의경">의경</option>
						<option value="전경">전경</option>
						<option value="기타">기타</option>
						<option value="공익">공익</option>
				</select> <select name="resume_military_lastclass">
						<option value="">제대 계급</option>
						<option value="이병">이병</option>
						<option value="일병">일병</option>
						<option value="상병">상병</option>
						<option value="병장">병장</option>
						<option value="하사">하사</option>
						<option value="중사">중사</option>
						<option value="상사">상사</option>
						<option value="원사">원사</option>
						<option value="준위">준위</option>
						<option value="소위">소위</option>
						<option value="중위">중위</option>
						<option value="대위">대위</option>
						<option value="소령">소령</option>
						<option value="중령">중령</option>
						<option value="대령">대령</option>
						<option value="준장">준장</option>
						<option value="소장">소장</option>
						<option value="중장">중장</option>
						<option value="대장">대장</option>
						<option value="기타">기타</option>
				</select></label><br>

			</fieldset>
			</div>
			<div id="self">
			<fieldset>
				<legend>자기소개서</legend>
				<label><input type="text" name="resume_self_one_title"
					placeholder="자기소개서 제목"></label><br> <label><textarea
						name="resume_self_one_content" rows="20" cols="100"
						placeholder="자기소개서 내용"></textarea></label><br>
			</fieldset>
			<fieldset>
				<legend>자기소개서</legend>
				<label><input type="text" name="resume_self_two_title"
					placeholder="자기소개서 제목"></label> <br> <label><textarea
						name="resume_self_two_content" rows="20" cols="100"
						placeholder="자기소개서 내용"></textarea></label><br>
			</fieldset>
			</div>
			
			<div>
				<fieldset>
		
		<legend>희망근무조건</legend>
		
			<table>
	<tr>
		<th>고용형태</th>
		<td><select name="hope_employform">
			<option value=""></option>
			<option value="정규직">정규직</option>
			<option value="계약직">계약직</option>
			<option value="병역특례">병역특례</option>
			<option value="프리랜서">프리랜서</option>
			<option value="헤드헌팅">헤드헌팅</option>
			<option  value="파견대행">파견대행</option>
			<option value="인턴직">인턴직</option>
		</select></td>
	<td><input type="radio" name="hope_afterinterview" value="Y">면접 후 결정 </td>
	<td> <input type="radio" name="hope_afterinterview" value="N">희망 연봉</td>
	<td><input type="text" placeholder="희망연봉" name="hope_salary"></td>
	</tr>
	<tr>
		<th>희망 근무지1</th>
		<td>
			<input type="hidden" name="hope_addr_one" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
		<tr>
		<th>희망 근무지2</th>
		<td>
			<input type="hidden" name="hope_addr_two" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
		<tr>
		<th>희망 근무지3</th>
		<td>
			<input type="hidden" name="hope_addr_three" value=""> 
							<select class="cd_list">
								<option value="">시</option>
							</select> 
							<select class="addr_list">
								<option value="">군/구</option>
							</select>
		
		</td>
	
	
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_one"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_two"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_three"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_four"></td>
	</tr>
	<tr>
		<th>직무 산업 키워드</th>
		<td><input type="text" name="hope_duty_keyword_five"></td>
	</tr>


</table>
</fieldset>
</div>
			<a><input type="submit" value="이력서 작성하기"></a>

		</form>
	</div>
</body>
</html>