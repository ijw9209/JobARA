window.onload = function() {
	token = $('meta[name="_csrf"]').attr('th:content');
	header = $('meta[name="_csrf_header"]').attr('th:content');
	$(".buis_regist_btn").hide();
}

//메뉴 회원/기업 나누기
function changeMenu(flag) {
	$(".menu").removeClass("active");
	$("#" + flag).addClass("active");
	if (flag == "client") {
		$(".sns-login").removeClass("hide");
		$(".user_regist_btn").show();
		$(".buis_regist_btn").hide();
	} else {
		$(".sns-login").addClass("hide");
		$(".user_regist_btn").hide();
		$(".buis_regist_btn").show();
	}
}

//아이디 유효성검사
function check(){
	if(fr.id.value == ""){
		alert('아이디를 입력해주세요.');
		fr.id.focus();
		return false;
	}else if(fr.id.value.length < 4 || fr.id.value.length > 12){ // 아이디 4~12자리로 제한
		alert('아이디는 4~12자 이내로 입력 가능합니다.');
		fr.id.focus();
		return false;
	}else if(!isNaN(fr.id.value.substr(0,1))){	//아이디 시작 숫자로할경우
		alert('아이디는 숫자로 시작할수없습니다.');
		fr.id.focus();
		return false;
	}else if(fr.password.value == ""){ //비밀번호 미입력
		alert('비밀번호를 입력해주세요.');
		fr.password.focus();
		return false;
	}else if(fr.password.value.length < 4 || fr.password.value.length > 12){ //비밀번호 4~12자리로 제한
		alert('비밀번호는 4~12자리 이상 작성해주세요');
		fr.password.focus();
		return false;
	}
	
}
//아이디저장 쿠키
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#id-remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#id-remember").change(function(){ // 체크박스에 변화가 있다면,
        if($("#id-remember").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#id-remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
