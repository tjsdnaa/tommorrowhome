/**
 * 
 */
// 회원가입 유효성 체크
// 태그 호출
	let frm = document.joinForm;
	// 입력값 가져오기
	let user_id = frm.getElementById("user_id");
	let password = frm.getElementById("password");
	let password_re = frm.getElementById("password_re");
	

	// 아이디 빈값 처리
	if (user_id.value == "") {
		alert("아이디를 입력해주세요");
		user_id.focus();
		return false;
	}
	
	// 비밀번호 빈값 처리
	if (password.value == "") {
		alert("비밀번호를 입력해주세요");
		password.focus();
		return false;
	}
	// 비밀번호 8자리 이상 처리
	if (password.value.length < 8) {
		alert("비밀번호의 자리수는 8자리 이상으로 작성해주세요");
		password.focus();
		return false;
	}
	// 비밀번호 == 비밀번호 확인 처리
	if (password.value != password_re.value) {
		alert("비밀번호 확인을 다시 하세요");
		password_re.focus();
		return false;
	}
	// 폼으로 전달
	frm.submit();
	
	// 아이디 중복 체크
	function checkId() {
		
	}
	
	document.addEventListener("DOMContentLoaded", function() {
	    // 아이디와 비밀번호 입력 필드에 대한 포커스 이벤트 처리
	    const user_id = document.getElementById('user_id');
	    const password = document.getElementById('password');

	    user_id.addEventListener('focus', function() {
	        user_id.style.border = "2px"; solid; powderblue;  
	    });

	    user_id.addEventListener('blur', function() {
	        user_id.style.border = "1px"; solid; "#ddd";
	    });

	    password.addEventListener('focus', function() {
	        password.style.border = "2px"; solid; '#e0f7fa';  
	    });

	    password.addEventListener('blur', function() {
	        password.style.border = "1px"; solid; '#fff';
	    });

	    // 로그인 버튼 클릭 시 alert 호출
	    const loginButton = document.querySelector('.btn');
	    loginButton.addEventListener('click', function(event) {
	        event.preventDefault();  // 기본 폼 제출 방지
	        const userId = userIdInput.value;
	        const password = passwordInput.value;

	        if (userId === "" || password === "") {
	            alert("아이디와 비밀번호를 입력하세요.");
	        } else {
	            alert("로그인 시도 중...");
	            // 실제 폼을 제출하려면 아래 줄의 주석을 해제하세요
	            // document.forms['loginForm'].submit();
	        }
	    });
	});