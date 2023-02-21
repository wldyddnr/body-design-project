<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

    window.Kakao.init('f23dd1e144155c8ddaa625e38ef2ef65');

    function kakaoLogin(){
        window.Kakao.Auth.login({
            scope: 'profile_nickname, account_email',
            success: function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                url:'v2/user/me',
                success : res =>{
                    const Kakao_account = res.Kakao_account;
                    console.log(Kakao_account);
                }
            });
        }
    });
    };

	function check() {
		const check = document.getElementById('check');
		if (login.id.value.length < 1) {
			check.innerHTML = '아이디를 입력하세요.';
			login.id.focus();
			return false;
		}

		if (login.password.value.length < 1) {
			check.innerHTML = '비밀번호를 입력하세요.';
			login.password.focus();
			return false;
		}

		if (login.password.value.length < 6) {
			check.innerHTML = '비밀번호 형식이 맞지 않습니다.';
			login.password.focus();
			return false;
		}

		login.submit();
	}



</script>
</head>

<body>
	<jsp:include page="nav.jsp"/>
	<div class="container-sm" style="max-width: 500px;">
		<br> <br>
		<div class="mb-3">
			<h3 style="padding: 20px;">로그인</h3>
		</div>
		<br>
		<form class="row g-3" action="/login" onsubmit="return check()"
			name="login" method="post">
			<div class="mb-1">
				<label for="id" class="form-label">아이디</label> <input type="text"
					class="form-control" id="id" placeholder="" name="id">
			</div>
			<div class="mb-1">
				<label for="password" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="password" name="password" placeholder="">
			</div>
			<div style="text-align: center;">
				<a style="text-decoration: none; color: blueviolet;"
					href="findPassword">아이디/비밀번호를 잊으셨나요?</a>
			</div>
			<div id="check" style="text-align: center;"></div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-dark btn-lg"
					style="width: 50%; height: 50px;">로그인하기</button>
			</div>
		</form>
		<div style="text-align: center;">
			<br>
			<button type="button" class="btn btn-outline-dark btn-lg"
				style="width: 50%; height: 50px;"
				onclick="location.href='joinForm' ">회원 가입하기</button>
		</div>
		<div style="text-align: center;">
        			<br>
        			<a href="javascript:kakaoLogin();"><img src="https://m.stco.co.kr/Content/images/login/kakao_login.png" style="height:60px;width:auto;">
        		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>