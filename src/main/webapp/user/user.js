/**
 * 회원가입 폼 value 확인하는 자바스크립트
 */
function sendit(){
	// 태그 호출
	let frm = document.joinForm;
	// 입력값 가져오기
	let user_id = frm.user_id;
	let password = frm.password;
	let password_re = frm.password_re;
	let name = frm.name;
	let email = frm.email;
	let nickname = frm.nickname;
	let tel = frm.tel;
	
	let validation = function val (){
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
			if (password.value.length < 8 || !/(?=.*[a-zA-Z])(?=.*[0-9])/.test(password.value)) {
			    alert("비밀번호는 8자리 이상이며 영문과 숫자를 포함해야 합니다.");
			    password.focus();
			    return false;
			}
			if (password.value !== password_re.value) {
			    alert("비밀번호가 일치하지 않습니다.");
			    password_re.focus();
			    return false;
			}
			// 이름 빈값 처리
			if (name.value == "") {
				alert("이름을 입력해주세요");
				name.focus();
				return false;
			}
			// 이메일 빈값 처리
			if (email.value == "") {
				alert("이메일을 입력해주세요");
				email.focus();
				return false;
			}
			// 이메일 형식 체크
			const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (!emailPattern.test(email.value)) {
				alert("유효한 이메일 주소를 입력해주세요");
				email.focus();
				return false;
			}
			// 닉네임 빈값 처리
			if (nickname.value == "") {
				alert("닉네임을 입력해주세요");
				nickname.focus();
				return false;
			}
			// 닉네임 2 이상 20자 이하 처리
			if (nickname.value.length < 2 || nickname.value.length > 20) {
				alert("닉네임을 2자 이상 20자 이하로 입력해주세요");
				nickname.focus();
				return false;
			}
			// 휴대폰 번호 빈값 처리
			if (tel.value == "") {
				alert("휴대폰번호를 입력해주세요");
				tel.focus();
				return false;
			}
			// 휴대폰 번호 형식 체크 (숫자만 입력되었는지 확인)
			const telPattern = /^[0-9]+$/;
			if (!telPattern.test(tel.value)) {
				alert("휴대폰번호는 숫자만 입력해주세요");
				tel.focus();
				return false;
			}
			return true;
	}
	// 폼으로 전달
	if (validation()) {
		alert("회원가입이 완료되었습니다.");
		frm.submit();	
	}
	
}


			

// 아이디 중복확인
function checkId() {
    const user_id = document.querySelector('#user_id').value.trim();
    
    // 아이디가 입력되지 않았을 때 처리
    if (user_id === "") {
        alert("아이디를 입력해주세요.");
        document.querySelector('#user_id').focus();
        return; // 중복확인 요청 중단
    }
    
    // 아이디 중복확인 요청
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'checkId.jsp?user_id=' + encodeURIComponent(user_id), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 서버에서 반환된 결과를 alert으로 표시
            alert(xhr.responseText);
            
        }
    };
    xhr.send();
}
