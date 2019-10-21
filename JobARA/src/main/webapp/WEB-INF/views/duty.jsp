<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	 div {overflow-Y: auto;  height: 150; list-style-type: none; float: left;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		let hire_recruit_name = '';
		let index = $("#list1 li").get();
		
		$("#duty1").click(function() {
			$(".details1").css("display","block");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty2").click(function() {
			$(".details2").css("display","block");
			$(".details1").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty3").click(function() {
			$(".details3").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty4").click(function() {
			$(".details4").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty5").click(function() {
			$(".details5").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty6").click(function() {
			$(".details6").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty7").click(function() {
			$(".details7").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty8").click(function() {
			$(".details8").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty9").click(function() {
			$(".details9").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty10").click(function() {
			$(".details10").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty11").click(function() {
			$(".details11").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty12").click(function() {
			$(".details12").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details13").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty13").click(function() {
			$(".details13").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details14").css("display","none");
		})
		$("#duty14").click(function() {
			$(".details14").css("display","block");
			$(".details1").css("display","none");
			$(".details2").css("display","none");
			$(".details3").css("display","none");
			$(".details4").css("display","none");
			$(".details5").css("display","none");
			$(".details6").css("display","none");
			$(".details7").css("display","none");
			$(".details8").css("display","none");
			$(".details9").css("display","none");
			$(".details10").css("display","none");
			$(".details11").css("display","none");
			$(".details12").css("display","none");
			$(".details13").css("display","none");
		})
		$("#detail ul > li").click(function(data) {
			
			hire_recruit_name = this.innerHTML;
			
			window.opener.document.getElementById("duty").value = hire_recruit_name;
			window.close();
			
		})
	})

