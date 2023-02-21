<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.domain.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script>
	function check() {
		const check = document.getElementById('check');
		if (findId.email.value.length < 1) {
			check.innerHTML = '이메일을 입력하세요.';
			findId.email.focus();
			return false;
		}

		if (findId.name.value.length < 1) {
			check.innerHTML = '이름을 입력하세요.';
			findId.name.focus();
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
			<h3 style="padding: 20px;">아이디 찾기</h3>
		</div>
		<br>
		<form class="row g-3" action="findId" onsubmit="return check()"
			name="findId" method="post">
			<div class="mb-1">
				<label for="email" class="form-label">이메일</label> <input
					type="email" class="form-control" id="email" name="email" placeholder="">
			</div>
			<div class="mb-1">
				<label for="name" class="form-label">이름</label> <input type="name"
					class="form-control" id="name" name="name" placeholder="">
			</div>
			<div style="text-align: center;">
				<a style="text-decoration: none; color: blueviolet;"
					href="findPassword">비밀번호 찾기</a>
			</div>
			<div id="check" style="text-align: center;"></div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-dark btn-lg"
					style="width: 50%; height: 50px;">아이디 찾기</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>