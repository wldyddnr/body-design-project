<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script>

    var confirmKey = '인증번호';
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var getName= RegExp(/^[가-힣]+$/);

	function check() {
	    var offset = $('#check').offset();
		const check = document.getElementById('check');
		$('html').animate({scrollTop : offset.top}, 200);
		if (join.id.value.length < 1) {
			check.innerHTML = '아이디를 입력하세요.';
			return false;
		}

		if (join.name.value.length < 1) {
			check.innerHTML = '이름을 입력하세요.';
			return false;
		}

		if(!getName.test(join.name.value)){
            check.innerHTML = "이름을 다시 입력해 주세요.";
            return false;
        }

		if (join.password.value.length < 1) {
			check.innerHTML = '비밀번호를 입력하세요.';
			return false;
		}

		if (join.password.value.length < 6) {
			check.innerHTML = '비밀번호를 6자 이상 입력하세요.';
			return false;
		}

		if (join.passwordConfirm.value.length < 1) {
			check.innerHTML = '비밀번호를 한번 더 입력하세요.';
			return false;
		}

		if (join.email.value.length < 1) {
			check.innerHTML = '이메일을 입력하세요.';
			return false;
		}

		if (join.emailConfirm.value.length < 1) {
			check.innerHTML = '인증번호를 입력하세요.';
			return false;
		}

		if (join.password.value != join.passwordConfirm.value) {
			check.innerHTML = '비밀번호가 일치하지 않습니다.';
			return false;
		}

        if(join.idCheck.value == 1){
            check.innerHTML = '아이디 중복확인이 필요합니다.';
            return false;
        }

        if(join.emailConfirm.value != confirmKey){
            check.innerHTML = '인증번호를 확인해 주세요.';
            return false;
        }

        if(join.id.value == join.password.value){
        check.innerHTML = '아이디와 비밀번호가 같습니다.';
        return false;
        }

        if(!getCheck.test(join.id.value)){
        check.innerHTML = '아이디는 4글자 이상 영어와 숫자만 입력해 주세요.';
        return false;
        }

        if(!getMail.test(join.mail.value)){
            check.innerHTML = "이메일형식에 맞게 입력해 주세요.";
            return false;
        }

		join.submit();
	}

	function checkId() {

        var offset = $('#check').offset();
		var id = $('#id').val();

		if (id < 1) {
            $('#check').text("아이디를 입력해주세요.");
            $('html').animate({scrollTop : offset.top}, 200);
            return false;
        }
        if(!getCheck.test(id)){
            $('#check').text("아이디는 4글자 이상 영어와 숫자만 입력해 주세요.");
            return false;
        }
		$.ajax({
			url : '/idCheck',
			type : 'get',
			data : {
				id : id
			},
			success : function(cnt) {
				if (cnt == 0) {
					$('#check').text("사용가능한 아이디입니다.");
					$('#idCheck').val(0);
				} else {
					$('#check').text("이미 사용중인 아이디입니다.");
					$('#idCheck').val(1);
				}
				$('html').animate({scrollTop : offset.top}, 200);
			}
		});
	}
	var confirmOnce = true;
	function confirmEmail() {

		const email = $('#email').val(); // 이메일 주소값 얻어오기
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('#emailConfirm') // 인증번호 입력하는곳

        if (email < 1) {
            $('#check').text("이메일을 입력하세요.");
            return false;
        }

		if(!getMail.test(email)){
		    $('#check').text("이메일형식에 맞게 입력해 주세요.");
            return false;
        }

		$.ajax({
			url : '/mailCheck',
			type : 'get',
			data : {
            	email : email
            },
			success : function (data) {
				console.log("data : " +  data);
				alert('인증번호가 전송되었습니다.');
				confirmKey = data;
				$("#emailConfirmBtn").prop("disabled", true);
			}
		});

	};
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container-sm" style="max-width: 500px;">
		<br> <br>
		<div class="mb-3">
			<h3 style="padding: 20px;">회원가입</h3>
		</div>
		<br>
		<form class="row g-3" name="join" action="join"
			onsubmit="return check(event)" method="post">
			<input type="hidden" value="1" id="idCheck" name="idCheck">
			<div class="mb-1">
				<label for="id" class="form-label">아이디 *</label>
				<div class="input-group">
					<input type="text" class="form-control" id="id" name="id" placeholder="">&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark" style="width: 30%;"
						onclick='checkId()'>중복확인</button>
				</div>
			</div>
			<div class="mb-1">
				<label for="name" class="form-label">이름 *</label> <input type="text"
					class="form-control" id="name" name="name" placeholder="">
			</div>
			<div class="mb-1">
				<label for="password" class="form-label">비밀번호 *</label> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="6자 이상 입력해주세요.">
			</div>
			<div class="mb-1">
				<label for="passwordConfirm" class="form-label">비밀번호 확인 *</label> <input
					type="password" class="form-control" id="passwordConfirm"
					placeholder="">
			</div>
			<div class="mb-1">
				<label for="email" class="form-label">이메일 *</label>
				<div class="input-group">
					<input type="text" class="form-control" id="email" name="email" placeholder="">&nbsp;&nbsp;
					<button type="button" id = "emailConfirmBtn" class="btn btn-outline-dark" style="width: 30%;" onclick="confirmEmail()">인증하기</button>
				</div>
				<br>
				<div>
					<input type="text" class="form-control" id="emailConfirm" name="emailConfirm"
						placeholder="인증번호를 입력해주세요.">
				</div>
			</div>
			<div id="check" style="text-align: center; color: blue;"></div>
			<div style="text-align: center;">
				<br> <br>
				<button type="submit" class="btn btn-dark btn-lg"
					style="width: 50%; height: 50px;">가입하기</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>