</script>
</head>
<body>
		<div class="list1">
			<ul id="list1">
				<li id="duty1">경영·사무</li>
				<li id="duty2">마케팅·광고·홍보</li>
				<li id="duty3">IT·인터넷</li>
				<li id="duty4">디자인</li>
				<li id="duty5">무역·유통</li>
				<li id="duty6">영업·고객상담</li>
				<li id="duty7">서비스</li>
				<li id="duty8">연구개발·설계</li>
				<li id="duty9">생산·제조</li>
				<li id="duty10">교육</li>
				<li id="duty11">건설</li>
				<li id="duty12">의료</li>
				<li id="duty13">미디어</li>
				<li id="duty14">전문·특수직</li>
			</ul>
		</div>
		<div id="detail">
		<div class="details1" style="display: none;">
			<ul>
				<li>기획·전략·경영</li>
				<li>사무·총무·법무</li>
				<li>인사·노무·교육</li>
				<li>경리·회계·결산</li>
				<li>재무·세무·IR</li>
				<li>사무보조·문서작성</li>
				<li>비서·안내</li>
			</ul>
		</div>
		<div class="details2" style="display: none;">
			<ul>
				<li>마케팅·광고·분석</li>
				<li>홍보·PR</li>
				<li>IT·인터넷</li>
				<li>전시·컨벤션</li>
				
			</ul>
		</div>
		<div class="details3" style="display: none;">
			<ul>
				<li>웹디자인</li>
				<li>QA·테스터·검증</li>
				<li>게임</li>
				<li>ERP·시스템분석·설계</li>
				<li>IT·디자인·컴퓨터강사</li>
				<li>동영상제작·편집</li>
				<li>빅데이터·AI(인공지능)</li>
				<li>소프트웨어·하드웨어</li>
			</ul>
		</div>
		<div class="details4" style="display: none;">
			<ul>
				<li>그래픽디자인·CG</li>
				<li>출판·편집디자인</li>
				<li>제품·산업디자인</li>
				<li>캐릭터·애니메이션</li>
				<li>광고·시각디자인</li>
				<li>의류·패션·잡화디자인</li>
				<li>전시·공간디자인</li>
				<li>디자인기타</li>
			</ul>
		</div>
		<div class="details5" style="display: none;">
			<ul>
				<li>해외영업·무역영업</li>
				<li>수출입·무역사무</li>
				<li>구매·자재</li>
				<li>상품기획·MD</li>
				<li>유통·물류·재고</li>
				<li>배송·택배·운송</li>
				<li>운전·기사</li>
				<li>화물·중장비</li>
			</ul>
		</div>
		<div class="details6" style="display: none;">
			<ul>
				<li>제품·서비스·영업</li>
				<li>금융·보험영업</li>
				<li>IT·솔루션·기숧영업</li>
				<li>영업관리·지원·영업기획</li>
				<li>광고영업</li>
				<li>판매·캐셔·매장관리</li>
				<li>단순홍보·회원관리</li>
				<li>아웃바운드TM</li>
				<li>고객상담·인바운드</li>
				<li>CS관리·강의</li>
			</ul>
		</div>
		<div class="details7" style="display: none;">
			<ul>
				<li>요리·영양·제과제빵·바리스타</li>
				<li>설치·정비·A/S</li>
				<li>시설·보안·경비·안전</li>
				<li>레저·스포츠</li>
				<li>여행·항공·숙박</li>
				<li>뷰티·미용·애완</li>
				<li>주차·세차·주유</li>
				<li>청소·가사·육아</li>
				<li>이벤트·웨딩·도우미</li>
			</ul>
		</div>
		<div class="details8" style="display: none;">
			<ul>
				<li>자동차·조선·기계</li>
				<li>반도체·디스플레이</li>
				<li>화학·에너지환경</li>
				<li>전기·전자·제어</li>
				<li>기계설계·CAD·CAM</li>
				<li>통신기술·네트워크구축</li>
				<li>바이오·제약·식품</li>
				
			</ul>
		</div>
		<div class="details9" style="display: none;">
			<ul>
				<li>생산관리·공정관리·품질관리</li>
				<li>생산·제조·설비·조립</li>
				<li>포장·가공</li>
				<li>섬유·의류·패션</li>
				
			</ul>
		</div>
		<div class="details10" style="display: none;">
			<ul>
				<li>유치원·보육교사</li>
				<li>초중고·특수학교</li>
				<li>대학교수·강사·행정직</li>
				<li>보습학원·입시학원</li>
				<li>학원상담·관리·운영</li>
				<li>학습지·과외·방문교사</li>
				<li>외국어교육</li>
				<li>자격증·기술·전문교육</li>
				<li>교재기획·교수설계</li>
			</ul>
		</div>
		<div class="details11" style="display: none;">
			<ul>
				<li>건축·설계·인테리어</li>
				<li>시공·현장·감리·공무</li>
				<li>토목·조경·도시·측량</li>
				<li>전기·소방·통신·안전</li>
				<li>환경·플랜트</li>
				<li>부동산·중개·분양·경매</li>
			</ul>
		</div>
		<div class="details12" style="display: none;">
			<ul>
				<li>의사·치과·한의사</li>
				<li>약사·한약사·약무보조</li>
				<li>간호사</li>
				<li>간호조무사</li>
				<li>의료기사</li>
				<li>사무·원무·코디</li>
				<li>사무·원무·코디</li>
				<li>수의사·수의간호</li>
				<li>의료직기타</li>
			</ul>
		</div>
		<div class="details13" style="display: none;">
			<ul>
				<li>감독·연출·PD</li>
				<li>영상·사진·촬영</li>
				<li>광고제작·카피·CF</li>
				<li>아나운서·리포터·성우</li>
				<li>기자</li>
				<li>작가·시나리오</li>
				<li>연애·엔터테인먼트</li>
				<li>인쇄·출판·편집</li>
				<li>영화·배급</li>
				<li>음악·영향</li>
				<li>공연·전시·무대스텝</li>
			</ul>
		</div>
		<div class="details14" style="display: none;">
			<ul>
				<li>경영분석·컨설턴트</li>
				<li>채권·심사·보험·보상</li>
				<li>회계·세무·CPA</li>
				<li>리서치·통계·설문</li>
				<li>도서관사서</li>
				<li>법률·특허·상표</li>
				<li>외국어·번역·통역</li>
				<li>보안·경호</li>
				<li>사회복지·요양보호·자원봉사</li>
			</ul>
		</div>
		</div>

</body>
</html>