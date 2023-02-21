<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script>
	function check() {
		const check = document.getElementById('check');
		if (findPassword.email.value.length < 1) {
			check.innerHTML = '이메일을 입력하세요.';
			findPassword.email.focus();
			return false;
		}

		if (findPassword.id.value.length < 1) {
			check.innerHTML = '아이디를 입력하세요.';
			findPassword.id.focus();
			return false;
		}

		join.submit();
	}
</script>
</head>

<body>
	<jsp:include page="nav.jsp" />
	<div class="container-sm" style="max-width: 500px;">
		<br> <br>
		<div class="mb-3">
			<h3 style="padding: 20px;">비밀번호 찾기</h3>
		</div>
		<br>
		<form class="row g-3" action="findPassword"
			onsubmit="return check()" name="findPassword" method="post">
			<div class="mb-1">
				<label for="email" class="form-label">이메일</label> <input
					type="email" class="form-control" id="email" name="email" placeholder="">
			</div>
			<div class="mb-1">
				<label for="id" class="form-label">아이디</label> <input type="id"
					class="form-control" id="id" name="id" placeholder="">
			</div>
			<div style="text-align: center;">
				<a style="text-decoration: none; color: blueviolet;"
					href="findId">아이디 찾기</a>
			</div>
			<div id="check" style="text-align: center;"></div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-dark btn-lg"
					style="width: 50%; height: 50px;">비밀번호 찾기</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>