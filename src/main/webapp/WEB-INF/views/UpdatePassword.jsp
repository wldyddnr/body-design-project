<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.domain.Member" %>
<% Member member = (Member) session.getAttribute("member");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script>
	function check() {
		const check = document.getElementById('check');
		if (updatePassword.newPassword.value.length < 6) {
            check.innerHTML = '비밀번호를 6자 이상 입력하세요.';
            updatePassword.newPassword.focus();
            return false;
        }

        if (updatePassword.newPasswordConfirm.value.length < 1) {
           check.innerHTML = '비밀번호를 한번 더 입력하세요.';
           updatePassword.newPasswordConfirm.focus();
           return false;
        }

        if (updatePassword.newPassword.value != updatePassword.newPasswordConfirm.value) {
           check.innerHTML = '비밀번호가 일치하지 않습니다.';
           updatePassword.newPasswordConfirm.focus();
           return false;
        }

        if (updatePassword.password.value != <%=member.getPassword()%>){
           check.innerHTML = '현재 비밀번호가 일치하지 않습니다.';
           updatePassword.password.focus();
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
			<h3 style="padding: 20px;">비밀번호 변경</h3>
		</div>
		<br>
		<form class="row g-3" action="updatePassword" onsubmit="return check()"
			name="updatePassword" method="post">
			<div class="mb-1">
               <label for="password" class="form-label">비밀번호</label> <input type="password" class="form-control"
               id="password" name="password" placeholder="현재 비밀번호를 입력해주세요.">
            </div>
            <div class="mb-1">
               <label for="newPassword" class="form-label">새 비밀번호</label> <input type="password"
               class="form-control" id="newPassword" placeholder="">
            </div>
            <div>
               <label for="newPasswordConfirm" class="form-label">새 비밀번호 확인</label>
               <input type="password" class="form-control" id="newPasswordConfirm" placeholder="">
            </div>


			<div id="check" style="text-align: center;"></div>
			<div style="text-align: center;">
				<button type="submit" class="btn btn-dark btn-lg"
					style="width: 50%; height: 50px;">비밀번호 변경</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>